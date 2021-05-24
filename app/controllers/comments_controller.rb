class CommentsController < ApplicationController
  before_action :set_article
  
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment has been save"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commenter)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
  
end
