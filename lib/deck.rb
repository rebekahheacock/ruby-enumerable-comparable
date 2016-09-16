require_relative 'card'

# A simple representation of a deck of playing cards
class Deck
  # deck is a getter method that returns @deck
  attr_reader :deck

  # deck is a PRIVATE getter method that can only be used inside this class
  private :deck

  def initialize
    # @deck is an array
    @deck = Card::SUITS.map do |suit|
      Card::RANKS.map { |rank| Card.new(rank, suit) }
    end.flatten
  end

  # swap front and back somewhere in the middle third.
  def cut
    count = deck.length
    random = Random.rand(count / 3)
    cut_point = (count / 3 + random)
    deck.replace deck.slice(cut_point, count - cut_point) +
                 deck.slice(0, cut_point)
    self
  end

  def draw
    # deck here is a METHOD, defined by attr_reader, that returns @deck
    deck.shift
    self
  end

  def shuffle
    deck.shuffle!
    self
  end

  def deal(cards, *hands)
  end
end
