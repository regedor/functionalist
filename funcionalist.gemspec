# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'funcionalist/version'

Gem::Specification.new do |s|
  s.name        = 'funcionalist'
  s.version     = Funcionalist::VERSION
  s.summary     = "The beauty of functional programing in ruby!"
  s.description = s.summary  

  s.required_ruby_version = '>= 1.9.3'

  s.license     = 'MIT'

  s.author   = "Miguel Regedor"
  s.email    = 'miguelregedor@gmail.com'
  s.homepage = 'http://rubygems.org/gems/funcionalist'

  s.files         = Dir['CHANGELOG.md', 'MIT-LICENSE', 'README.rdoc', 'lib/**/*']
  s.require_paths = ['lib']
end
