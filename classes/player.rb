class Player
  attr_reader :name, :score, :life

  def initialize(name)
    @name = name
    @score = 0
    @life = 3
  end

  def increment_score
    @score += 10
  end

  def lose_life
    @life -= 1
  end

  def to_s
    @name
  end
end