class AddIndexToQuestionAndAnswer < ActiveRecord::Migration
  def self.up
    add_column :questions, :index, :integer
    add_column :answers, :index, :integer
  end

  def self.down
    drop_column :answers, :index
    drop_column :questions, :index
  end
end
