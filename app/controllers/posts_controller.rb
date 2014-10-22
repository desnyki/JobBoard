class PostsController < ApplicationController
  def new
  	@post = Post.new
  end
  def show
    @post = Post.find(params[:id])
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      # Handle a successful save.
      flash[:success] = "Post successful!"
      redirect_to @post
    else
      render 'new'
    end
  end
  def index
    @posts = Post.paginate(:per_page => 5, :page => params[:page]).search(params[:search])
  end
  private

    def post_params
      params.require(:post).permit(:email, :title, :body, :image)
    end
end
