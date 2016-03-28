class Country < ActiveRecord::Base
  has_many :states,
    inverse_of: :country,
      dependent: :destroy
  has_many :cities,
    through: :states
  has_many :addresses, dependent: :nullify
end
