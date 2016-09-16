require_relative 'card'

# A simple representation of a deck of playing cards
class Deck
  # storage is a getter method that returns @storage
  attr_reader :storage

  # storage is a PRIVATE getter method that can only be used inside this class
  private :storage

  def initialize
    # @storage is an array
    @storage = Card::SUITS.map do |suit|
      Card::RANKS.map { |rank| Card.new(rank, suit) }
    end.flatten
  end

  # swap front and back somewhere in the middle third.
  def cut
    count = storage.length
    random = Random.rand(count / 3)
    cut_point = (count / 3 + random)
    storage.replace storage.slice(cut_point, count - cut_point) +
                    storage.slice(0, cut_point)
    self
  end

  def draw
    # storage here is a METHOD, defined by attr_reader, that returns @storage
    storage.shift
  end

  def shuffle
    storage.shuffle!
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
