## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminTerminalTransactionTerminalId = "EBET01"
$adminTerminalTransactionTerminalIdInvalid = "100"
$adminTerminalTransactionTypeOptionDraw = "Draw"
$adminTerminalTransactionTypeOptionReturn = "Return"
$adminTerminalTransactionTypeOptionFinalReturn = "Final Return"
$adminTerminalTransactionTypeOptionAdjust = "Adjust"
$adminTerminalTransactionMoneyCount = "1"

module AdminTerminalTransactionPage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL Transaction METHODS / LOCATORS ####
	def adminTerminalTransactionModal
		@browser.div(id: 'AdminTransaction-Command')
	end

	def adminTerminalTransactionModalHelpButton
		@browser.button(id: 'AdminTransaction-Command-Help')
	end

	def adminTerminalTransactionModalTypeDropdown
		@browser.button(id: 'AdminTransaction-Command-Type-mainbutton')
	end

	def adminTerminalTransactionModalTypeSearchTransactionField
		@browser.text_field(id: 'AdminTransaction-Command-Type-search')
	end

	def adminTerminalTransactionModalTerminalTextField
		@browser.text_field(id: 'AdminTransaction-Command-Terminal')
	end

	def adminTerminalTransactionModalSellerTextField
		@browser.button(id: 'AdminTransaction-Command-Seller')
	end

	def adminTerminalTransactionModalCurrencyDropdown
		@browser.button(id: 'AdminTransaction-Command-Currency-mainbutton')
	end

	def adminTerminalTransactionModalCurrencySearchTextField
		@browser.text_field(id: 'AdminTransaction-Command-Currency-search')
	end

	def adminTerminalTransactionModalAmountTextField
		@browser.text_field(id: 'AdminTransaction-Command-Amount')
	end

	def adminTerminalTransactionModalSubmitButton
		@browser.button(id: 'AdminTransaction-Command-Submit')
	end

	def adminTerminalTransactionModalClearButton
		@browser.button(id: 'AdminTransaction-Command-Clear')
	end

	def adminTerminalTransactionModalMoneyButton
		@browser.button(id: 'AdminTransaction-Command-Money')
	end

	#### MONEY MODAL ####
	def adminTerminalTransactionMoneyMondal
		@browser.div(id: 'Money')
	end

	def adminTerminalTransactionMoneyMondalCount01TextField
		@browser.text_field(id: 'Money-Value-1-Nbr')
	end

	def adminTerminalTransactionMoneyMondalCount05TextField
		@browser.text_field(id: 'Money-Value-5-Nbr')
	end

	def adminTerminalTransactionMoneyMondalAmount01TextField
		@browser.text_field(id: 'Money-Value-5-Nbr')
	end

	def adminTerminalTransactionMoneyMondalAmount05TextField
		@browser.text_field(id: 'Money-Value-6-Amt')
	end

	def adminTerminalTransactionMoneyMondalUsdDropdown
		@browser.button(id: 'Money-Currency-mainbutton')
	end

	def adminTerminalTransactionMoneyMondalUsdSearchTextField
		@browser.text_field(id: 'Money-Currency-search')
	end

	def adminTerminalTransactionMoneyMondalSaveButton
		@browser.button(id: 'Money-Save')
	end

	def adminTerminalTransactionMoneyMondalCancelButton
		@browser.button(id: 'Money-Cancel')
	end
	#####################

	#### GETTERS ####
	def getAdminTerminalTransactionResultError
		@browser.label(id: 'AdminTransaction-Error')
	end

	def getAdminTerminalTransactionNewBalance
		sleep(2)
		@browser.element(xpath: "//*[contains(@id,'AdminTransaction-Command') and contains(@id,'AdminTransaction-Command-Balance')]")
	end

	def getAdminTerminalTransactionHistoryEntry
		@browser.div(xpath: "//*[contains(@id,'AdminTransaction-History-Container')]//*[contains(@id,'AdminTransaction-History-Content')]")
	end

	#### VERIFIERS ####
	def verifyTerminalTransactionResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalTransactionResultError.text).to include(expectedResult)
		getAdminTerminalTransactionResultError.flash(color: ["yellow"])
	end

	def verifyTerminalTransactionNewBalance(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalTransactionNewBalance.text).to include(expectedResult)
		getAdminTerminalTransactionNewBalance.flash(color: ["yellow"])
	end

	def verifyTerminalTransactionHistoryText(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalTransactionHistoryEntry.text[20..68]).to include(expectedResult)
		getAdminTerminalTransactionHistoryEntry.flash(color: ["yellow"])
	end
end
