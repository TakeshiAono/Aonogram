class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :image
      t.text :password_digest

      t.timestamps
    end
  end
end
