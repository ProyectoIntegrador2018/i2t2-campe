class Changedatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :studies_start_date, :string
    change_column :users, :studies_end_date, :string
    change_column :users, :start_scholarship, :string
    change_column :users, :end_scholarship, :string

  end
end
