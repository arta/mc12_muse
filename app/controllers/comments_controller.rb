class CommentsController < ApplicationController

  # POST /posts/:post_id/commets
  #   html:   <form action='/posts/1/comments' ..>
  #             <input name='comment[content]' ..>
  #             ...
  #   rails:  =form_for [@post, @post.comments.new]
  #             =f.input :content
  #             ...
  #   router: post '/posts/:post_id/comments', to: 'comments#create'
  def create
    post = Post.find params[:post_id]
    post.comments.create( params[:comment].permit( :content ).merge( user: current_user) )
    redirect_to post, notice:'Comment posted.'
  end
  # No view. Explicitly redirect_to a resource.

end
