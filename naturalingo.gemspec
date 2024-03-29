# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "naturalingo/version"

Gem::Specification.new do |s|
  s.name        = "naturalingo"
  s.version     = Naturalingo::VERSION
  s.authors     = ["Etienne de Bruin"]
  s.email       = ["et@d.ebru.in"]
  s.homepage    = "http://d.ebru.in/"
  s.summary     = %q{Naturalingo is for natural linguistics}
  s.description = %q{Machine learning for language like my 2 years old learns language}

  s.rubyforge_project = "naturalingo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "redis"
end
