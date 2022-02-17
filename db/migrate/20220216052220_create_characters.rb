class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.date :birthdate
      t.float :height
      t.float :weight
      t.text :home_location

      t.timestamps
    end
  end
end
