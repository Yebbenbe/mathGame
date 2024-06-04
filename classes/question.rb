module Question
  private

  def addition
    num1, num2 = rand(100), rand(100)
    ["What is: #{num1} + #{num2}?", num1 + num2]
  end

  def subtraction
    num1, num2 = rand(100), rand(100)
    ["What is: #{num1} - #{num2}?", num1 - num2]
  end

  def multiplication
    num1, num2 = rand(10), rand(10)
    ["What is: #{num1} * #{num2}?", num1 * num2]
  end

  def division
    num1, num2 = rand(10), rand(1..10)
    ["What is: #{num1} / #{num2}?", num1 / num2]
  end
end