class AddIsAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false
    User.create!(email: 'admin@gmail.com', password: '12345678',password_confirmation: '12345678', is_admin: true)
  end
end
