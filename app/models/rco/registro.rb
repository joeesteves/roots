class Rco::Registro < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :asiento
  delegate :codigo, :to => :asiento, :prefix => false # delgado hasta asiento / operacion / operaciontipo
  has_one :organizacion, class_name: "Rba::Organizacion"
  delegate :id, :to => :asiento, :prefix => true 
  belongs_to :cuenta
  delegate :codigo, :nombre, :esCtaCte?, :to => :cuenta, :prefix => true
  # El registro tiene aplicaciones al debe a traves de reg_haber_id (que lo id) y al revés también
  has_many :aplicaciones_debe, class_name: "Rco::Aplicacion", foreign_key: "reg_haber_id"
  has_many :aplicaciones_haber, class_name: "Rco::Aplicacion", foreign_key: "reg_debe_id"
  has_many :reg_debe, through: :aplicaciones_debe, :dependent => :destroy
  has_many :reg_haber, through: :aplicaciones_haber, :dependent => :destroy
  scope :alDebe, -> { where(:haber => 0 ).joins(cuenta: :cuentatipo).where(rco_cuentatipos: {codigo: Rco::Cuenta.ctasCtes}) }
  scope :alHaber, -> { where(:debe => 0 ).joins(cuenta: :cuentatipo).where(rco_cuentatipos: {codigo: Rco::Cuenta.ctasCtes}) }
  scope :conCuenta, -> (cuentas) {  where('rco_registros.cuenta_id in (?)', cuentas) unless cuentas == [""] }
  validates :cuenta_id, presence:  { message: "Debe indicar una cuenta"}
  
  validate do |registro|
    registro.debe_haber
  end
  
  def debe_haber
  	unless debe_op != haber_op and [haber_op,debe_op].include? 0
  		destroy
  		errors.add(:cuenta_id, ": Revisar linea. Debe y haber deben ser distintos y al menos uno igual a 0")	
    end
  end
  
  def self.saldoCta(ctas, fecha, empresa)
    where(:cuenta_id => ctas).
    where('rco_registros.fecha <= :fecha', :fecha => fecha).
    includes(:asiento).
    where('rco_asientos.empresa_id in (?)', empresa).
    references(:asiento).
    sum('coalesce(debe,0) - coalesce(haber,0)', :group => :cuenta_id)

  end 

  def self.saldoMesCta(ctas, fecha, empresa)
    where(:cuenta_id => ctas).
    where('month(rco_registros.fecha) = :mes and year(rco_registros.fecha) = :year ', :mes => fecha.month, :year => fecha.year).
    includes(:asiento).
    where('rco_asientos.empresa_id in (?)', empresa).
    references(:asiento).
    sum('coalesce(debe,0) -coalesce(haber,0)', :group => :cuenta_id)
  end

  def self.saldoPeriodoCta(ctas, desde, hasta, empresa)
    where(:cuenta_id => ctas).
    where('rco_registros.fecha > :desde AND rco_registros.fecha <= :hasta', :desde => desde, :hasta => hasta).
    includes(:asiento).
    where('rco_asientos.empresa_id in (?)', empresa).
    references(:asiento).
    sum('coalesce(debe,0) -coalesce(haber,0)', :group => :cuenta_id)
  end  

  def self.filtros(empresa_ids, desde, hasta, cuentas, ver_saldos)
    ##revisar esto genera el json ok. Pero jqxgrid lee solo algunos registros
    if ver_saldos == "1"
      # find_by_sql('select rco_registros.*, (rco_registros.debe - coalesce(sum(apHaber.importe),0)) as pendienteDebe, 
      # (rco_registros.haber - coalesce(sum(apDebe.importe),0)) as pendienteHaber, rco_asientos.desc as descripcion, rco_asientos.empresa_id
      # from rco_registros left outer JOIN rco_asientos on rco_asientos.id = rco_registros.asiento_id
      # left outer join rco_aplicaciones as apDebe on rco_registros.id = apDebe.reg_haber_id
      # left outer join rco_aplicaciones as apHaber on rco_registros.id = apHaber.reg_debe_id
      # where cuenta_id=338
      # group by rco_registros.id having coalesce(sum(apDebe.importe),0) < rco_registros.haber OR coalesce(sum(apHaber.importe),0) < rco_registros.debe')
      select('rco_registros.*, (rco_registros.debe - coalesce(sum(apHaber.importe),0)) as pendienteDebe, 
        (rco_registros.haber - coalesce(sum(apDebe.importe),0)) as pendienteHaber, rco_asientos.desc').
      joins('left outer JOIN rco_asientos on rco_asientos.id = rco_registros.asiento_id').
      pendientes.
      where('rco_asientos.empresa_id in (?)', empresa_ids).
      where('rco_registros.fecha >= ?', desde).
      where('rco_registros.fecha <= ?', hasta).
      conCuenta(cuentas).order(:cuenta_id, :fecha, :id)
    else 
      includes(:asiento).
      includes(:cuenta).
      where('rco_asientos.empresa_id in (?)', empresa_ids).
      where('rco_registros.fecha >= ?', desde).
      where('rco_registros.fecha <= ?', hasta).
      conCuenta(cuentas).order(:cuenta_id, :fecha, :id).
      references(:asiento)
    end
  end
  

  def self.pendientes
    joins('left outer join rco_aplicaciones as apDebe on rco_registros.id = apDebe.reg_haber_id').
    joins('left outer join rco_aplicaciones as apHaber on rco_registros.id = apHaber.reg_debe_id').
    group('rco_registros.id').
    having('coalesce(sum(apDebe.importe),0) < rco_registros.haber OR coalesce(sum(apHaber.importe),0) < rco_registros.debe')
  end

  def self.compatibles_organizacion(organizacion_id, codigo)
    compatibles = {}
    compatibles['origen'] = []
    compatibles['destino'] = []
    case codigo
      when -2  # [pago]
        compatibles['origen'] = compatibles_del_debe(organizacion_id)
      when 2 # [cobranza] 
        compatibles['origen'] = compatibles_del_haber(organizacion_id)
      when 3 # [provision ingreso]
        compatibles['destino'] = compatibles_del_haber(organizacion_id)
      when -3 # [provision egreso]
        compatibles['destino'] = compatibles_del_debe(organizacion_id)
      when 1 # [ingreso]
        compatibles['origen'] = compatibles_del_haber(organizacion_id)
        compatibles['destino'] = compatibles_del_debe(organizacion_id)
      when -1 # [egreso]
        compatibles['origen'] = compatibles_del_debe(organizacion_id)
        compatibles['destino'] = compatibles_del_haber(organizacion_id)
      else
        none
      end
      compatibles
   end

  def self.compatibles_del_debe(organizacion_id)
    alHaber.
    where(:organizacion_id => organizacion_id).
    includes(:aplicaciones_debe).
    having('sum(rco_aplicaciones.importe) < rco_registros.haber OR rco_aplicaciones.importe is null').
    group('rco_registros.id').references(:aplicaciones_debe)
  end

  def self.compatibles_del_haber(organizacion_id)
    alDebe.
    where(:organizacion_id => organizacion_id).
    includes(:aplicaciones_haber).
    having('sum(rco_aplicaciones.importe) < rco_registros.debe OR rco_aplicaciones.importe is null').
    group('rco_registros.id').references(:aplicaciones_haber)
  end
  # devuelve las aplicaciones que tiene cada registro y guarda la logica si es debe o haber

  def operacion
    asiento.operacion
  end

  def operacion_registros(al_haber_o_al_debe)
    registros = []
    case al_haber_o_al_debe 
      when 'al_debe'
        operacion.registros.alHaber.each do |reg|
          registros += reg.reg_debe
        end
      when 'al_haber'
        operacion.registros.alDebe.each do |reg|
          registros += reg.reg_haber
        end
      end
  end

  def aplicados
    aplicados = {}
    aplicados['origen'] = []
    aplicados['destino'] = []
    case codigo
      when -2 #[pago]
        aplicados['origen'] = operacion_registros('al_haber')
      when  2 #[cobranza]
        aplicados['origen'] = operacion_registros('al_debe')
      when -3 #[prov egresos]
        aplicados['destino'] = operacion_registros('al_debe')
      when 3 #[prov ingresos]
        aplicados['destino'] = operacion_registros('al_haber')
      when -2 #[egresos]
        aplicados['destino'] = operacion_registros('al_debe')
        aplicados['origen'] = operacion_registros('al_haber')
      when 2 #[ingresos]
        aplicados['destino'] = operacion_registros('al_haber')
        aplicados['origen'] = operacion_registros('al_debe')
      else
    end
    aplicados
  end

  #devuelve si el registro tiene saldo al debe o al haber
  def saldoTipo
    unless debe == 0 || debe.nil?
      "debe"
    else
      "haber"
    end
  end

  def compatibles
    organizacion_id = organizacion_id
    codigo = codigo
    buscar_aplicados = aplicados
    compatibles = Rco::Registro.compatibles_organizacion(organizacion_id, codigo)
    compatibles['origen'] |= buscar_aplicados['origen']
    compatibles['destino'] |= buscar_aplicados['destino']
    compatibles
  end

end
