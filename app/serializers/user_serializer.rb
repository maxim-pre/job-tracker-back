class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :first_name, :last_name, :target_title, :salary_max, :salary_min, :application_goal
end
