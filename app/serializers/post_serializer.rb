class PostSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :body
  has_many :comments
end
