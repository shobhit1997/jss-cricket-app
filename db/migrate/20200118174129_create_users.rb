class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :photo
      t.bigint :phone
      t.integer :passout_year

      t.timestamps
    end
  end
end
