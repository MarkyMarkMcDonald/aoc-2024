# frozen_string_literal: true

class Report
  def initialize(levels)
    @levels = levels
  end

  def safe?
    return false unless differences.all?(&:positive?) || differences.all?(&:negative?)

    differences.all? { |difference| difference.abs >= 1 && difference.abs <= 3 }
  end

  def safe_with_dampening?
    return true if safe?

    dampened_reports.any?(&:safe?)
  end

  def differences
    @levels[1..].map.with_index do |level, index|
      level - @levels[index]
    end
  end

  def dampened_reports
    @levels.map.with_index do |_, index|
      new_array = @levels.clone
      new_array.delete_at(index)
      Report.new(new_array)
    end
  end
end

lines = File.readlines('./inputs/2.txt')

reports = lines.map do |line|
  Report.new(line.split(' ').map(&:to_i))
end

puts reports.count(&:safe_with_dampening?)
