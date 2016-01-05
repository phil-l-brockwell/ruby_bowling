# class declaration for shot holder
class ShotHolder
  attr_accessor :iterator, :shots

  def initialize(shots = 0)
    @iterator = shots + 1
    @shots = Hash[(1..shots).map { |x| [x, Shot.new] }] || {}
  end

  def add_shot
    shots[iterator] = Shot.new
    increment_iterator
  end

  private

  def increment_iterator
    @iterator += 1
  end
end
