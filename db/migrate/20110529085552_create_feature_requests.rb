class CreateFeatureRequests < ActiveRecord::Migration
  def self.up
    create_table :feature_requests do |t|
      t.string :feature
      t.timestamp :created_at
      t.integer :user_id
    end
  end

  def self.down
    drop_table :feature_requests
  end
end
