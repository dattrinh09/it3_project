class RemovesubjectFromTeachers < ActiveRecord::Migration[6.0]
  def change
      remove_column :teachers, :subject , :string
      add_column :teachers, :subject_code, :integer
  end
end
