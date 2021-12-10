require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'webdriver-user-agent'
require_relative 'environments.rb'

module Browsers
	include RSpec::Matchers
  include Selenium

  #### VARIABLES ####
  $toteSiteUrl = "https://phoenix.fbmtest.com/"

  #### METHODS ####
  def launchToteBrowser
    Watir.default_timeout = 30
    Watir.logger.ignore(:deprecations)
    puts "Launching Chrome Browser..."
		# Selenium::WebDriver::Chrome::Service.driver_path="/usr/local/bin/chromedriver" # Uncomment for MacOS only
		@browser = Watir::Browser.new :chrome
		@browser.driver.manage.timeouts.page_load = 30
		@browser.window.maximize()
		@website = $toteSiteUrl
		@browser.goto @website
  end

	def browser_goto(url)
		@browser.goto ("#{::EnvironmentHelper.base_url}" + url)
	end

	def currentBrowserUrlVerified(expectedURL)
		@current_url = @browser.url
		expectedUrlText = "#{expectedURL}"
		expect(@current_url).to eql(expectedUrlText)
	end

	def close_browser
	  @browser.close
	end
end
