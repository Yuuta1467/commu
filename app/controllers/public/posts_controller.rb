class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:guest_sign_in]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    #@post.score = Language.get_data(post_params[:content])
    @post_comment = PostComment.new
  end

  def index
    @posts = Post.page(params[:page]).order(created_at: :desc)
    #@posts.score = Language.get_data(post_params[:content])
    @post_comments = PostComment.all

        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]#タグサーチ用記述
        keyword = params[:keyword]#キーワードサーチ用記述
        if tag_search != nil
            @posts = Tag.find_by(id: tag_search).posts.page(params[:page]).order(created_at: :desc)
        elsif keyword.present?
             @posts = Post.where("content LIKE :keyword", keyword: "%#{keyword}%").page(params[:page]).order(created_at: :desc)
        else
             @posts = Post.page(params[:page]).order(created_at: :desc)
             #タグもキーワードも選択されなければ投稿ページへ
        end
             render :index, locals: { keyword: keyword }

  end

  def create
    @post = Post.new(post_params)
    # 自然言語API機能
    @post.score = Language.get_data(post_params[:content])
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else render 'new'
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    # 自然言語API機能
    @post.score = Language.get_data(post_params[:content])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "変更を保存しました。"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def guest_sign_in #ゲストログイン機能
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
    sign_in user
    redirect_to posts_path, notice: "ゲストユーザーとしてログインしました。"
  end

  private

  def post_params
    params.require(:post).permit(:content, :tag_id)
  end

  def ensure_correct_user
     @post = Post.find(params[:id])
    unless @post.user == current_user
     redirect_to posts_path
    end
  end

end