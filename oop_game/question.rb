class Question

  attr_accessor :num1
  attr_accessor :num2
  attr_accessor :operator
  attr_accessor :answer

  OP_TYPE = %w(+ - *)

  def initialize
    rng = Random.new
    self.num1 = rng.rand(1..20)
    self.num2 = rng.rand(1..20)
    self.operator = rng.rand(0..2)
    self.answer = num1.send(OP_TYPE[operator], num2)
  end

  def to_s(player)
    "#{player.name}: What does #{num1} #{OP_TYPE[operator]} #{num2} equal?"
  end
end