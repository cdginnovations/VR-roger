class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :role
      t.integer :age
      t.string :education
      t.string :race
      t.string :zip_code
      t.string :gender
      t.string :preferred_language
      t.text :bio
      t.text :skills
      t.text :experience
      t.string :website
      t.string :phone_number
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
