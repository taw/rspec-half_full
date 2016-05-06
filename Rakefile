require 'rubygems'
require 'rspec/core/rake_task'
require 'rubygems/package_task'

task :default => :test
task :test    => :spec

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/*_spec.rb']
end

spec = Gem::Specification.load('rspec-half_full.gemspec')
Gem::PackageTask.new(spec) { }

require 'rubygems/installer'
desc 'Build the gem and install it'
task :install => :gem do
  Gem::Installer.new("pkg/#{spec.file_name}").install
end
