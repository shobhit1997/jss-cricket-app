class CreateBattingPerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :batting_performances do |t|
      t.integer :runs, null: false
      t.integer :balls,  null:false
      t.integer :sixes, null:false
      t.integer :fours, null:false
      t.boolean :out, default:true
      t.belongs_to :user, null:false
      t.belongs_to :match, null:false
      t.index ['user_id', 'match_id'], name: 'uniq_batsmen_per_match', unique: true

      t.timestamps
    end
  end
end
