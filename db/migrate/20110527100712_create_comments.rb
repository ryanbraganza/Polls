class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :poll_id
      t.integer :user_id
      t.string :comment
      t.timestamp :created_at
    end
  end

  def self.down
    drop_table :comments
  end
end
