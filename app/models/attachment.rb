class Attachment < ActiveRecord::Base
  has_many :attachments
  belongs_to :task
end
