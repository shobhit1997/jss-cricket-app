class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :team1, null: false
      t.string :team2, null: false
      t.datetime :time, null: false
      t.string :venue, null: false
      t.string :winner

      t.timestamps  
    end
  end
end
