class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :post_code,          null: false
      t.integer :ship_region_id,     null: false
      t.string :city,               null: false
      t.string :block,              null: false
      t.string :building
      t.string :phone,              null: false
      t.references :buyer,          foreign_key: true
      t.timestamps
    end
  end
end
