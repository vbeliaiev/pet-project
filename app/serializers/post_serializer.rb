class PostSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :title, :body, :created_at, :updated_at

  attribute :random_string do
    Faker::Lorem.sentence(word_count: 1)
  end

  has_many :comments, links: {google: -> (_){ 'http://google.com'}}
  belongs_to :author,
             object_method_name: :user,
             id_method_name: :user_id,
             serializer: UserSerializer

  meta do |record, params|
    { 'comments-count': record.comments.count } if params[:include_comments_count_meta]
  end
end
