class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.references :user
      t.references :lesson
      t.string :title
      t.string :video_type
      t.string :token
      t.string :video_token
      t.string :script
      t.string :language
      t.string :privacy
      t.string :position_prior
      t.integer :watched
      t.string :approval_status

      t.timestamps null: false
    end
  end
end
