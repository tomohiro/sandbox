# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'zootool_mixi/version'

Gem::Specification.new do |s|
  s.name        = 'zootool_mixi'
  s.version     = ZootoolMixi::VERSION
  s.authors     = ['Tomohiro, TAIRA']
  s.email       = ['tomohiro.t@gmail.com']
  s.homepage    = ''
  s.summary     = %q{Post Zootool bookmarks to the mixi diary}
  s.description = %q{Post Zootool bookmarks to the mixi diary}

  s.rubyforge_project = 'zootool_mixi'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # s.add_development_dependency 'rspec'
  s.add_runtime_dependency 'zootool'
  s.add_runtime_dependency 'pit'
  s.add_runtime_dependency 'mechanize'
end
