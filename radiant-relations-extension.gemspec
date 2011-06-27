# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-relations-extension/version"

Gem::Specification.new do |s|
  s.name        = "radiant-relations-extension"
  s.version     = RadiantRelationsExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jan De Poorter"]
  s.email       = ["jan@defv.be"]
  s.homepage    = "http://github.com/defv/radiant-relations-extension"
  s.summary     = %q{Relations for Radiant CMS}
  s.description = %q{Makes Radiant better by adding relations!}
  
  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
  
  s.post_install_message = %{
  Add this to your radiant project with:
    config.gem 'radiant-relations-extension', :version => '~>#{RadiantRelationsExtension::VERSION}'
  }
end