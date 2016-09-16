#
class SteppedRange
  include Enumerable

  def each
    current = start
    while current <= stop
      # yield is kind of like return
      # used for enumeration
      yield current
      current += step
    end
  end

  attr_reader :start, :stop, :step
  private :start, :stop, :step

  def initialize(start, stop, step)
    # this is the same as
    # @start, @stop, @step = start, stop, step
    # which is called "parallel assignment"
    # shouldn't use that
    @start = start
    @stop = stop
    @step = step
  end
end
