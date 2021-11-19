# -*- encoding: utf-8 -*-
# stub: strftime 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "strftime".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jim Gay".freeze]
  s.date = "2010-11-04"
  s.description = "Convenient list of strftime format directives".freeze
  s.email = ["jim@saturnflyer.com".freeze]
  s.homepage = "http://rubygems.org/gems/strftime".freeze
  s.post_install_message = "\n  Thanks for installing strftime. You can use these methods to\n  better understand the formats used in Date and Time strftime\n  \n  Strftime::Directives       #=> a full hash of directives\n  Strftime::Directives['%y'] #=> a hash of description and \n                             #   optional example value\n                             \n  Strftime::Directives['y']  #=> optionally exclude the %\n   \n  strfd                      #=> shorthand to get directives\n  strfd('y')                 #=> shorthand to get details\n  ".freeze
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Convenient list of strftime format directives".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version
end
