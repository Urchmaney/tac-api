class Move < ApplicationRecord
  belongs_to :game
  validates :position, numericality: { greater_than_or_equal_to: 0, less_than: 9 }
  validates :position, uniqueness: { scope: :game_id }
  before_save :set_order

  private

  def set_order
    self.order = self.game.moves.count + 1
  end
end
