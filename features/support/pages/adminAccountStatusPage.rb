## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountId = "uqa-10032"
$accountIdInvalid = "TNT"

module AccountStatusPage
	include RSpec::Matchers
	include Selenium

	#### STATUS METHODS / LOCATORS ####
	def accountStatusSearchTextField
		@browser.text_field(id: 'AccountStatus-Select-Account')
	end

	def accountStatusHelpButton
		@browser.button(id: 'AccountStatus-Select-Help')
	end

	def accountStatusSearchButton
		@browser.button(id: 'AccountStatus-Select-View')
	end

	def accountStatusDisableButton
		@browser.button(id: 'AccountStatus-Select-Status-Button')
	end

	def accountStatusDeleteAccountCloseButton
		@browser.button(id: 'AccountStatus-Close')
	end

	#### GETTERS ####
	def getAccountStatusError
		@browser.label(id: 'AccountStatus-Error')
	end

	def getAccountStatusDeletedAccountResultView
		@browser.div(id: 'AccountStatus-List')
	end

	#### VERIFIERS ####
	def verifyAccountStatusErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountStatusError.text).to include(expectedResult)
		getAccountStatusError.flash(color: ["yellow"])
	end

	def verifyAccountStatusSearchResultsView
		sleep(1)
		expect(getAccountStatusDeletedAccountResultView).to be_truthy
		getAccountStatusDeletedAccountResultView.flash(color: ["yellow"])
	end
end
