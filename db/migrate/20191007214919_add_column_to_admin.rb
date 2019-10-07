class AddColumnToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :is_admin, :boolean
  end
end
