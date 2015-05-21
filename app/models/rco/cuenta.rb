class Rco::Cuenta < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :cuentatipo
  delegate :codigo, :to => :cuentatipo, :prefix => true
  has_many :registros
  has_one :organizacion, :class_name => "Rba::Empresagrupo"
  belongs_to :empresagrupo, :class_name => "Rba::Empresagrupo"
  before_save :organizacion_solo_en_tarjeta

  def self.ctasCtes
    ['1.2','1.9','2.1','2.2','2.9']
  end
  
  def self.xTipos(tipos, empresagrupo_id)
    deEmpresaGrupoXId(empresagrupo_id).
    includes(:cuentatipo).
    where('rco_cuentatipos.codigo in (?)', tipos).references(:cuentatipo)
  end 
  
  def self.conSaldo(tipos, fecha, empresagrupo_id)
    xTipos(tipos, empresagrupo_id).
    joins(:registros).group('rco_cuentas.id').
    where('rco_registros.fecha <= :fecha', :fecha => fecha).
    having('coalesce(sum(rco_registros.debe),0)-coalesce(sum(rco_registros.haber),0) != 0').
    references(:registros)
  end
  def es_tarjeta?
    if cuentatipo_codigo == '2.1'
      true
    else
      false
    end
  end

  def self.xOperacionTipo(operacionTipoCodigo, empresagrupo_id)
    cuentas = {}

    case operacionTipoCodigo
      when '-3' # Provisión Egresos
        cuentas[:debe] = Rco::Cuenta.xTipos([5.0], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([2.9], empresagrupo_id)
      when '-2' # Pagos
        cuentas[:debe] = Rco::Cuenta.xTipos([2.1,2.2,2.9], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([1.1,2.1,2.2], empresagrupo_id) 
      when '-1' # Egresos
        cuentas[:debe] = Rco::Cuenta.xTipos([5.0,2.9], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([1.1,2.1,2.2], empresagrupo_id)
      when '0' # Movimiento de fondos
        cuentas[:debe] = Rco::Cuenta.xTipos([1.1,1.2,2.2,3.0], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([1.1,1.2,2.2,3.0], empresagrupo_id)
      when '1' # Ingresos
        cuentas[:debe] = Rco::Cuenta.xTipos([1.1,1.2], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([4.0,1.9], empresagrupo_id)
      when '2' #Cobranzas
        cuentas[:debe] = Rco::Cuenta.xTipos([1.1], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([1.2,1.9], empresagrupo_id)
      when '3' # Provisión Ingresos
        cuentas[:debe] = Rco::Cuenta.xTipos([1.9], empresagrupo_id)
        cuentas[:haber] = Rco::Cuenta.xTipos([4.0], empresagrupo_id)
    end
    cuentas
  end  

  def organizacion_solo_en_tarjeta
    unless cuentatipo_codigo == '2.1'
      self.organizacion_id = nil
    end
  end

  def esCtaCte?
   Rco::Cuenta.ctasCtes.include? cuentatipo_codigo 
  end

end
