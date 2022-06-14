class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.references :user, null: false, foreign_key: true
      t.text :image
      t.text :coment

      t.timestamps
    end
  end
end
