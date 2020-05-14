class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: {with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "email adress please"}


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

   def recoverable
    UserMailer.reset_passsword_instruction(self).deliver_now
  end


end
