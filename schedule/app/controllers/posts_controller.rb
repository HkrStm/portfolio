class PostsController < ApplicationController
  def home
  end
  
  def index
    @posts = Post.all.order(start_day: :asc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title, :start_day, :end_day, :allday, :memo))
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts")
    else
      render "new"
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    if @post.allday
      @check_allday = "◯"
    else
      @check_allday = ""
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(params.require(:post).permit(:title, :start_day, :end_day, :allday, :memo))
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts")
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts")
  end
  
  def today
    @posts = Post.where('start_day <= ? and end_day > ?', Date.today + 1, Date.today).order(start_day: :asc)
    @count = @posts.count
  end
  
  def tomorrow
    @posts = Post.where('start_day <= ? and end_day > ?', Date.today + 2, Date.today.tomorrow).order(start_day: :asc)
    @count = @posts.count
  end
end
