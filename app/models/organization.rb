class Organization < ActiveRecord::Base
  belongs_to :representative, class_name: "User"
  has_many :organization_units, dependent: :destroy
  has_many :units, through: :organization_units

  has_many :organization_addresses, dependent: :destroy
  has_many :addresses, through: :organization_addresses
end
