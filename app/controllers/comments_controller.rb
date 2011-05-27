class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:poll_id]
      @poll = Poll.find params[:poll_id]
      @comments = @poll.comments
    else
      @comments = Comment.all
    end
  end
  def new
    @comment = Comment.new
  end
  def create
    @poll = Poll.find params[:poll_id]
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.poll = @poll
    @comment.created_at = Time.now
    if @comment.save
      redirect_to poll_path(@comment.poll)
    else
      render :new
    end
  end
end
