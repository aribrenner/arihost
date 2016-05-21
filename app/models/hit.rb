class Hit < ActiveRecord::Base
  belongs_to :hitable, polymorphic: true

  validates_presence_of :hitable, :hitable_type
end
