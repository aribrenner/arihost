json.key_format! camelize: :lower
json.total_hits @count
json.uniq_hits @uniq_hits
json.timeline @timeline
json.referer @referer
json.hits @serialized_hits
