class User < ActiveRecord::Base
  belongs_to :address
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :providers, dependent: :destroy
end
