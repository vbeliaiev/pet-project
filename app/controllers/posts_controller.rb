class PostsController < ApplicationController
  def index
    render json: PostSerializer.new(Post.all, {include: [:comments]})
  end
end