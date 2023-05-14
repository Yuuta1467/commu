class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path#, notice: '変更しました'
    else
      #flash[:danger] = @tag.errors.full_messages
      redirect_to edit_admin_tag_path(@tag)
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
    redirect_to admin_tags_path#, notice: '変更しました'
    else
      #flash[:danger] = @tag.errors.full_messages
      redirect_to edit_admin_tag_path(@tag)
    end
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
