class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.belongs_to :friend, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
