class Organiser < ActiveRecord::Base
  has_many :event_organisers
  has_many :events, through: :event_organisers
  has_many :tasks
end
