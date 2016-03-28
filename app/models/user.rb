class User < ActiveRecord::Base
  belongs_to :address
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :providers, dependent: :destroy
  has_many :user_events, dependent: :destroy

  has_secure_password

  attr_accessor :current_password

  validates :password, length: {minimum:6}, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, if: :changing_password?
  validates :password_confirmation, presence: true, if: :changing_password?
  validates :email, presence: true
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/#, :multiline => true
  validates_format_of :mobile, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  private

  def changing_password?
    current_password.present?
  end
end
