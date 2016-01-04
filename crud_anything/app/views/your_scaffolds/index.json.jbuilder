json.array!(@your_scaffolds) do |your_scaffold|
  json.extract! your_scaffold, :id, :title, :description, :image
  json.url your_scaffold_url(your_scaffold, format: :json)
end
