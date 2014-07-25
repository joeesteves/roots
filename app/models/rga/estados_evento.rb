class Rga::EstadosEvento < ActiveRecord::Base
  belongs_to :estado
  belongs_to :evento
end
