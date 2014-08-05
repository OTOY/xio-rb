# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'xio/version'

Gem::Specification.new do |s|
  s.name        = "xio"
  s.version     = Xio::GEM_VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Christopher"]
  s.email       = "help@x.io"
  s.homepage    = "https://github.com/appslingr/xio-rb"
  s.summary     = "X.IO <http://x.io> integration library."
  s.description = "X.IO <http://x.io> integration library."
  s.rubyforge_project = "xio"
  s.add_dependency "multi_json"
  s.files        = Dir.glob("bin/**/*") + Dir.glob("lib/**/*") + %w(LICENSE README.markdown Rakefile)
  s.require_path = "lib"
end
