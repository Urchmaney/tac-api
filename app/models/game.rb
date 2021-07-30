class Game < ApplicationRecord
  has_many :moves

  def check_win(position, letter)
    win_comb = [[0,1,2], [0, 3,6], [0, 4, 8], [1, 4, 7], [2, 5, 8], [2, 4, 6], [3, 4, 5], [6, 7, 8]]
    possible_comb = win_comb.select { |x| x.include?(position) }
    possible_comb.any? { |comb| self.moves.where(letter: letter, position: comb).count == 3 }
  end
end
