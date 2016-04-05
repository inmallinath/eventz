class Event < ActiveRecord::Base
  has_one :address
  accepts_nested_attributes_for :address
  belongs_to :event_category
  belongs_to :unit
  belongs_to :speaker, class_name: "User"
  # has_many :cities, through: :address
  # has_many :addresses, dependent: :destroy


  def self.for_date(date)
    where(date: date)
  end

  # def find_by_city(city)
  #   .where(address.city = "#{city}")
  # end

  # scope :for_date, lambda {|query|
  #                   where (["date = ?", "%#{query}%"])}
end
