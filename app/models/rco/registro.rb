class Rco::Registro < ActiveRecord::Base
  include ModeloGlobales
  habtm_nodo
  belongs_to :asiento
  belongs_to :cuenta
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

end
