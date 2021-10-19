require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'webdriver-user-agent'
require_relative 'environments.rb'
require_relative '../spec/spec_helper.rb'

module Browsers
	include RSpec::Matchers
  include Selenium

  #### VARIABLES ####
  $toteSiteUrl = "https://phoenix.fbmtest.com/"

  #### METHODS ####
  def launchToteBrowser
    Watir.default_timeout = 60
    Watir.logger.ignore(:deprecations)
    #### HEADLESS BROWSER
	# if ENV['app_type'] == 'headless'
		# puts "Running Headless Environment"
		# $opts = Selenium::WebDriver::Firefox::Options::new(args: ['-headless', '--window-size=1200x1000'])
		# @client = Selenium::WebDriver::Remote::Http::Default.new
		# @client.read_timeout = 60
		# @profile = Selenium::WebDriver::Firefox::Profile.new#CHANGE
		# @profile['browser.download.dir'] = "/tmp/webdriver-downloads"
		# @profile['browser.download.folderList'] = 2
		# @profile['browser.helperApps.neverAsk.saveToDisk'] = "application/octet-stream"
		# @browser = Watir::Browser.new :firefox, :profile => @profile, :http_client => @client, :options => $opts#CHANGE
		# @browser.driver.manage.timeouts.page_load = 60
		# puts "Window Size:#{@browser.driver.manage.window.size}"
		# target_size = Selenium::WebDriver::Dimension.new(1024, 758)
		# @browser.driver.manage.window.size = target_size
		# puts "New Window Size:#{@browser.driver.manage.window.size}"
		# @website = ENV['target'] || $toteSiteUrl
		# @browser.goto @website
		# @browser.ready_state.eql? "complete"
    # #### WEB BROWSER
	# elsif ENV['app_type'] == 'browser'
  #   puts "Running App Locally..."
  # case ENV['browser_type']
  #### CHROME BROWSER
  # when ("chrome")
    puts "Launching Chrome Browser..."
    # @client = Selenium::WebDriver::Remote::Http::Default.new
    # @client.read_timeout = 60
    # @profile = Selenium::WebDriver::Chrome::Profile.new#CHANGE
    # @profile['browser.download.dir'] = "/tmp/webdriver-downloads"
    # @profile['browser.download.folderList'] = 2
    # @profile['browser.helperApps.neverAsk.saveToDisk'] = "application/octet-stream"
    @browser = Watir::Browser.new :chrome
    @browser.driver.manage.timeouts.page_load = 60
    @browser.window.maximize()
    @website = $toteSiteUrl
    @browser.goto @website
    @browser.ready_state.eql? "complete"
  # #### FIREFOX BROWSER
  # when ("firefox")
  #   puts "Launching Firefox Browser..."
  #   @client = Selenium::WebDriver::Remote::Http::Default.new
  #   @client.read_timeout = 60
  #   @profile = Selenium::WebDriver::Firefox::Profile.new#CHANGE
  #   @profile['browser.download.dir'] = "/tmp/webdriver-downloads"
  #   @profile['browser.download.folderList'] = 2
  #   @profile['browser.helperApps.neverAsk.saveToDisk'] = "application/octet-stream"
  #   @browser = Watir::Browser.new :firefox, :profile => @profile, :http_client => @client, :options => $opts #CHANGE
  #   @browser.driver.manage.timeouts.page_load = 60
  #   @browser.window.maximize()
  #   @website = ENV['target'] || $toteSiteUrl
  #   @browser.goto @website
  #   @browser.ready_state.eql? "complete"
	# #### SAFARI BROWSER
  # when ("safari")
  #   puts "Launching Safari Browser..."
  #   @client = Selenium::WebDriver::Remote::Http::Default.new
  #   @client.read_timeout = 60
  #   @browser = Watir::Browser.new :safari, :profile => @profile, :http_client => @client, :options => $opts #CHANGE
  #   @browser.driver.manage.timeouts.page_load = 60
  #   @browfgh fg hser.window.maximize()
  #   @website = ENV['target'] || $toteSiteUrl
  #   @browser.goto @website
  #   @browser.ready_state.eql? "complete"
  #   end
  # 	end
  end

	def browser_goto(url)
		@browser.goto ("#{::EnvironmentHelper.base_url}" + url)
	end

	def close_browser
	  @browser.close
	end
end
