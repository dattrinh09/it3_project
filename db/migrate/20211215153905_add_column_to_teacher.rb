class AddColumnToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :sub_name, :string
  end
end
