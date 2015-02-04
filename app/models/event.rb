class Event < ActiveRecord::Base
  has_many :event_organisers, inverse_of: :event
  has_many :organisers, through: :event_organisers

  has_many :participants
  has_many :speakers, dependent: :destroy
  has_many :sponsors, dependent: :destroy
  has_many :tasks, dependent: :destroy

end
