class Rco::Registro < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :asiento
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

  def self.compatiblesXOrganizacion(organizacion_id, saldo_tipo, opciones = {})
    saldo_tipo = "debe_haber" if [1,-1].include? opciones[:operaciontipo_codigo].to_i
    case saldo_tipo
      when "haber"
        alDebe.
        where(:organizacion_id => organizacion_id).
        includes(:aplicaciones_haber).
        having('sum(rco_aplicaciones.importe) < rco_registros.debe OR rco_aplicaciones.importe is null').
        group('rco_registros.id').references(:aplicaciones_haber)
      when "debe"
        alHaber.
        where(:organizacion_id => organizacion_id).
        includes(:aplicaciones_debe).
        having('sum(rco_aplicaciones.importe) < rco_registros.haber OR rco_aplicaciones.importe is null').
        group('rco_registros.id').references(:aplicaciones_debe)
      when "debe_haber"
        alDebe.
        where(:organizacion_id => organizacion_id).
        includes(:aplicaciones_haber).
        having('sum(rco_aplicaciones.importe) < rco_registros.debe OR rco_aplicaciones.importe is null').
        group('rco_registros.id').references(:aplicaciones_haber) |
        alHaber.
        where(:organizacion_id => organizacion_id).
        includes(:aplicaciones_debe).
        having('sum(rco_aplicaciones.importe) < rco_registros.haber OR rco_aplicaciones.importe is null').
        group('rco_registros.id').references(:aplicaciones_debe)
      else
        none
      end
  end

  # devuelve las aplicaciones que tiene cada registro y guarda la logica si es debe o haber

  def operacion
    asiento.operacion
  end

  def aplicados
    case saldoTipo
	    when "debe"
	      reg_haber
	    when "haber"
        registros = Array.new()
        operacion.registros.alHaber.each do |reg|
          registros += reg.reg_debe
        end
        registros
	    else
	     none
    end
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
    Rco::Registro.compatiblesXOrganizacion(organizacion_id, saldoTipo) | aplicados
  end

end
