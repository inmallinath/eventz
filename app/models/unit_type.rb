class UnitType < ActiveRecord::Base
  has_many :units, dependent: :destroy
end
