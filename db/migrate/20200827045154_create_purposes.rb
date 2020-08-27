class CreatePurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :purposes do |t|
      t.string :content
      t.boolean :complete
      t.date :start_day
      t.date :end_day
      t.boolean :open
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
