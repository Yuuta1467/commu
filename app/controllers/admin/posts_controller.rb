class Admin::PostsController < ApplicationController
  def index
  end

  def show

  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.user
    @post.destroy
    redirect_to admin_user_path(@user)
  end
end
