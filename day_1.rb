# frozen_string_literal: true

lines = File.readlines('./inputs/1.txt')

left = []
right = []

lines.each do |line|
  line_split = line.split('   ')
  left << line_split[0].to_i
  right << line_split[1].to_i
end

differences = left.sort.zip(right.sort).map do |pair|
  (pair[0] - pair[1]).abs
end

puts differences.sum
