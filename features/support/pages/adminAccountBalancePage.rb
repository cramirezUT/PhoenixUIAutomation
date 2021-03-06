## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminAccountBalanceGroupId = "uqa-10032"
$adminAccountBalanceInvalidGroupId = "99"

module AccountBalancePage
	include RSpec::Matchers
	include Selenium

	#### Account Balance METHODS / LOCATORS ####
	def accountBalanceModal
		@browser.div(id: 'AccountBalance-Select')
	end

	def accountBalanceSearchTextField
		@browser.text_field(id: 'AccountBalance-Select-Account')
	end

	def accountBalanceResultModal
		@browser.div(id: 'AccountBalance-Amounts')
	end

	def accountBalanceHelpButton
		@browser.button(id: 'AccountBalance-Select-Help')
	end

	#### GETTERS ####
	def getAccountBalanceError
		@browser.label(id: 'AccountBalance-Error')
	end

	def getAccountBalance
		@browser.label(id: 'AccountBalance-Amounts-Balance')
	end

	#### VERIFIERS ####
	def verifyAccountBalanceError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountBalanceError.text).to include(expectedResult)
		getAccountBalanceError.flash(color: ["yellow"])
	end

	def verifyAccountBalanceAmount(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountBalance.text).to include(expectedResult)
		getAccountBalance.flash(color: ["yellow"])
	end
end
