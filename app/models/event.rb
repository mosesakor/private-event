class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :user

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  scope :past, -> {where("date < ?", DateTime.current)}
  scope :upcoming, -> {where("date > ?", DateTime.current)}
end
