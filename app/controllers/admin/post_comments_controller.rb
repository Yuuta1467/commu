class Admin::PostCommentsController < ApplicationController

  def destroy
    @post_comment = PostComment.find(params[:id])
    @user = @post_comment.user
    @post_comment.destroy
    redirect_to admin_user_path(@user)
  end
end
