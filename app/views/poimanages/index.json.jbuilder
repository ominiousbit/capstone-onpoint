json.array!(@poimanages) do |poimanage|
  json.extract! poimanage, :id, :latitude, :longitude, :description, :title
  json.url poimanage_url(poimanage, format: :json)
end
