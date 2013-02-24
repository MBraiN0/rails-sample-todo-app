class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title
      t.string :desc
      t.integer :status
      t.integer :todo_list_id

      t.timestamps
    end
  end
end
