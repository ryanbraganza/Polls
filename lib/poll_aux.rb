module PollAux
  def self.pollify(params)
    p = Poll.new
    p.title = params[:title]
    p.description = params[:description]
    params[:questions].each do |idx, question|
      q = p.questions.build
      q.question = question[:question]
      q.index = idx
      question[:answers].each_with_index do |answer, idx|
        a = q.answers.build
        a.answer = answer
        a.index = idx
      end
    end
    p
  end
end
