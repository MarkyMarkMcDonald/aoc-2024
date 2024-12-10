# frozen_string_literal: true

lines = File.readlines('./inputs/4.txt')

chars = lines.map(&:chars)

center_boundary_index = lines.length - 2

total = (1..center_boundary_index).sum do |i|
  (1..center_boundary_index).count do |j|
    if chars[i][j] == 'A'
      top_left = chars[i - 1][j - 1]
      top_right = chars[i + 1][j - 1]
      bottom_left = chars[i - 1][j + 1]
      bottom_right = chars[i + 1][j + 1]

      cross = "#{top_left}#{top_right}#{bottom_left}#{bottom_right}"

      %w[MMSS SSMM SMSM MSMS].include?(cross)
    end
  end
end

puts total