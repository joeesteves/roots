class Rco::Registro < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :asiento
  belongs_to :cuenta
  delegate :codigo, :nombre, :esCtaCte?, :to => :cuenta, :prefix => true 
  # El registro tiene aplicaciones al debe a traves de reg_haber_id (que lo id) y al revés también
  has_many :aplicaciones_debe, class_name: "Rco::Aplicacion", foreign_key: "reg_haber_id"
  has_many :aplicaciones_haber, class_name: "Rco::Aplicacion", foreign_key: "reg_debe_id"
  has_many :reg_debe, through: :aplicaciones_debe, :dependent => :destroy
  has_many :reg_haber, through: :aplicaciones_haber, :dependent => :destroy
  scope :alDebe, -> { where(:haber => 0 ) }
  scope :alHaber, -> { where(:debe => 0 ) }
  scope :cuyaCuentaEs, -> (cuentas) {  where('rco_registros.cuenta_id in (?)', cuentas) unless cuentas == [""] }



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

  def self.filtros(empresa_ids, desde, hasta, cuentas)
    includes(:asiento).
    where('rco_asientos.empresa_id in (?)', empresa_ids).references(:asiento)
    where('rco_registros.fecha >= ?', desde).
    where('rco_registros.fecha <= ?', hasta).
    cuyaCuentaEs(cuentas)
  end

  def self.compatiblesXCta(cuenta_id, saldoTipo)
    cuenta = Rco::Cuenta.find(cuenta_id)
    if cuenta.esCtaCte?
      case saldoTipo
      when "haber"
        alDebe.
        where(:cuenta_id => cuenta_id).
        includes(:aplicaciones_haber).
        having('sum(rco_aplicaciones.importe) < rco_registros.debe OR rco_aplicaciones.importe is null').
        group('rco_registros.id').references(:aplicaciones_haber)
      when "debe"
        alHaber.
        where(:cuenta_id => cuenta_id).
        includes(:aplicaciones_debe).
        having('sum(rco_aplicaciones.importe) < rco_registros.haber OR rco_aplicaciones.importe is null').
        group('rco_registros.id').references(:aplicaciones_debe)
      else
        none
      end
    else
      none
    end
  end

  # devuelve las aplicaciones que tiene cada registro y guarda la logica si es debe o haber


  def aplicados
    case saldoTipo
    when "debe"
      reg_haber
    when "haber"
      reg_debe
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
    Rco::Registro.compatiblesXCta(cuenta_id, saldoTipo) | aplicados
  end

end
