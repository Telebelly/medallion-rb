# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "medallion-rb/version"

Gem::Specification.new do |s|
  s.name        = "medallion-rb"
  s.version     = MedallionRb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["WovenX"]
  s.email       = [""]
  s.homepage    = "https://api.medallion.co"
  s.summary     = "Medallion Credentialing API Ruby Gem"
  s.description = "Ruby client for the Medallion credentialing API."
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 2.7"
  s.metadata    = {}

  s.add_runtime_dependency 'faraday', '>= 1.0.1', '< 3.0'
  s.add_runtime_dependency 'faraday-multipart'
  s.add_runtime_dependency 'marcel'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
