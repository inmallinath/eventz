class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country
  geocoded_by :full_street_address
    after_validation :geocode

  # has_many :users, dependent: :nullify
  # has_many :organizations, dependent: :nullify
  # has_many :events, dependent: :nullify

  def full_street_address
    [description, zip, city, state, description].compact.join(', ')
  end

end
