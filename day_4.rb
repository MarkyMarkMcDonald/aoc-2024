# frozen_string_literal: true

require 'matrix'

lines = File.readlines('./inputs/4.txt')

rows = lines.map(&:strip).map(&:chars)

reversed_rows = rows.map(&:reverse)

columns = rows.transpose

diagonals = []

def diagonal(matrix, column_offset: 0, row_offset: 0)
  max = [matrix.length, matrix[0].length].min
  (0..(max - 1 - column_offset - row_offset)).collect { |i| matrix[i + row_offset][i + column_offset] }
end

(0..rows.length - 1).each do |offset|
  diagonals << diagonal(rows, column_offset: offset)
  diagonals << diagonal(reversed_rows, column_offset: offset)

  next if offset.zero?

  diagonals << diagonal(rows, row_offset: offset)
  diagonals << diagonal(reversed_rows, row_offset: offset)
end

def count_occurrences(lines)
  lines.sum do |line|
    line.join('').scan('XMAS').count + line.reverse.join('').scan('XMAS').count
  end
end

# [rows, columns, diagonals].each do |sets|
#   puts '----- standard'
#   sets.each do |set|
#     puts set.join(',')
#   end
#   puts '----- reversed'
#   sets.each do |set|
#     puts set.reverse.join(',')
#   end
# end

total = [rows, columns, diagonals].sum do |lines|
  count_occurrences(lines)
end

puts total
