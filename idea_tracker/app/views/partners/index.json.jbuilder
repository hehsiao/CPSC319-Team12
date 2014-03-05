json.array!(@partners) do |partner|
  json.extract! partner, :id, :partner_name, :contact_name, :email, :phone_num
  json.url partner_url(partner, format: :json)
end
