json.array!(@invoces) do |invoce|
  json.extract! invoce, :id, :id_order_type, :id_order_type, :shop, :quantity, :invoce_number, :invocedate
  json.url invoce_url(invoce, format: :json)
end
