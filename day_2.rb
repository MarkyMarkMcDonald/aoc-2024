# frozen_string_literal: true

lines = File.readlines('./inputs/2.txt')

reports = lines.map do |line|
  line.split(" ").map(&:to_i)
end

safe_reports_count = reports.count do |report|
  all_ascending = report == report.sort
  all_descending = report == report.sort.reverse
  next false unless all_ascending || all_descending

  report.map.with_index do |level, index|
    has_before = index > 0
    has_after = index < report.size - 1

    adjacents = []

    if has_before
      adjacents << report[index - 1]
    end

    if has_after
      adjacents << report[index + 1]
    end

    adjacents.all? do |adjacent_level|
      difference = (level - adjacent_level).abs
      difference >= 1 && difference <= 3
    end
  end.all?(true)
end

puts safe_reports_count