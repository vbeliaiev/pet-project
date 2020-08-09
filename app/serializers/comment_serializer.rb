class CommentSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash

  attributes :body, :created_at

  belongs_to :post
  belongs_to :commenter,
             record_type: :user,
             id_method_name: :user_id,
             object_method_name: :user,
             serializer: UserDetailesSerializer

  meta do |record, params|
    {last_modified: record.updated_at} if params[:include_some_comment_meta]
  end
end
