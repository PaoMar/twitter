class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :cover_photo
      t.string :profile_picture
      t.boolean :private
      t.string :timezone
      t.string :language
      t.string :phone
      t.boolean :verified
      t.string :name
      t.string :bio
      t.string :website

      t.timestamps
    end
  end
end
