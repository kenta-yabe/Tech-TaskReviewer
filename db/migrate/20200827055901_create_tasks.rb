class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :check
      t.boolean :priority
      t.references :purpose, foreign_key: true

      t.timestamps
    end
  end
end
