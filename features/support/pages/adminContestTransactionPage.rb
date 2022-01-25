## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$depositAmount101Dollar = "1.01"
$withdrawAmount102Dollar = "1.02"
$balanceAmount103Dollar = "1.03"
$winningsAmount104Dollar = "1.04"
$entryAmount105Dollar = "1.05"
$groupId = "TL1"
$playerId = "TL1-1"
$playerIdInvalid = "TNT"
$transactionOptionDeposit = "Deposit"
$transactionOptionWithdraw = "Withdraw"
$transactionOptionBalance = "Balance"
$transactionOptionWinnings = "Winnings"
$transactionOptionEntry = "Entry"

module ContestTransactionPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST STANDINGS METHODS / LOCATORS ####
	def playerTransactionsModal
		@browser.div(id: 'ContestTransaction-Select')
	end

	def playerTransactionsModalHelpButton
		@browser.div(id: 'ContestTransaction-Select-Help')
	end

	def playerTransactionsModalGroupDropdown
		@browser.button(id: 'ContestTransaction-Select-Group-mainbutton')
	end

	def playerTransactionsModalGroupSearchTextField
		@browser.text_field(id: 'ContestTransaction-Select-Group-search')
	end

	def playerTransactionsModalTransactionDropdown
		@browser.button(id: 'ContestTransaction-Select-Type-mainbutton')
	end

	def playerTransactionsModalTransactionSearchTextField
		@browser.text_field(id: 'ContestTransaction-Select-Type-search')
	end

	def playerTransactionsModalPlayerTextField
		@browser.text_field(id: 'ContestTransaction-Select-Account')
	end

	def playerTransactionsModalPlayerViewButton
		@browser.button(id: 'ContestTransaction-Select-View')
	end

	def playerTransactionsModalTournamentDropdown
		@browser.button(id: 'ContestTransaction-Select-Tournament-mainbutton')
	end

	def playerTransactionsModalScheduleDropdown
		@browser.button(id: 'ContestTransaction-Select-Schedule-mainbutton')
	end

	def playerTransactionsModalScheduleSearchTextField
		@browser.text_field(id: 'ContestTransaction-Select-Schedule-search')
	end

	def playerTransactionsModalBalanceLabel
		@browser.label(id: 'ContestTransaction-Select-Balance')
	end

	def playerTransactionsModalWinningsLabel
		@browser.label(id: 'ContestTransaction-Select-Winnings')
	end

	def playerTransactionsModalAountTextField
		@browser.text_field(id: 'ContestTransaction-Select-Amount')
	end

	def playerTransactionsModalSubmitButton
		sleep(1)
		@browser.button(id: 'ContestTransaction-Select-Submit')
	end

	#### CONTEST TRANSACTION MODAL ####
	def contestTransactionsResultModal
		@browser.div(id: 'ContestTransaction-Detail')
	end

	def contestTransactionsResultModalCloseButton
		@browser.button(id: 'ContestTransaction-Detail-Close')
	end
	###################################


	#### PLAYER TRANSACTIONS SELECTION CRITERIA MODAL ####
	def playerTransactionSelectionCriteriaModal
		@browser.div(id: 'ContestTransaction-Select-Group-FilterDivrows')
	end

	def playerTransactionSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def playerTransactionSelectionCriteriaSearchTextField
		@browser.text_field(id: 'ContestTransaction-Select-Group-FilterDiv1FilterField1-search')
	end

	def playerTransactionSelectionCriteriaOperandDropdown
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def playerTransactionSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv1FilterField2-search')
	end

	def playerTransactionSelectionCriteriaValueDropdown
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def playerTransactionSelectionCriteriaValueSearchTextField
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv1FilterField3-search')
	end

	def playerTransactionSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def playerTransactionSelectionCriteriaCancelIcon
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv1CancelButton')
	end

	def playerTransactionSelectionCriteriaAddIcon
		@browser.button(id: 'ContestTransaction-Select-Group-FilterDiv2OKButton')
	end

	def adminBalanceSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def adminBalanceSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def adminBalanceSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	#############################################################


	#### GETTERS ####
	def getDepositAmountTotal
		@browser.element(xpath: "//*[contains(@id,'ContestTransaction-History-Container-Items')]//*[contains(@id,'ContestTransaction-History-Content')]")
	end

	def getPlayerTransactionResultError
		@browser.label(id: 'ContestTransaction-Error')
	end

	#### VERIFIERS ####
	def verifyDepositAmount(depositAmount)
		sleep(5)
		expectedDepositAmount = "#{depositAmount}"
		expect(getDepositAmountTotal.text).to include(expectedDepositAmount)
		getDepositAmountTotal.flash(color: ["yellow"])
	end

	def verifyPlayerTransactionResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getPlayerTransactionResultError.text).to include(expectedResult)
		getPlayerTransactionResultError.flash(color: ["yellow"])
	end
end
