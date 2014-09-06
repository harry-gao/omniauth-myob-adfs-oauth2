# coding: utf-8
require File.expand_path(File.join('..', 'lib', 'omniauth', 'myob_adfs_oauth', 'version'), __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency 'omniauth', '> 1.0'
  
  spec.name          = "omniauth-myob-adfs-oauth"
  spec.version       = OmniAuth::MyobAdfsOauth::VERSION
  spec.authors       = ["Haiyang (harry) Gao"]
  spec.email         = ["foxgaocn@gmail.com"]
  spec.description   = %q{A MYOB Adfs OAuth2 strategy for OmniAuth 1.x}
  spec.summary       = %q{A MYOB Adfs OAuth2 strategy for OmniAuth 1.x}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'
  spec.add_development_dependency "rake"


  spec.add_development_dependency 'rspec', '>= 2.14.0'
  
end
