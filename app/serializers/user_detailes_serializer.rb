class UserDetailesSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  set_type 'user'
  attributes :first_name, :last_name, :created_at

  has_many :posts
  has_many :comments
end
