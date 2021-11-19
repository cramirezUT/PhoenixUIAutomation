# -*- encoding: utf-8 -*-
# stub: rubygems-update 2.1.11 ruby hide_lib_for_update

Gem::Specification.new do |s|
  s.name = "rubygems-update".freeze
  s.version = "2.1.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["hide_lib_for_update".freeze]
  s.authors = ["Jim Weirich".freeze, "Chad Fowler".freeze, "Eric Hodel".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDeDCCAmCgAwIBAgIBATANBgkqhkiG9w0BAQUFADBBMRAwDgYDVQQDDAdkcmJy\nYWluMRgwFgYKCZImiZPyLGQBGRYIc2VnbWVudDcxEzARBgoJkiaJk/IsZAEZFgNu\nZXQwHhcNMTMwMjI4MDUyMjA4WhcNMTQwMjI4MDUyMjA4WjBBMRAwDgYDVQQDDAdk\ncmJyYWluMRgwFgYKCZImiZPyLGQBGRYIc2VnbWVudDcxEzARBgoJkiaJk/IsZAEZ\nFgNuZXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCbbgLrGLGIDE76\nLV/cvxdEzCuYuS3oG9PrSZnuDweySUfdp/so0cDq+j8bqy6OzZSw07gdjwFMSd6J\nU5ddZCVywn5nnAQ+Ui7jMW54CYt5/H6f2US6U0hQOjJR6cpfiymgxGdfyTiVcvTm\nGj/okWrQl0NjYOYBpDi+9PPmaH2RmLJu0dB/NylsDnW5j6yN1BEI8MfJRR+HRKZY\nmUtgzBwF1V4KIZQ8EuL6I/nHVu07i6IkrpAgxpXUfdJQJi0oZAqXurAV3yTxkFwd\ng62YrrW26mDe+pZBzR6bpLE+PmXCzz7UxUq3AE0gPHbiMXie3EFE0oxnsU3lIduh\nsCANiQ8BAgMBAAGjezB5MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQW\nBBS5k4Z75VSpdM0AclG2UvzFA/VW5DAfBgNVHREEGDAWgRRkcmJyYWluQHNlZ21l\nbnQ3Lm5ldDAfBgNVHRIEGDAWgRRkcmJyYWluQHNlZ21lbnQ3Lm5ldDANBgkqhkiG\n9w0BAQUFAAOCAQEAOflo4Md5aJF//EetzXIGZ2EI5PzKWX/mMpp7cxFyDcVPtTv0\njs/6zWrWSbd60W9Kn4ch3nYiATFKhisgeYotDDz2/pb/x1ivJn4vEvs9kYKVvbF8\nV7MV/O5HDW8Q0pA1SljI6GzcOgejtUMxZCyyyDdbUpyAMdt9UpqTZkZ5z1sicgQk\n5o2XJ+OhceOIUVqVh1r6DNY5tLVaGJabtBmJAYFVznDcHiSFybGKBa5n25Egql1t\nKDyY1VIazVgoC8XvR4h/95/iScPiuglzA+DBG1hip1xScAtw05BrXyUNrc9CEMYU\nwgF94UVoHRp6ywo8I7NP3HcwFQDFNEZPNGXsng==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2013-11-12"
  s.description = "RubyGems is a package management framework for Ruby.\n\nThis gem is an update for the RubyGems software. You must have an\ninstallation of RubyGems before this update can be applied.\n\nSee Gem for information on RubyGems (or `ri Gem`)\n\nTo upgrade to the latest RubyGems, run:\n\n  $ gem update --system  # you might need to be an administrator or root\n\nSee UPGRADING.rdoc for more details and alternative instructions.\n\n-----\n\nIf you don't have RubyGems installed, you can still do it manually:\n\n* Download from: https://rubygems.org/pages/download\n* Unpack into a directory and cd there\n* Install with: ruby setup.rb  # you may need admin/root privilege\n\nFor more details and other options, see:\n\n  ruby setup.rb --help".freeze
  s.email = ["rubygems-developers@rubyforge.org".freeze]
  s.executables = ["update_rubygems".freeze]
  s.extra_rdoc_files = ["CVE-2013-4287.txt".freeze, "CVE-2013-4363.txt".freeze, "History.txt".freeze, "LICENSE.txt".freeze, "MIT.txt".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "UPGRADING.rdoc".freeze, "hide_lib_for_update/note.txt".freeze]
  s.files = ["CVE-2013-4287.txt".freeze, "CVE-2013-4363.txt".freeze, "History.txt".freeze, "LICENSE.txt".freeze, "MIT.txt".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "UPGRADING.rdoc".freeze, "bin/update_rubygems".freeze, "hide_lib_for_update/note.txt".freeze]
  s.homepage = "http://rubygems.org".freeze
  s.licenses = ["Ruby".freeze, "MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze, "--title=RubyGems Update Documentation".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "RubyGems is a package management framework for Ruby".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<builder>.freeze, ["~> 2.1"])
      s.add_development_dependency(%q<hoe-seattlerb>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<ZenTest>.freeze, ["~> 4.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.3"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.7"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<builder>.freeze, ["~> 2.1"])
      s.add_dependency(%q<hoe-seattlerb>.freeze, ["~> 1.2"])
      s.add_dependency(%q<ZenTest>.freeze, ["~> 4.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9.3"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<builder>.freeze, ["~> 2.1"])
    s.add_dependency(%q<hoe-seattlerb>.freeze, ["~> 1.2"])
    s.add_dependency(%q<ZenTest>.freeze, ["~> 4.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9.3"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.7"])
  end
end
