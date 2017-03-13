class Hit < ActiveRecord::Base
  belongs_to :hittable, polymorphic: true

  validates_presence_of :hittable, :hittable_type

  IGNORE_THRESHOLD = 1.minute

  LOCATION_ATTRS = %w(latitude longitude city)

  def location=(location_attrs)
    assign_attributes(location_attrs.slice(*LOCATION_ATTRS))
  end
end
