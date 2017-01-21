class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.order created_at: :desc
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice:'Post created.'
    else
      render 'new'
    end
  end
  # redirect_to|render resource

  # GET /posts/:id
  def show
    @post = Post.find params[:id]
  end

  # GET /posts/:id/edit
  def edit

  end

  # PATCH|PUT /posts/:id
  def update

  end
  # redirect_to|render resource

  # DELETE /posts/:id
  def destroy

  end

  private
    def post_params
      params.require( :post ).permit( :title, :link, :description )
    end

    def set_post

    end
end
