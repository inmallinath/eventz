class Event < ActiveRecord::Base
  belongs_to :address
  belongs_to :event_category
  belongs_to :unit
  belongs_to :speaker, class_name: "User"
  # has_many :cities, through: :address


  def self.for_date(date)
    where(date: date)
  end

  # def find_by_city(city)
  #   .where(address.city = "#{city}")
  # end

  # scope :for_date, lambda {|query|
  #                   where (["date = ?", "%#{query}%"])}
end
