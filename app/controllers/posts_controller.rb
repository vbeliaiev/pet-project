class PostsController < ApplicationController
  def index
    options = {include: [:author, :comments, 'comments.commenter'],
               fields: {
                 post: [:title, :body, 'created-at', 'random-string', :comments, :author],
                 comment: [:body, :created_at, :commenter],
                 author: ['first-name'],
                 user: ['first-name', 'last-name']
               },
               meta: { total: Post.count},
               params: {
                 include_comments_count_meta: false,
                 include_some_comment_meta: true
               }
    }

    render json: PostSerializer.new(Post.all.limit(1), options)
  end
end
