class Event < ApplicationRecord

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  validates :duration, presence: true, numericaly: {only_integer: true, other_than: 0, }
  validates :start_date, presence: true
  validates :start_date_cannot_be_in_the_past
  validates :duration_multiple
  validates :title, presence: true, lenght: {in: 5..140}
  validates :description, presence: true, lenght: {in: 20..1000}
  validates :price, presence: true, numericaly: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, message: 'Doit être compris entre 1€ et 1000€' }
  validates :location, presence: true

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "Date non valide")
    end
  end

  def duration_multiple
    if duration / 5 != 0
      errors.add(:duration, "Durée non valide, 5min par 5min")
    end
  end



end
