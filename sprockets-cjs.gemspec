# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sprockets-cjs"
  s.version     = '0.2.0'
  s.authors     = ["Alex MacCaw, Giulian Drimba"]
  s.email       = ["info@eribium.org","giuliandrimba@gmail.com"]
  s.homepage    = ""
  s.license     = 'MIT'
  s.summary     = %q{Adds CommonJS support to Sprockets}
  s.description = s.summary

  s.rubyforge_project = "sprockets-cjs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "sprockets",     "~> 2.1"
  s.add_development_dependency 'appraisal', '~> 0.5.1'
end
