class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :first_player
      t.string :second_player
      t.string :first_player_letter
      t.string :second_player_letter
      t.string :winner
      t.timestamps
    end
  end
end
