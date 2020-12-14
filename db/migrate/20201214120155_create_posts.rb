class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.text :body
      t.boolean :verified, null: false, default: false

      t.timestamps
    end
  end
end
