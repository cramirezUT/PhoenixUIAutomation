## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminAccountTransactionGroupId =  "uqa-10032"
$adminAccountTransactionSourceGroupIdInvalid = "TNT"
$adminAccountTransactionSourceGroupId = "UQA - United Tote QA"
$adminAccountTransactionIdDeposit = "Deposit"
$adminAccountTransactionIdWithdraw = "Withdraw"
$adminAccountTransactionIdAdjust = "Adjust"
$adminAccountTransactionIdTransfer = "Transfer"

module AccountTransactionPage
	include RSpec::Matchers
	include Selenium

	#### TRANSACTION METHODS / LOCATORS ####
	def accountTransactionsSourceGroupDropdown
		@browser.button(id: 'AccountTransaction-Select-Group-mainbutton')
	end

	def accountTransactionsSourceGroupSearchTextField
		@browser.text_field(id: 'AccountTransaction-Select-Group-search')
	end

	def accountTransactionsSourceGroupSearchFilterButton
		@browser.button(id: 'AccountTransaction-Select-Group-filterbutton')
	end

	#### ACCOUNT TRANSACTION SOURCE SELECTION CRITERIA MODAL ####
	def accountTransactionSourceGroupSelectionCriteriaModal
		@browser.div(id: 'AccountTransaction-Select-Group-FilterDivrows')
	end

	def accountTransactionSourceGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def accountTransactionSourceGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'AccountTransaction-Select-Group-FilterDiv1FilterField1-search')
	end

	def accountTransactionSourceGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def accountTransactionSourceGroupSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv1FilterField2-search')
	end

	def accountTransactionSourceGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def accountTransactionSourceGroupSelectionCriteriaValueSearchTextField
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv1FilterField3-search')
	end

	def accountTransactionSourceGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def accountTransactionSourceGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv1CancelButton')
	end

	def accountTransactionSourceGroupSelectionCriteriaAddIcon
		@browser.button(id: 'AccountTransaction-Select-Group-FilterDiv2OKButton')
	end

	def accountTransactionSourceSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def accountTransactionSourceSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def accountTransactionSourceSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	#############################################################

	def accountTransactionsHelpButton
		@browser.button(id: 'AccountTransaction-Select-Help')
	end

	def accountTransactionTransactionDropdown
		@browser.button(id: 'AccountTransaction-Select-Type-mainbutton')
	end

	def accountTransactionTransactionSearchTextField
		@browser.text_field(id: 'AccountTransaction-Select-Type-search')
	end

	def accountTransactionAccountSearchTextField
		@browser.text_field(id: 'AccountTransaction-Select-Account')
	end

	def accountTransactionAccountFromTextfield
		@browser.text_field(id: 'AccountTransaction-Select-Account')
	end

	def accountTransactionAccountToTextfield
		@browser.text_field(id: 'AccountTransaction-Select-To-Account')
	end

	def accountTransactionViewButton
		@browser.button(id: 'AccountTransaction-Select-View')
	end

	def accountTransactionSelectBalanceClick
		@browser.label(id: 'AccountTransaction-Select-Balance')
	end

	#### GETTERS ####
	def getAccountTransactionError
		@browser.li(id: 'ut-ms-opt-AccountTransaction-Select-Group_noresults')
	end

	def getAdminAccountTransactionAccountName
		@browser.label(id: 'AccountTransaction-Select-Name')
	end

	#### VERIFIERS ####
	def verifyAccountTransactionErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountTransactionError.text).to include(expectedResult)
		getAccountTransactionError.flash(color: ["yellow"])
	end

	def verifyAccountTransactionSearchResultsName(result)
		sleep(2)
		expectedResult = "#{result}"
		expect(getAdminAccountTransactionAccountName.text).to include(expectedResult)
		getAdminAccountTransactionAccountName.flash(color: ["yellow"])
	end
end
