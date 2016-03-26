class Unit < ActiveRecord::Base
  belongs_to :unit_type
  belongs_to :organization_unit
  has_many :events
end
