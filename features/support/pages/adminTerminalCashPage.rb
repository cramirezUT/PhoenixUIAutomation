## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminTerminalCashTerminalId = "1"
$adminTerminalCashTerminalIdInvalid = "100"
$adminTerminalCashTerminalTypeOptionPayment = "Payment"
$adminTerminalCashTerminalTypeOptionAdjust = "Adjust"
$adminTerminalCashTerminalAmountOneDollar = "1.00"

module AdminTerminalCashPage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL CASH METHODS / LOCATORS ####
	def adminTerminalCashModal
		@browser.div(id: 'TerminalCash-Select')
	end

	def adminTerminalCashModalExpandButton
		@browser.button(id: 'TerminalCash-Select-Compress')
	end

	def adminTerminalCashModalHelpButton
		@browser.button(id: 'TerminalCash-Select-Help')
	end

	def adminTerminalCashModalTerminalsTextField
		@browser.text_field(id: 'TerminalCash-Select-Terminals')
	end

	def adminTerminalCashModalFilterButton
		@browser.button(id: 'TerminalCash-Select-Filter')
	end

	def adminTerminalCashModalCount
		@browser.label(id: 'TerminalCash-Select-Count')
	end

	def adminTerminalCashModalCountViewButton
		@browser.button(id: 'TerminalCash-Select-View')
	end

	def adminTerminalCashModalBalanceButton
		@browser.button(id: 'TerminalCash-Select-Balance')
	end

	def adminTerminalCashModalActivityButton
		@browser.button(id: 'TerminalCash-Select-Activity')
	end

	def adminTerminalCashModalEnableButton
		@browser.button(id: 'TerminalCash-Select-Enable')
	end

	def adminTerminalCashModalDisableButton
		@browser.button(id: 'TerminalCash-Select-Disable')
	end

	def adminTerminalCashModalTransactionButton
		@browser.button(id: 'TerminalCash-Select-Transaction')
	end

	def adminTerminalCashModalHistoryButton
		@browser.button(id: 'TerminalCash-Select-History')
	end

	def adminTerminalCashModuleBalanceModal
		@browser.div(id: 'TerminalCash-View')
	end

	#### SELECTED TERMINALS MODAL ####
	def selectedTerminalsModal
		@browser.div(id: 'TerminalView')
	end

	def selectedTerminalsModalCloseButton
		@browser.button(id: 'TerminalView-Close')
	end
	##################################

	#### TERMINAL SELECTION FILTER MODAL ####
	def adminTerminalCashTerminalSelectionFilterModal
		@browser.div(id: 'Terminals')
	end

	def adminTerminalCashTerminalSelectionFilterModalCount
		@browser.label(id: 'Terminals-Count')
	end

	def adminTerminalCashTerminalSelectionFilterModalViewButton
		@browser.button(id: 'Terminals-View')
	end

	def adminTerminalCashTerminalSelectionFilterModalMachineDropdown
		@browser.button(id: 'Terminals-Machine-mainbutton')
	end

	def adminTerminalCashTerminalSelectionFilterModalMachineSearchTextField
		@browser.text_field(id: 'Terminals-Machine-search')
	end

	def adminTerminalCashTerminalSelectionFilterModalAreaDropdown
		@browser.button(id: 'Terminals-Area-mainbutton')
	end

	def adminTerminalCashTerminalSelectionFilterModalAreaSearchTextField
		@browser.text_field(id: 'Terminals-Area-search')
	end

	def adminTerminalCashTerminalSelectionFilterModalFacilityDropdown
		@browser.button(id: 'Terminals-Facility-mainbutton')
	end

	def adminTerminalCashTerminalSelectionFilterModalFacilitySearchTextField
		@browser.text_field(id: 'Terminals-Facility-search')
	end

	def adminTerminalCashTerminalSelectionFilterModalGroupDropdown
		@browser.button(id: 'Terminals-Group-mainbutton')
	end

	def adminTerminalCashTerminalSelectionFilterModalGroupSearchTextField
		@browser.text_field(id: 'Terminals-Group-search')
	end

	def adminTerminalCashTerminalSelectionFilterModalClearButton
		@browser.button(id: 'Terminals-Clear')
	end

	def adminTerminalCashTerminalSelectionFilterModalHelpButton
		@browser.button(id: 'Terminals-Help')
	end

	def adminTerminalCashTerminalSelectionFilterModalCloseButton
		@browser.button(id: 'Terminals-Cancel')
	end

	def adminTerminalCashTerminalSelectionFilterModalApplyButton
		@browser.button(id: 'Terminals-Apply')
	end
	#########################################

	#### TERMINAL SELECTION FILTER SELECTION CRITERIA MODAL####
	def accountPricesSelectionCriteriaModal
		@browser.div(id: 'Terminals-Group-FilterDivrows')
	end

	def accountPricesSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField1-mainbutton')
	end

	def accountPricesSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField1-search')
	end

	def accountPricesSelectionCriteriaOperandDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField2-mainbutton')
	end

	def accountPricesSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField2-search')
	end

	def accountPricesSelectionCriteriaValueDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField3-mainbutton')
	end

	def accountPricesSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField3-search')
	end

	def accountPricesSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def accountPricesSelectionCriteriaCancelIcon
		@browser.button(id: 'Terminals-Group-FilterDiv1CancelButton')
	end

	def accountPricesSelectionCriteriaAddIcon
		@browser.button(id: 'Terminals-Group-FilterDiv2OKButton')
	end

	def accountPricesSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def accountPricesSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def accountPricesSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	#### GETTERS ####
	def getAdminTerminalCashResultError
		@browser.label(id: 'TerminalCash-Error')
	end

	#### VERIFIERS ####
	def verifyTerminalCashResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalCashResultError.text).to include(expectedResult)
		getAdminTerminalCashResultError.flash(color: ["yellow"])
	end
end
