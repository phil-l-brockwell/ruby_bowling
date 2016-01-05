# class declaration for shot holder
class ShotHolder
  attr_reader :iterator, :shots

  EMPTY_HASH = {}

  def initialize(shots = 0)
    @iterator = shots + 1
    @shots = Hash[(1..shots).map { |x| [x, Shot.new] }] || EMPTY_HASH
  end

  def add_shot
    shots[iterator] = Shot.new
    increment_iterator
  end

  def current
    shots.values.each { |shot| return shot unless shot.taken }
  end

  def remaining?
    !shots.values.map(&:taken).any?
  end

  def total
    shots.values.inject(0) { |a, e| a + e.score }
  end
  
  private

  def increment_iterator
    @iterator += 1
  end
end
