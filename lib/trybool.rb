require "trybool/version"

module Trybool
  TRUTHY_VALUES = [
    true,
    1,
    "1",
    "t",
    "T",
    "true",
    "TRUE",
    "on",
    "ON"
  ]

  def self.configure
    yield(self)
  end

  def self.<<(value)
    Array(value).each { |v| truthy_values << v }
  end

  def self.parse(value)
    truthy_values.include?(value)
  end

  def self.truthy_values
    @truthy_values ||= Set[*TRUTHY_VALUES]
  end
end
