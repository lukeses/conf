class Organiser < ActiveRecord::Base
  has_many :event_organisers, inverse_of: :organiser
  has_many :events, through: :event_organisers
  has_many :tasks
end
