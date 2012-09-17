# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "morning-pages/version"

Gem::Specification.new do |s|
  s.name        = "morning-pages"
  s.version     = MorningPages::VERSION
  s.authors     = ["Chris Parsons"]
  s.email       = ["chris.p@rsons.org"]
  s.homepage    = "http://github.com/chrismdp/morning-pages"
  s.summary     = %q{Command line helper to write your morning pages}
  s.description = %q{I've long been fascinated by the morning pages habit of writing three pages (or about 750 words) of whatever comes into your head each day - it's like taking a mental showers and helps to clear your head, ready for the day. There are great sites out there like http://750words.com, but I live on the command line and like to keep my words on my own computer.
  
  When installed, type `morning-pages -h` for more info.}

  s.rubyforge_project = "morning-pages"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'trollop', '~> 1.16.2'
  s.add_dependency 'highline'
  s.add_development_dependency 'rspec',    '~> 2.10.0'
  s.add_development_dependency 'rake',     '~> 0.9.2.2'
  s.add_development_dependency 'cucumber', '~> 1.2'
  s.add_development_dependency 'aruba',    '~> 0.4'
end
