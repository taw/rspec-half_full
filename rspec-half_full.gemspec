Gem::Specification.new do |s|
  s.name    = "rspec-half_full"
  s.version = "0.20160506"

  s.summary       = "There are no failed specs"
  s.description   = "RSpec reporter for incorrigible optimists"
  s.author        = "Tomasz Wegrzanowski"
  s.email         = "Tomasz.Wegrzanowski@gmail.com"
  s.homepage      = "https://github.com/taw/rspec-half_full"
  s.licenses      = ["MIT"]

  s.files            = Dir.glob("lib/**/*") + ["Rakefile"]
  s.test_files       = Dir.glob("spec/**/*")
  s.extra_rdoc_files = ["README.md"]

  s.add_dependency "rspec",  "~> 3.4"
  s.add_dependency "rspec-legacy_formatters"
  s.add_development_dependency "rake"
end
