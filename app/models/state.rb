class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities,
    inverse_of: :state,
      dependent: :destroy
  has_many :addresses, dependent: :nullify
end
