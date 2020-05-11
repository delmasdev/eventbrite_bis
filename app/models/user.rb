class User < ApplicationRecord

  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: {with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "email adress please"}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


end
