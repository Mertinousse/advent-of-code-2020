
class Part1
  def initialize
    @instructions = File.readlines('input.txt').map { |line| { instruction: line, visited: false } }
    @acc = 0
    @jmp = 0
  end

  def run
    loop do
      instruction, operation = @instructions[@jmp][:instruction].match(/(\D+) [\+-]\d+/).to_a

      return @acc if @instructions[@jmp][:visited]

      @instructions[@jmp][:visited] = true

      case operation
      when 'nop'
        @jmp = @jmp + 1
      when 'acc'
        @acc = eval('@' + instruction)
        @jmp = @jmp + 1
      when 'jmp'
        @jmp = eval('@' + instruction)
      end
    end
  end
end

puts Part1.new.run
