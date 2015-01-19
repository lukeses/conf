class Task < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :organiser
  belongs_to :speaker
  belongs_to :event
end
