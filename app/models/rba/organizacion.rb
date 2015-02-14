class Rba::Organizacion < ActiveRecord::Base
  belongs_to :catfiscal
  belongs_to :organizaciontipo
end
