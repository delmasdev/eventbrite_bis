class Attendance < ApplicationRecord

  belongs_to :user
  belongs_to :event
  belongs_to :stripe_customer_id

  validates :user, presence: true
  validates :event, presence: true
  validates :stripe_customer_id, presence: true

end
