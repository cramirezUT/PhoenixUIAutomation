## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module W2gPlayerPage
	include RSpec::Matchers
	include Selenium

	#### Inquiry METHODS / LOCATORS ####
	def playerW2gModal
		@browser.div(id: 'W2gPayer-Select')
	end

	def playerW2gModalHelpButton
		@browser.button(id: 'W2gPayer-Select-Help')
	end

	def playerW2gModalPlayerDropdown
		@browser.button(id: 'W2gPayer-Select-Payer-mainbutton')
	end

	def playerW2gModalPlayerSearchTextField
		@browser.text_field(id: 'W2gPayer-Select-Payer-search')
	end

	#### GETTERS ####

	#### VERIFIERS ####
end
