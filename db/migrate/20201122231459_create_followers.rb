class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :follows_user
      t.boolean :notified, null: false, default: false

      t.timestamps
    end
  end
end
