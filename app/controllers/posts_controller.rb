class PostsController <ApplicationController

  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    # or Post.create!(post_params.merge(author: session[:user]))
    # and remove author from your strong params

    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # you can use a before action to dry up repetitive code
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :body, :photo_url)
  end

end
