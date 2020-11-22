class ChangeCPost < ActiveRecord::Migration[6.0]
  def change
  		rename_column :posts, :post, :body
  end
end
