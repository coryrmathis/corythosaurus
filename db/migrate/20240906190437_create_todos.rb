class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.text :description
      t.references :day
      t.timestamps
    end
  end
end
