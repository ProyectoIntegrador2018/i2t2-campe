class ChangedatatypeUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :desc_request_status, :string
  end
end
