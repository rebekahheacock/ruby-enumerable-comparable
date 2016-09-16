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
  end

  def shuffle
    deck.shuffle!
    self
  end

  # asterisk allows method to take multiple arguments as an array
  # aka a "splat"
  # example:
  # hand_a = []
  # hand_b = []
  # hand_c = []
  # deal(5, hand_a, hand_b, hand_c)
  def deal(cards, *hands)
    # deal the number of cards requested into the number of hands requested
    # one at a time
    cards.times do
      hands.each do |hand|
        hand << draw
      end
    end
  end
end
