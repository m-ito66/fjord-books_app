class CommentsController < ApplicationController
  before_action :set_report
  before_action :set_comment, only: [:edit, :update, :destroy]

  # POST /reports/1/comments
  def create
    @comment = @report.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @report
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
    redirect_to [@report, :comments], notice: 'Comment was successfully destroyed.'
  end

  private
    def set_report
      @report = Report.find(params[:report_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end