class Hit < ActiveRecord::Base
  belongs_to :node

  validates_presence_of :node
end
