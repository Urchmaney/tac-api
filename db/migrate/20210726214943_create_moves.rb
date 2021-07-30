class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.integer :position
      t.integer :order
      t.string :letter
      t.string :player
      t.references :game, index: true

      t.timestamps
    end
  end
end
