class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # Make (but don't save) an empty Post so the form we render
  # knows which fields to use and where to submit the form
  # This action will render app/views/posts/new.html.erb once
  # it's done
  def new
    @posts = Post.new
  end

  # We know this will get run once we've received the submitted
  # form from our new action above (remember your REST actions??)
  def create
    @post = Post.new(allowed_post_params)
    if @post.save
      flash[:success] = "Great! Your post has been created!" # code to set up congratulations message
      redirect_to post_path(@post.id) # go to show page for @post
    else
      flash.now[:error] = "Rats! Fix your mistakes, please." # code to set up error message
      render :new, status :unprocessable_entity
    end
  end

  private # Best to make helper methods like this one private
  
  # gives us back just the hash containing the params we need to
  # to create or update a post
  def allowed_post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
end