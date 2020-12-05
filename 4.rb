
FIELDS = %w[byr iyr eyr hgt hcl ecl pid cid]

# passports = [[]]

# File.readlines('input.txt').each do |line|
#   passports << [] && next if line.strip.length.zero?

#   passports.last.concat(line.split(' ').map { |pair| pair.split(':').first })
# end

# puts passports.count { |passport| ((passport + %w[cid]) & FIELDS).length == FIELDS.length }

def valid?(passport)
  ((passport.keys + %w[cid]) & FIELDS).length == FIELDS.length &&
    passport['byr'].to_i.between?(1920, 2002) &&
    passport['iyr'].to_i.between?(2010, 2020) &&
    passport['eyr'].to_i.between?(2020, 2030) &&
    passport['hgt'].match(/(\d+)(\D+)/).to_a.then { |_, num, unit| unit == 'cm' && num.to_i.between?(150, 193) || unit == 'in' && num.to_i.between?(59, 76) } &&
    !passport['hcl'].match(/^#\w{6}$/).nil? &&
    %w[amb blu brn gry grn hzl oth].include?(passport['ecl']) &&
    !passport['pid'].match(/^\d{9}$/).nil?
end

passports = [{}]

File.readlines('input.txt').each do |line|
  passports << {} && next if line.strip.length.zero?

  line.split(' ').each { |pair| pair.split(':').tap { |key, value| passports.last[key] = value } }
end

puts passports.count { |passport| valid?(passport) }
