## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountId = "TST-8683"
$accountIdInvalid = "TNT"

module AccountExchangesPage
	include RSpec::Matchers
	include Selenium

	#### ACCOUNT Exchanges METHODS / LOCATORS ####
	def accountExchangesModal
		@browser.div(id: 'AccountExchanges-Select')
	end

	def accountExchangesHelpButton
		@browser.button(id: 'AccountExchanges-Select-Help')
	end

	def accountExchangesPendingCheckbox
		@browser.table(id: 'AccountExchanges-Select-Pending')
	end

  def accountExchangesAccountSearchTextField
    @browser.text_field(id: 'AccountExchanges-Select-Account')
  end

	#### GETTERS ####
	def getAccountExchangesError
		@browser.label(id: 'AccountExchanges-Error')
	end

	#### VERIFIERS ####
	def verifyAccountExchangesError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountExchangesError.text).to include(expectedResult)
		getAccountExchangesError.flash(color: ["yellow"])
	end

	def verifyAccountExchangesWarning(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountExchangesError.text).to include(expectedResult)
		getAccountExchangesError.flash(color: ["yellow"])
	end
end
