require "trybool/version"

module Trybool
  module_function

  TRUTH_SET = Set[
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

  def configure
    yield(self)
    self
  end

  def add_truthy_value(value)
    Array(value).each { |v| TRUTH_SET.add(v) }
  end
  singleton_class.alias_method :<<, :add_truthy_value

  def parse(value)
    TRUTH_SET.include?(value)
  end
  singleton_class.alias_method :[], :parse
end
