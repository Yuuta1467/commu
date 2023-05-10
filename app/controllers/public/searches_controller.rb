class Public::SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content2 = params[:content2]
    @method = params[:method]
    @records = search_for(@model, @content2, @method)
  end
  
  private
  def search_for(model, content2, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content2)
      else
        User.where('name LIKE ?', '%'+content2+'%')
      end
    elsif model == 'post'
      if method == 'perfect'
        Post.where(content: content2)
      else
        Post.where('content LIKE ?', '%'+content2+'%')
      end
    end
  end
end
