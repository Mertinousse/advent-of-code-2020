
class Part1
  def initialize
    @rules = parse_rules
  end

  def run
    parents = [parents_of('shiny gold')]
    until parents.last.empty?
      parents << parents.last.map { |parent| parents_of(parent) }.flatten.uniq
    end

    parents.flatten.uniq.count
  end

  def parse_rules
    {}.tap do |rules|
      File.readlines('input.txt')
          .map { |line| line.match(/(.*) bags contain (.*)./).to_a }
          .each { |_, color, content| rules[color] = content }

      rules.transform_values! do |colors|
        colors.split(', ').map { |color| color.match(/(\d+) (.*) bags?/).to_a[2] }.compact
      end

      rules.reject! { |_, colors| colors.empty? }
    end
  end

  def parents_of(color)
    @rules.select { |_, colors| colors.include?(color) }.keys
  end
end

# puts Part1.new.run

class Part2
  def initialize
    @rules = parse_rules
  end

  def run
    exp = @rules['shiny gold'].join(' + ')
    loop do
      _, count, color = exp.match(/(\d+) ([^+*()]+)/).to_a
      break unless color

      if @rules[color.strip]
        exp.gsub!(color, "+ #{count} * (#{@rules[color.strip].join(' + ')})")
      else
        exp.gsub!(color, '')
      end
    end

    eval(exp)
  end

  def parse_rules
    {}.tap do |rules|
      File.readlines('input.txt')
          .map { |line| line.match(/(.*) bags contain (.*)./).to_a }
          .each { |_, color, content| rules[color] = content if content != 'no other bags' }

      rules.transform_values! do |colors|
        colors.split(', ').map { |color| color.match(/(.*) bags?$/).to_a[1] }.compact
      end

      rules.reject! { |_, colors| colors.empty? }
    end
  end
end

# puts Part2.new.run
