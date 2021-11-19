# -*- encoding: utf-8 -*-
# stub: facets 3.1.0 ruby lib/core lib/standard

Gem::Specification.new do |s|
  s.name = "facets".freeze
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib/core".freeze, "lib/standard".freeze]
  s.authors = ["Thomas Sawyer".freeze]
  s.date = "2016-05-09"
  s.description = "Facets is the premier collection of extension methods for the Ruby programming language. Facets extensions are unique by virtue of thier atomicity. They are stored in individual files allowing for highly granular control of requirements. In addition, Facets includes a few additional classes and mixins suitable to wide variety of applications.".freeze
  s.email = ["transfire@gmail.com".freeze]
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "NOTICE.rdoc".freeze, "CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "README.md".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "LICENSE.txt".freeze, "NOTICE.rdoc".freeze, "README.md".freeze]
  s.homepage = "http://rubyworks.github.com/facets".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "The orginal well curated collection of extension methods for Ruby.".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<lemon>.freeze, [">= 0"])
      s.add_development_dependency(%q<qed>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubytest-cli>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
    else
      s.add_dependency(%q<lemon>.freeze, [">= 0"])
      s.add_dependency(%q<qed>.freeze, [">= 0"])
      s.add_dependency(%q<rubytest-cli>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<lemon>.freeze, [">= 0"])
    s.add_dependency(%q<qed>.freeze, [">= 0"])
    s.add_dependency(%q<rubytest-cli>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
  end
end
