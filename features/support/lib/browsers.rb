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
	$toteSiteUrl = "https://pws.fbmtest.com/" # Use for VM Box
#	$toteSiteUrl = "https://phoenix.fbmtest.com/" # Use for local

  #### METHODS ####
  def launchToteBrowser
    Watir.default_timeout = 15
    Watir.logger.ignore(:deprecations)
    puts "Launching Chrome Browser..."
		caps = Selenium::WebDriver::Remote::Capabilities.chrome #Uncomment for remote ChromeDriver
		client = Selenium::WebDriver::Remote::Http::Default.new #Uncomment for remote ChromeDriver
		url = "http://localhost:9515" #Uncomment for remote ChromeDriver
		@browser = Watir::Browser.new :remote, {desired_capabilities: caps, http_client: client, url: url} #Uncomment for remote ChromeDriver
		#Selenium::WebDriver::Chrome::Service.driver_path="/usr/local/bin/chromedriver" # Uncomment for MacOS only
		#@browser = Watir::Browser.new :chrome, switches: ['--ignore-certificate-errors'] #Uncomment for MacOS only
		@browser.driver.manage.timeouts.page_load = 15
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
