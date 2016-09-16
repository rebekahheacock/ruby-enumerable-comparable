# A simple representation of a playing card.
class Card
  # static definitions
  SUITS = %w(C D H S).freeze
  RANKS = [(2..10).to_a, %w(J Q K A)].flatten.freeze

  def <=>(other)
    suit_comparison = SUITS.index(suit) <=> SUITS.index(other.suit)
    rank_comparison = RANKS.index(rank) <=> RANKS.index(other.rank)

    # sort first by suit, then by rank
    if suit_comparison.zero?
      rank_comparison
    else
      suit_comparison
    end
  end

  attr_reader :suit, :rank

  def initialize(rank, suit)
    raise ArgumentError,
          "Suit: '#{suit}' not in #{SUITS}" unless SUITS.include? suit
    raise ArgumentError,
          "Rank: '#{rank}' not in #{RANKS}" unless RANKS.include? rank

    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank}:#{suit}"
  end
end
