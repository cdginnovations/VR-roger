class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.integer :status
      t.references :lesson_id
      t.integer :instructor_id, foreign_key: :user_id

      t.timestamps null: false
    end
  end
end
