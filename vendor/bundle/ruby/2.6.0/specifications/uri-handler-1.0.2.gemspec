# -*- encoding: utf-8 -*-
# stub: uri-handler 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "uri-handler".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["foomip".freeze]
  s.date = "2012-01-25"
  s.description = "Nothing fancy going on here, this module is just a wrapper around the function CGI::escape\nand CGI::unescape. Functionality is added to the String class, so just add the module and\nthe extra funcitons will be there for you to use (check out the README file for basic usage).\nI just wanted an easier and cleaner way to encode/decode uri strings for my ruby projects.".freeze
  s.email = "nelsondcp@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE.txt".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/foomip/uri-handler".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Additional string functionality to make uri encoding easier and cleaner to use in your Ruby code".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>.freeze, [">= 0"])
  end
end
