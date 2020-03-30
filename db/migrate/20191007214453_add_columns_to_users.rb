class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :request_password_it2t2, :string
    add_column :users, :creation_date, :string
    add_column :users, :desc_request_status, :string
    add_column :users, :convocatory, :string
    add_column :users, :fiscal_year, :integer
    add_column :users, :studies_start_date, :string
    add_column :users, :studies_end_date, :string
    add_column :users, :start_scholarship, :string
    add_column :users, :end_scholarship, :string
    add_column :users, :school, :string
    add_column :users, :entity, :string
    add_column :users, :support_to_get, :string
    add_column :users, :program, :string
    add_column :users, :expertise_area, :string
    add_column :users, :field_study, :string
    add_column :users, :discipline, :string
    add_column :users, :sub_discipline, :string
    add_column :users, :last_gpa, :decimal
    add_column :users, :recovered_gpa, :decimal
    add_column :users, :scholarchip_requested, :string
    add_column :users, :scholarship_currency, :string
    add_column :users, :maintenance_requested, :string
    add_column :users, :maintenance_currency, :string
    add_column :users, :medical_insurance_reuquested, :string
    add_column :users, :medical_insurance_currency, :string
  end
end

