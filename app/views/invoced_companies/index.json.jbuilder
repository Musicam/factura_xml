json.array!(@invoced_companies) do |invoced_company|
  json.extract! invoced_company, :id, :name
  json.url invoced_company_url(invoced_company, format: :json)
end
