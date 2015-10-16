json.array!(@images) do |image|
  json.extract! image, :id, :caption, :title
  json.url image_url(image, format: :json)
end
