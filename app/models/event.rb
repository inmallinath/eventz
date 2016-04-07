class Event < ActiveRecord::Base
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address#, reject_if: proc { |attributes| attributes['title'].blank? }
  belongs_to :event_category
  belongs_to :unit
  belongs_to :speaker, class_name: "User"
  # has_many :cities, through: :address
  # has_many :addresses, dependent: :destroy

  validates :title, presence: true

  def to_s
    title
  end


  def self.for_date(date)
    where(date: date)
  end

  def start_time
    self.event_on
  end

  # def find_by_city(city)
  #   .where(address.city = "#{city}")
  # end

  # scope :for_date, lambda {|query|
  #                   where (["date = ?", "%#{query}%"])}
end
