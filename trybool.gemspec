lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trybool/version"

Gem::Specification.new do |spec|
  spec.name = "trybool"
  spec.version = Trybool::VERSION
  spec.authors = ["Matt Polito"]
  spec.email = ["matt.polito@gmail.com"]

  spec.summary = "Confidently return a boolean from a value"
  spec.description = "The value parser for returning Booleans you never knew you needed."
  spec.homepage = "https://github.com/hashrocket/trybool"
  spec.license = "MIT"

  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard"
end
