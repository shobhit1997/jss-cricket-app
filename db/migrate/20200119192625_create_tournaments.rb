class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null:false
      t.string :venue, null:false
      t.string :result, null:false
      t.date :date, null:false
      t.timestamps
    end
  end
end
