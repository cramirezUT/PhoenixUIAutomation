# -*- encoding: utf-8 -*-
# stub: allure-ruby-adaptor-api 0.6.10 ruby lib

Gem::Specification.new do |s|
  s.name = "allure-ruby-adaptor-api".freeze
  s.version = "0.6.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ilya Sadykov".freeze]
  s.date = "2016-02-02"
  s.description = "This is a helper library containing the basics for any ruby-based Allure adaptor.".freeze
  s.email = ["smecsia@yandex-team.ru".freeze]
  s.homepage = "http://allure.qatools.ru".freeze
  s.licenses = ["Apache2".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "allure-ruby-adaptor-api-0.6.10".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<uuid>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mimemagic>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
      s.add_dependency(%q<uuid>.freeze, [">= 0"])
      s.add_dependency(%q<mimemagic>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6.0"])
    s.add_dependency(%q<uuid>.freeze, [">= 0"])
    s.add_dependency(%q<mimemagic>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
