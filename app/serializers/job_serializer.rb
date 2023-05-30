class JobSerializer 
  include JSONAPI::Serializer
  attributes :id, :title, :url, :company, :location, :description, :date_applied, :status, :min_salary, :max_salary, :user_id, :created_at 
end