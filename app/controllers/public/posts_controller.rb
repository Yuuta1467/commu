class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:guest_sign_in]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)#, notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to posts_path#, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def post_params
    params.require(:post).permit(:content, :tag)
  end

  #def ensure_correct_user
     #@post = Post.find(params[:id])
    #unless @post.user == current_user
     #redirect_to posts_path
    #end
  #end

end