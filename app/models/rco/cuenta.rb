class Rco::Cuenta < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :cuentatipo
  has_many :registros
  belongs_to :empresagrupo, :class_name => "Rba::Empresagrupo"
  
  def self.conSaldo(tipos, empresagrupo_id)
  	deEmpresaGrupoXId(empresagrupo_id).includes(:cuentatipo).
  	where('rco_cuentatipos.codigo = ?', tipos).
  	joins(:registros).group('rco_cuentas.id').
		having('coalesce(sum(rco_registros.debe),0)-coalesce(sum(rco_registros.haber),0) != 0').
		references(:cuentatipo,:registros)
  end
  
end
