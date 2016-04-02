class City < ActiveRecord::Base
  belongs_to :state
  delegate :country, to: :state

  has_many :addresses, dependent: :nullify
end
