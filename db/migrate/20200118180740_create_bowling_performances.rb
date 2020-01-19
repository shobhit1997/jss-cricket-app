class CreateBowlingPerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :bowling_performances do |t|
      t.integer :overs, null: false
      t.integer :runs, null:false
      t.integer :wickets, null:false
      t.belongs_to :user, null:false
      t.belongs_to :match, null:false
      t.index ['user_id', 'match_id'], name: 'uniq_bowler_per_match', unique: true
      t.timestamps
    end
  end
end
