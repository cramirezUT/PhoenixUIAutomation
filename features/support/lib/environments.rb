# coding: utf-8
# frozen_string_literal: true

class EnvironmentHelper
  def self.for_environment
    env = ENV['target'] || :staging

    {
      prod: {
        url: 'https://phoenix.com/'
      },
      master: {
      url:   'https://phoenix.master.com/',
      },
      dev: {
      url: 'https://phoenix.dev.com/',
      },
      staging: {
      url:   'https://phoenix.fbmtest.com/',
      },
      local: {
      url:   'https://localhost:9443/',
      },
    }[env.to_sym]
  end

  def self.domain
    env = ENV['target'] || :dev

    env == :dev ? 'http://' : 'https://'
  end

  def self.base_url
    "#{for_environment[:url]}"
  end
end
