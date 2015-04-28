class Rga::AnimalesRegistro < ActiveRecord::Base
  belongs_to :animal
  belongs_to :registro
end
