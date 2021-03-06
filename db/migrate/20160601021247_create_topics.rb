  class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.references :course
      t.integer :instructor_id, foreign_key: :user_id
      t.string :privacy
      t.string :language
      t.string :approval_status

      t.timestamps null: false
    end
  end
end
