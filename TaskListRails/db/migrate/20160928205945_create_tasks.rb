class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :description
      t.boolean :is_complete
      t.date :complete_date

      t.timestamps null: false
    end
  end
end
