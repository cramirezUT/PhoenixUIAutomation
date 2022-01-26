## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$dealerId = "UQA8"
$dealerIdInvalid = "TNT"
$dealerPin = "1234"
$cashBalanceAmountZero = "0.00"
$typeOptionDraw = "Draw"
$typeOptionReturn = "Return"
$typeOptionFinalReturn = "Final Return"
$amountOneDollar = "1.00"


module AdminDealerPage
	include RSpec::Matchers
	include Selenium

	#### ADMIN DEALER METHODS / LOCATORS ####
	def adminDealerModal
		@browser.div(id: 'AdminDealer-Select')
	end

	def adminDealerModalDealerTextField
		@browser.text_field(id: 'AdminDealer-Select-Dealer')
	end

	def adminDealerModalPinTextField
		@browser.text_field(id: 'AdminDealer-Select-PIN')
	end

	def adminDealerModalHelpButton
		@browser.button(id: 'AdminDealer-Select-Help')
	end

	#### ADMIN DEALER COMMAND MODAL ####
	def adminDealerCommandModal
		@browser.div(id: 'AdminDealer-Command')
	end

	def adminDealerCommandModalBalanceButton
		@browser.button(id: 'AdminDealer-Command-Balance')
	end

	def adminDealerCommandModalReportButton
		@browser.button(id: 'AdminDealer-Command-Report')
	end

	def adminDealerCommandModalTransactionButton
		@browser.button(id: 'AdminDealer-Command-Transaction')

	end

	def adminDealerCommandModalReceiptTextField
		@browser.text_field(id: 'AdminDealer-Command-Receipt')
	end
	##############################

	#### ADMIN DEALER BALANCE MODAL ####
	def adminDealerBalanceModal
		@browser.div(id: 'AdminDealer-Balance')
	end

	def adminDealerBalanceModalCashTextField
		sleep(1)
		@browser.text_field(id: 'AdminDealer-Balance-Cash')
	end
	####################################

	#### ADMIN DEALER USER MODAL ####
	def adminDealerUserModal
		@browser.div(id: 'AdminDealer-Dealer')
	end

	def adminDealerUserModalSubmitButton
		@browser.button(id: 'AdminDealer-Dealer-Transaction-Submit')
	end

	def adminDealerUserModalCloseButton
		@browser.button(id: 'AdminDealer-Dealer-Transaction-Cancel')
	end

	def adminDealerUserModalTypeDropdown
		@browser.button(id: 'AdminDealer-Dealer-Transaction-Type-mainbutton')
	end

	def adminDealerUserModalTypeSearchTextField
		@browser.text_field(id: 'AdminDealer-Dealer-Transaction-Type-search')
	end

	def adminDealerUserModalFundsDropdown
		@browser.button(id: 'AdminDealer-Dealer-Transaction-Funds-mainbutton')
	end

	def adminDealerUserModalFundsSearchTextField
		@browser.text_field(id: 'AdminDealer-Dealer-Transaction-Funds-search')
	end

	def adminDealerUserModalBankDropdown
		@browser.button(id: 'AdminDealer-Dealer-Transaction-Bank-mainbutton')
	end

	def adminDealerUserModalBankSearchTextField
		@browser.text_field(id: 'AdminDealer-Dealer-Transaction-Bank-search')
	end

	def adminDealerUserModalAmountTextfield
		@browser.text_field(id: 'AdminDealer-Dealer-Transaction-Amount')
	end
	#################################

	#### GETTERS ####
	def getAdminDealerError
		@browser.label(id: 'AdminDealer-Select-Error')
	end

	def getAdminDealerHistoryContent
		@browser.div(xpath: "//*[contains(@id,'AdminDealer-History-Container')]//*[contains(@id,'AdminDealer-History-Content')]")
	end

	#### VERIFIERS ####
	def verifyAdminDealerError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminDealerError.text).to include(expectedResult)
		getAdminDealerError.flash(color: ["yellow"])
	end

	def verifyAdminDealerHistoryContent(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminDealerHistoryContent.text).to include(expectedResult)
		getAdminDealerHistoryContent.flash(color: ["yellow"])
	end
end
