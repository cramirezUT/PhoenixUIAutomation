# -*- encoding: utf-8 -*-
# stub: webdriver-user-agent 7.8 ruby lib

Gem::Specification.new do |s|
  s.name = "webdriver-user-agent".freeze
  s.version = "7.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alister Scott".freeze, "Jeff Morgan".freeze, "Sandeep Singh".freeze, "Sam Nissen".freeze]
  s.date = "2020-07-10"
  s.description = "A helper gem to emulate populate device user agents and resolutions when using webdriver".freeze
  s.email = ["alister.scott@gmail.com".freeze, "jeff.morgan@leandog.com".freeze, "sandeepnagra@gmail.com".freeze, "scnissen@gmail.com".freeze]
  s.homepage = "https://github.com/alisterscott/webdriver-user-agent".freeze
  s.requirements = ["chromedriver, v2.20".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "A helper gem to emulate populate device user agents and resolutions when using webdriver".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<selenium-webdriver>.freeze, [">= 3.4.0"])
      s.add_runtime_dependency(%q<os>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<facets>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<psych>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<watir>.freeze, [">= 0"])
      s.add_development_dependency(%q<webdrivers>.freeze, [">= 0"])
    else
      s.add_dependency(%q<selenium-webdriver>.freeze, [">= 3.4.0"])
      s.add_dependency(%q<os>.freeze, [">= 0"])
      s.add_dependency(%q<facets>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<psych>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<watir>.freeze, [">= 0"])
      s.add_dependency(%q<webdrivers>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<selenium-webdriver>.freeze, [">= 3.4.0"])
    s.add_dependency(%q<os>.freeze, [">= 0"])
    s.add_dependency(%q<facets>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<psych>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<watir>.freeze, [">= 0"])
    s.add_dependency(%q<webdrivers>.freeze, [">= 0"])
  end
end
