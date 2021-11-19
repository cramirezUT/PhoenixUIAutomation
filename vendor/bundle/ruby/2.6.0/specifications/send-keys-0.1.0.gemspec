# -*- encoding: utf-8 -*-
# stub: send-keys 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "send-keys".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mark Gandolfo".freeze]
  s.date = "2010-10-30"
  s.description = "Provides cucumber steps and methods to send key presses to DOM Elements with your Capybara tests.".freeze
  s.email = "mark@aussiev8.com.au".freeze
  s.extra_rdoc_files = ["readme.mdown".freeze]
  s.files = ["readme.mdown".freeze]
  s.homepage = "http://github.com/markgandolfo/send-keys".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Simulate key presses in your capybara tests".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capybara>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
  end
end
