## Library Helper file
## Author: Carlos Ramirez

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
  $toteSiteUrl = "https://pws.fbmtest.com/"

  #### METHODS ####
  def launchToteBrowser
    Watir.default_timeout = 30
    Watir.logger.ignore(:deprecations)
    puts "Launching Chrome Browser..."
		caps = Selenium::WebDriver::Remote::Capabilities.chrome
		client = Selenium::WebDriver::Remote::Http::Default.new
		#client.timeout = 120
		url = "http://localhost:9515"
		@browser = Watir::Browser.new :remote, {desired_capabilities: caps, http_client: client, url: url}
		#Selenium::WebDriver::Chrome::Service.driver_path="/mnt/c/Users/Administrator/Desktop/chromedriver" # Uncomment for MacOS only
		#@browser = Watir::Browser.new :chrome, switches: ['--ignore-certificate-errors']
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
