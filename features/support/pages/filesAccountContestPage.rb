require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module ContestPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST MODAL METHODS / LOCATORS####
	def contestConfigurationModal
		@browser.div(id: 'gridcontentFileContests-Select')
	end

	def contestConfigurationSettingButton
		@browser.button(id: 'FileContests-Manage')
	end

	def contestConfigurationUpdateButton
		@browser.button(id: 'FileContests-Update')
	end

	def contestConfigurationHelpButton
		@browser.button(id: 'FileContests-Help')
	end

end
