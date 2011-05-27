class PollsController < ApplicationController
  before_filter :authenticate_user!

  def most_commented
    @polls = Poll.find_by_sql('select count(*) the_c, polls.* from polls join comments on comments.poll_id = polls.id group by poll_id order by the_c desc')
  end

  def new
    @poll = Poll.new
    2.times do
      @poll.questions.build
    end
  end
  def create
    poll = PollAux::pollify params
    poll.creator_id = current_user.id
    if poll.save
      redirect_to polls_path, :notice => 'poll created'
    else
      redirect_to new_poll_path, :alert => 'create fail'
    end
  end
  def show
    @poll = Poll.find params[:id]
  end
  def vote
    @poll = Poll.find params[:id]
    responses = params[:question]
    user_id = current_user.id
    
    ActiveRecord::Base.transaction do
      responses.each do |question_id, answer_id|
        q = Question.find question_id
        a = Answer.find answer_id
        r = q.responses.where :user_id => user_id
        r.each { |r| r.destroy }
        r = Response.new :user => current_user, :answer => a
        r.save!
      end
    end
    redirect_to poll_path(@poll), :notice => 'your answers have been saved'
  end
  def index
    @polls = Poll.all
  end
end
