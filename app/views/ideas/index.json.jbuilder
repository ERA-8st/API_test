json.data do |json|
  json.array!(@ideas) do |idea|
    json.id idea.id
    json.category idea.category.name
    json.body idea.body
  end
end