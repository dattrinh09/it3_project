class RemoveColumnToTeacher < ActiveRecord::Migration[6.0]
  def change
       remove_column :teachers, :sub_name , :string
  end
end
