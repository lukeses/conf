class EventOrganiser < ActiveRecord::Base
  belongs_to :event
  belongs_to :organiser
end
