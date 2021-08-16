# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:destroy]
  before_action :correct_user, only: [:destroy]

  # POST /reports/1/comments
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      rednder @commentable
    end
  end

  # DELETE /reports/1/comments/1
  def destroy
    if @comment.destroy
      redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      render @commentable
    end
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

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to reports_url if @comment.nil?
  end
end
