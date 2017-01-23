class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /posts
  def index
    @posts = Post.order created_at: :desc
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # POST /posts
  def create
    @post = current_user.posts.new post_params
    if @post.save
      redirect_to @post, notice:'Post created.'
    else
      render 'new'
    end
  end
  # redirect_to|render resource

  # GET /posts/:id
  def show
  end

  # GET /posts/:id/edit
  def edit
  end

  # PATCH|PUT /posts/:id
  def update
    if @post.update post_params
      redirect_to @post, notice:'Post updated.'
    else
      render 'edit'
    end
  end
  # redirect_to|render resource

  # DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to posts_path, notice:'Post deleted'
  end
  # redirect_to resource

  # PUT /posts/:id/like
  #   html:   <a href='/posts/1/like', data-method='put'> .. </a>
  #   rails:  =link_to .. like_post_path, method: :put
  #   router: put '/posts/:id/like', to: 'posts#upvote', as: like_post
  def upvote
    @post.upvote_by current_user
    redirect_to @post
  end
  # No view. Explicitly redirect_to a resource

  # PUT /posts/:id/dislike
  #   html:   <a href='/posts/1/dislike', data-method='put'> .. </a>
  #   rails:  =link_to .. dislike_post_path, method: :put
  #   router: put '/posts/:id/dislike', to: 'posts#downvote', as: dislike_post
  def downvote
    @post.downvote_by current_user
    redirect_to @post
  end
  # No view. Explicitly redirect_to a resource.

  private
    def post_params
      params.require( :post ).permit( :title, :link, :description, :image )
    end

    def set_post
      @post = Post.find params[:id]
    end
end
