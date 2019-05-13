class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :owner_name
      t.text :notes

      t.timestamps
    end
  end
end
