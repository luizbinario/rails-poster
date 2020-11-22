class ChangeDefaultNotification < ActiveRecord::Migration[6.0]
  def change
  	change_column :followers, :notified, :boolean, null: false, default: false
  end
end
