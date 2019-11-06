class DeleteColumnsUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :recovered_gpa, :decimal
    remove_column :users, :scholarship_currency, :string
    remove_column :users, :scholarchip_requested, :string
    remove_column :users, :maintenance_currency, :string
    remove_column :users, :maintenance_requested, :string
    remove_column :users, :medical_insurance_reuquested, :string
    remove_column :users, :medical_insurance_currency, :string
  end
end
