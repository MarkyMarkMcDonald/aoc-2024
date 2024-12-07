lines = File.readlines('./inputs/3.txt')

total = 0

regex = /mul\((\d{1,3}),(\d{1,3})\)/

lines.each do |line|
  while line.match(regex) do
    a, b = Regexp.last_match.captures.map(&:to_i)
    total += a * b
    line = line.split(Regexp.last_match.to_s)[1]
  end
end

puts total
