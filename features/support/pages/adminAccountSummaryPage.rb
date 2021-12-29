## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$currencyUSD = "USD"
$currencyInvalid = "XXX"

module AccountSummaryPage
	include RSpec::Matchers
	include Selenium

	#### SUMMARY METHODS / LOCATORS ####
	def summaryAccountModal
		@browser.div(id: 'AccountSummary-Summary')
	end

	def summaryAccountHelpButton
		@browser.button(id: 'AccountSummary-Summary-Help')
	end

	def summaryAccountCurrencyDropdown
		@browser.button(id: 'AccountSummary-Summary-Currency-mainbutton')
	end

	def summaryAccountCurrencySearchTextField
		@browser.text_field(id: 'AccountSummary-Summary-Currency-search')
	end

	def summaryAccountCashButton
		@browser.button(id: 'AccountSummary-Summary-Cash')
	end

	def summaryAccountCheckButton
		@browser.button(id: 'AccountSummary-Summary-Check')
	end

	def summaryAccountTotalButton
		@browser.button(id: 'AccountSummary-Summary-Total')
	end

	def summaryAccountDepositButton
		@browser.button(id: 'AccountSummary-Summary-Deposit-Filter')
	end

	def summaryAccountWithdrawButton
		@browser.button(id: 'AccountSummary-Summary-Withdraw-Filter')
	end

	def summaryAccountAdjustButton
		@browser.button(id: 'AccountSummary-Summary-Adjust-Filter')
	end

	def summaryAccountCancelButton
		@browser.button(id: 'AccountSummary-Summary-Cancel-Filter')
	end

	def summaryAccountPayButton
		@browser.button(id: 'AccountSummary-Summary-Pay-Filter')
	end
	#### GETTERS ####
	def getSummaryAccountNoMatchError
		@browser.li(id: 'ut-ms-opt-AccountSummary-Summary-Currency_noresults')
	end

	def getAccountSummaryResults
		@browser.div(id: 'AccountSummary-List-HT-0')
	end
	#######################
	#######################

	#### VERIFIERS ####
	def verifySummaryAccountErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSummaryAccountNoMatchError.text).to include(expectedResult)
		getSummaryAccountNoMatchError.flash(color: ["yellow"])
	end

	def verifySummaryAccountSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountSummaryResults.text).to include(expectedResult)
		getAccountSummaryResults.flash(color: ["yellow"])
	end
end
