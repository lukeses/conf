class EventOrganiser < ActiveRecord::Base
  belongs_to :event
  belongs_to :organiser

  validates_uniqueness_of :event_id, :scope => :organiser_id

end
