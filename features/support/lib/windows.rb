require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module WindowsHelpers
	include RSpec::Matchers
	include Selenium

	def use_first_window
		sleep(1)
		@browser.windows.first.use
	end

	def use_last_window
		sleep(1)
		@browser.windows.last.use
	end

	def close_first_window
		sleep(1)
		@browser.windows.first.close
	end

	def close_last_window
		sleep(1)
		@browser.windows.last.close
	end
end
