## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "TST-8683"
$accountGroupIdInvalid = "TNT"

module AccountChecksPage
	include RSpec::Matchers
	include Selenium

	#### ACCOUNT CHECKS METHODS / LOCATORS ####
	def accountChecksModal
		@browser.div(id: 'AccountChecks-Select')
	end

	def accountChecksSearchTextField
		@browser.text_field(id: 'AccountChecks-Select-Account')
	end

	def accountChecksRefreshButton
		@browser.button(id: 'AccountChecks-Select-Refresh')
	end

	def accountChecksHelpButton
		@browser.button(id: 'AccountChecks-Select-Help')
	end

	def accountChecksResultTable
		@browser.table(id: 'AccountChecks-Checks')
	end

	#### GETTERS ####
	def getAccountChecksError
		@browser.label(id: 'AccountChecks-Error')
	end

	#### VERIFIERS ####
	def verifyAccountChecksError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountChecksError.text).to include(expectedResult)
		getAccountChecksError.flash(color: ["yellow"])
	end
end
