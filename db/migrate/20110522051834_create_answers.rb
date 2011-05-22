class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :answer
      t.integer :question_id
    end
  end

  def self.down
    drop_table :answers
  end
end
