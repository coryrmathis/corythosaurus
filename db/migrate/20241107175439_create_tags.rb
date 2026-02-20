class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.belongs_to :taggable, polymorphic: true
      t.timestamps
    end
  end
end
