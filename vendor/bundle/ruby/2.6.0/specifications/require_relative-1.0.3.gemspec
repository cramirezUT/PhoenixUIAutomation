# -*- encoding: utf-8 -*-
# stub: require_relative 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "require_relative".freeze
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steve Klabnik".freeze, "Brendan Taylor".freeze]
  s.date = "2011-10-22"
  s.description = "In Ruby 1.9.2, \".\" was removed from $:. This is a good idea, for security reasons. This gem backports this to Ruby 1.8.".freeze
  s.email = ["steve@steveklabnik.com".freeze, "whateley@gmail.com".freeze]
  s.homepage = "http://steveklabnik.github.com/require_relative".freeze
  s.rubygems_version = "3.0.9".freeze
  s.summary = "This backports require_relative to Ruby 1.8.".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<rocco>.freeze, [">= 0"])
    else
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<rocco>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rocco>.freeze, [">= 0"])
  end
end
