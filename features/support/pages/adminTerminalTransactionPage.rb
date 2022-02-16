## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$terminalId = "1"
$terminalIdInvalid = "100"
$typeOptionDraw = "Draw"
$typeOptionReturn = "Return"
$typeOptionFinalReturn = "Final Return"
$typeOptionAdjust = "Adjust"

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
		@browser.text_field(id: '')
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

	#### GETTERS ####
	def getAdminTerminalTransactionResultError
		@browser.label(id: 'AdminTransaction-Error')
	end

	#### VERIFIERS ####
	def verifyTerminalTransactionResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalTransactionResultError.text).to include(expectedResult)
		getAdminTerminalTransactionResultError.flash(color: ["yellow"])
	end
end
