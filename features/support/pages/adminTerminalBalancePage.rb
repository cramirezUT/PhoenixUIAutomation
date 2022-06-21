## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminTerminalBalanceTerminalId = "1"
$adminTerminalBalanceTerminalIdInvalid = "100"
$adminTerminalBalanceTerminalTypeOptionPayment = "Payment"
$adminTerminalBalanceTerminalTypeOptionAdjust = "Adjust"
$adminTerminalBalanceTerminalAmountOneDollar = "1.00"

module AdminTerminalBalancePage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL BALANCE METHODS / LOCATORS ####
	def adminTerminalBalanceModal
		@browser.div(id: 'TerminalBalance-Select')
	end

	def adminTerminalBalanceModalExpandButton
		@browser.button(id: 'TerminalBalance-Select-Compress')
	end

	def adminTerminalBalanceModalRefreshButton
		@browser.button(id: 'TerminalBalance-Select-Refresh')
	end

	def adminTerminalBalanceModalHelpButton
		@browser.button(id: 'TerminalBalance-Select-Help')
	end

	def adminTerminalBalanceModalTerminalsTextField
		@browser.text_field(id: 'TerminalBalance-Select-Terminals')
	end

	def adminTerminalBalanceModalTerminalCount
		@browser.label(id: 'TerminalBalance-Select-Count')
	end

	def adminTerminalBalanceModalViewButton
		@browser.button(id: 'TerminalBalance-Select-View')
	end

	def adminTerminalBalanceResultsModal
		@browser.div(id: 'TerminalBalance-View')
	end

	#### TERMINAL SELECTION FILTER MODAL ####
	def adminTerminalBalanceTerminalSelectionFilterModal
		@browser.div(id: 'Terminals')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalCount
		@browser.label(id: 'Terminals-Count')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalViewButton
		@browser.button(id: 'Terminals-View')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalMachineDropdown
		@browser.button(id: 'Terminals-Machine-mainbutton')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalMachineSearchTextField
		@browser.text_field(id: 'Terminals-Machine-search')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalAreaDropdown
		@browser.button(id: 'Terminals-Area-mainbutton')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalAreaSearchTextField
		@browser.text_field(id: 'Terminals-Area-search')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalFacilityDropdown
		@browser.button(id: 'Terminals-Facility-mainbutton')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalFacilitySearchTextField
		@browser.text_field(id: 'Terminals-Facility-search')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalGroupDropdown
		@browser.button(id: 'Terminals-Group-mainbutton')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalGroupSearchTextField
		@browser.text_field(id: 'Terminals-Group-search')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalClearButton
		@browser.button(id: 'Terminals-Clear')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalHelpButton
		@browser.button(id: 'Terminals-Help')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalCloseButton
		@browser.button(id: 'Terminals-Cancel')
	end

	def adminTerminalBalanceTerminalSelectionFilterModalApplyButton
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

	#### SELECTED TERMINAL ####
	def selectedTerminalModal
		@browser.div(id: 'TerminalView')
	end

	def selectedTerminalModalCloseButton
		@browser.button(id: 'TerminalView-Close')
	end

	def selectedTerminalModalByRow(index)
		@browser.div(id: "TerminalView-Terminals-#{index}")
	end
	###########################

	#### GETTERS ####
	def getAdminTerminalBalanceResultError
		@browser.label(id: 'TerminalBalance-Error')
	end

	#### VERIFIERS ####
	def verifyTerminalBalanceResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalBalanceResultError.text).to include(expectedResult)
		getAdminTerminalBalanceResultError.flash(color: ["yellow"])
	end
end
