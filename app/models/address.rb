class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country
  geocoded_by :full_street_address
    after_validation :geocode


  # has_one :event
  # has_many :users, dependent: :nullify
  # has_many :organizations, dependent: :nullify
  has_many :events, inverse_of: :address, dependent: :nullify

  def full_street_address
    [description, zip, city.code, state.code, country.description].compact.join(', ')
  end

end
