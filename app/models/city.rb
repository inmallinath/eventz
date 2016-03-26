class City < ActiveRecord::Base
  belongs_to :state,
    inverse_of: :cities

  has_many :addresses, dependent: :nullify
end
