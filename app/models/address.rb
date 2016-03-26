class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country

  has_many :users, dependent: :nullify
  has_many :organizations, dependent: :nullify
  has_many :events, dependent: :nullify
end
