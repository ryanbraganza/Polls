class PollsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @poll = Poll.new
  end
  def create
    poll = Poll.new params[:poll]
    poll.creator_id = current_user.id
    if poll.save
      redirect_to polls_path, :notice => 'poll created'
    else
      redirect_to new_poll_path, :alert => 'create fail'
    end
  end
  def show
  end
  def index
    @polls = Poll.all
  end
end