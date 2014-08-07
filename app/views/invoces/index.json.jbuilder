json.array!(@invoces) do |invoce|
  json.extract! invoce, :id, :invoced_company_id, :order_type_id, :shop, :quantity, :invoce_number, :invocedate
  json.url invoce_url(invoce, format: :json)
end
