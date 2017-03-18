class HitSerializer < ActiveModel::Serializer

  attributes :meta, :timestamp, :ip

  def timestamp
    object.created_at.to_f * 1000
  end
end
