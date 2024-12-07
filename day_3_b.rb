# frozen_string_literal: true

lines = File.readlines('./inputs/3.txt')

everything = lines.join('')

total = 0

regex = /mul\((\d{1,3}),(\d{1,3})\)|(don't\(\))|(do\(\))/

enabled = true

everything.scan(regex) do |match|
  if match.compact[0] == "don't()"
    enabled = false
  elsif match.compact[0] == 'do()'
    enabled = true
  else
    next unless enabled

    a, b = match.compact.map(&:to_i)
    total += a * b
  end
end

puts total
