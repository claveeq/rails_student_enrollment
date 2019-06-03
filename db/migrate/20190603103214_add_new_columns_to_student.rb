class AddNewColumnsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :gender, :integer, null: false, default: 1
    add_column :students, :email, :string, null: false, default: ''
    add_column :students, :account_id, :integer, null: true
  end
end
