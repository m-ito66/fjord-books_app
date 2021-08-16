class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:edit, :update, :destroy]

  # POST /reports/1/comments
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable
    else
      redirect_to root_url
    end
  end

  # PATCH/PUT /reports/1/comments/1
  def update
    if @comment.update(comment_params)
      redirect_to [@report, @comment], notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reports/1/comments/1
  def destroy
    @comment.destroy
    redirect_to @commentable
  end

  private
    def set_commentable
      @commentable = Report.find_by(id: params[:report_id]) || Book.find_by(id: params[:book_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end