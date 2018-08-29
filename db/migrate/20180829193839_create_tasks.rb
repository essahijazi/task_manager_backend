class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :assigned_by
      t.integer :assigned_to
      t.string :description
      t.datetime :assigned_date
      t.datetime :due_date
      t.boolean :resolved

      t.timestamps
    end
  end
end
