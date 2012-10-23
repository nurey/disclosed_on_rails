class AddModels < ActiveRecord::Migration
  def up
    create_table :agencies do |t|
      t.string :name
      t.timestamps
    end

    create_table :vendors do |t|
      t.string :name
      t.timestamps
    end

  	create_table :contracts do |t|
      t.references :agency
      t.references :vendor
      t.string :uri
      t.string :reference_number
      t.date :contract_date
      t.date :delivery_date 
      t.string :description
      t.string :contract_period
      t.float :contract_value
      t.text :comments
      t.timestamps
    end

    add_foreign_key :contracts, :agencies
    add_foreign_key :contracts, :vendors

    add_index :agencies, :name
    add_index :vendors, :name
  end

  def down
    drop_table :contracts
    drop_table :agencies
    drop_table :vendors
  end
end
