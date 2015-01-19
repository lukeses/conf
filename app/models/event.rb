class Event < ActiveRecord::Base
  has_many :event_organisers
  has_many :organisers, through: :event_organisers

  has_many :participants
  has_many :speakers
  has_many :sponsors
  has_many :tasks

end
