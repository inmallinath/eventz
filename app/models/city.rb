class City < ActiveRecord::Base
  belongs_to :state
  delegate :country, to: :state

  has_many :addresses, inverse_of: :city, dependent: :nullify
  has_many :events, through: :addresses

  def city_country
    "#{code}" + ", " + "#{country.description}"
  end
end
