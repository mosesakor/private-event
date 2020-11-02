class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  def previous_events
    attended_events.where("date < ?", Time.current)
  end

  def upcoming_events
    attended_events.where("date > ?", Time.current)
  end


end
