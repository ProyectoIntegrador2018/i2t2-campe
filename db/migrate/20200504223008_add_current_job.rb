class AddCurrentJob < ActiveRecord::Migration[5.2]
  def change
    add_column :work_experiences, :is_current, :boolean
  end
end
