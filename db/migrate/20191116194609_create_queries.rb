class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      
      t.decimal :principal, null: false 
      t.decimal :rate, null: false 
      t.decimal :years, null: false 
      t.decimal :total, null: false 

      t.timestamps
    end
  end
end
