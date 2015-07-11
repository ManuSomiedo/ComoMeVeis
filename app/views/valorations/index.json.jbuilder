json.array!(@valorations) do |valoration|
  json.extract! valoration, :id, :user_id, :hability_id, :points, :date
  json.url valoration_url(valoration, format: :json)
end
