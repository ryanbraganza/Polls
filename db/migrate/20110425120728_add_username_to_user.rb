class AddUsernameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
  end

  def self.down
    drop_column :users, :username
  end
end
