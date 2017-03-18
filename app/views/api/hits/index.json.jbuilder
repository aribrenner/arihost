json.key_format! camelize: :lower
json.total_hits @hits.count
json.uniq_hits @hits.group(:ip).count.count
json.timeline @hits.order(:created_at).pluck(:created_at).map { |t| t.to_f * 1000 }
json.referer @referer
json.hits @hits.map { |h| HitSerializer.new(h).as_json }
