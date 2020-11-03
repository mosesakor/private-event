class Event < ApplicationRecord
  scope :past_events, -> {where("date < ?", DateTime.current)}
  scope :upcoming_events, -> {where("date > ?", DateTime.current)}

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :title, presence: true, length: { minimum: 6, maximum: 140 }
  validates :description, presence: true, length: { minimum: 15, maximum: 1500 }
  validates :date, presence: true
  validates :location, presence: true
end
