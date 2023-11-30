class CreateTours < ActiveRecord::Migration[7.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :description
      t.string :country
      t.decimal :price
      t.float :rate

      t.timestamps
    end
  end
end
