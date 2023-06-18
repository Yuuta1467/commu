class Admin::PostsController < ApplicationController

  def destroy
    @post = Post.find(params[:id])
    @user = @post.user
    @post.destroy
    redirect_to admin_user_path(@user)
  end
end
