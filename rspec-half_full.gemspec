Gem::Specification.new do |s|
  s.name    = 'rspec-half_full'
  s.version = '0.20140618'

  s.summary       = 'There are no failed specs'
  #s.description   =
  s.author        = 'Tomasz Wegrzanowski'
  s.email         = 'Tomasz.Wegrzanowski@gmail.com'
  s.homepage      = 'https://github.com/taw/rspec-half_full'
  s.licenses      = ['MIT']

  s.files            = Dir.glob('lib/**/*')
  s.test_files       = Dir.glob('spec/**/*')
  # s.extra_rdoc_files = ['README.markdown']

  s.add_dependency 'rspec',  ['~> 2.14']
end
