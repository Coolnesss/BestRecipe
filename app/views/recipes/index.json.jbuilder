json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :description
  json.url recipe_url(recipe, format: :json)
end
