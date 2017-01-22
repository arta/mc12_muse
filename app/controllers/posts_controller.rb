class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
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

  private
    def post_params
      params.require( :post ).permit( :title, :link, :description )
    end

    def set_post
      @post = Post.find params[:id]
    end
end
