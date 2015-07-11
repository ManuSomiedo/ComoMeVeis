json.array!(@habilities) do |hability|
  json.extract! hability, :id, :name
  json.url hability_url(hability, format: :json)
end
