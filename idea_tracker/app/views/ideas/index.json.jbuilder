json.array!(@ideas) do |idea|
  json.extract! idea, :id, :user_id, :description, :provider_id, :receiver_id, :submission_date, :last_modified, :status_date_change
  json.url idea_url(idea, format: :json)
end
