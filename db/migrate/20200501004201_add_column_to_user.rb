class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: '', limit: 20
    add_column :users, :sex, :integer, null: false, default: 0
    add_column :users, :img_name, :string
    add_column :users, :introduction, :text, null: false, limit: 300
    add_column :users, :job_name, :string, limit: 20
    add_column :users, :work_location, :string, limit: 10
    add_column :users, :work_time, :string, limit: 20
    add_column :users, :salary, :string, limit: 20
    add_column :users, :corona_support, :string, limit: 100
  end
end
