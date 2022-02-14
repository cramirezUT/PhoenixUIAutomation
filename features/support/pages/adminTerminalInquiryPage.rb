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

module AdminTerminalInquiryPage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL Inquiry METHODS / LOCATORS ####
	def adminTerminalInquiryModal
		@browser.div(id: 'TerminalInquiry-Select')
	end

	def adminTerminalInquiryModalHelpButton
		@browser.button(id: 'TerminalInquiry-Select-Help')
	end

	def adminTerminalInquiryModalTerminalsTextField
		@browser.text_field(id: 'TerminalInquiry-Select-Terminals')
	end

	def adminTerminalInquiryModalFilterButton
		@browser.button(id: 'TerminalInquiry-Select-Filter')
	end

	def adminTerminalInquiryModalCount
		@browser.label(id: 'TerminalInquiry-Select-Count')
	end

	def adminTerminalInquiryModalViewButton
		@browser.button(id: 'TerminalInquiry-Select-View')
	end

	def adminTerminalInquiryModalTotalButton
		@browser.button(id: 'TerminalInquiry-Select-Total')
	end

	def adminTerminalInquiryModalSummaryButton
		@browser.button(id: 'TerminalInquiry-Select-Summary')
	end

	def adminTerminalInquiryModalDetailButton
		@browser.button(id: 'TerminalInquiry-Select-Detail')
	end

	#### TERMINAL SELECTION FILTER MODAL ####
	def terminalSelectionFilterModal
		@browser.div(id: 'Terminals')
	end

	def terminalSelectionFilterModalCount
		@browser.div(id: 'Terminals-Count')
	end

	def terminalSelectionFilterModalViewButton
		@browser.button(id: 'Terminals-View')
	end

	def terminalSelectionFilterModalMachineDropdown
		@browser.button(id: 'Terminals-Machine-mainbutton')
	end

	def terminalSelectionFilterModalMachineSearchTextField
		@browser.text_field(id: 'Terminals-Machine-search')
	end

	def terminalSelectionFilterModalAreaDropdown
		@browser.button(id: 'Terminals-Area-mainbutton')
	end

	def terminalSelectionFilterModalAreaSearchTextField
		@browser.text_field(id: 'Terminals-Area-search')
	end

	def terminalSelectionFilterModalFacilityDropdown
		@browser.button(id: 'Terminals-Facility-mainbutton')
	end

	def terminalSelectionFilterModalFacilitySearchTextField
		@browser.text_field(id: 'Terminals-Facility-search')
	end

	def terminalSelectionFilterModalGroupDropdown
		@browser.button(id: 'Terminals-Group-mainbutton')
	end

	def terminalSelectionFilterModalGroupSearchTextField
		@browser.text_field(id: 'Terminals-Group-search')
	end

	def terminalSelectionFilterModalGroupFilterButton
		@browser.text_field(id: 'Terminals-Group-filterbutton')
	end

	def terminalSelectionFilterModalGroupDoneButton
		@browser.text_field(id: 'Terminals-Group-donebutton')
	end

	def terminalSelectionFilterModalClearButton
		@browser.button(id: 'Terminals-Clear')
	end

	def terminalSelectionFilterModalHelpButton
		@browser.button(id: 'Terminals-Help')
	end

	def terminalSelectionFilterModalCloseButton
		@browser.button(id: 'Terminals-Cancel')
	end
	#########################################


	#### TERMINAL SELECTION FILTER SELECTION CRITERIA MODAL####
	def adminTerminalInquirySelectionCriteriaModal
		@browser.div(id: 'Terminals-Group-FilterDivrows')
	end

	def adminTerminalInquirySelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField1-mainbutton')
	end

	def adminTerminalInquirySelectionCriteriaSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField1-search')
	end

	def adminTerminalInquirySelectionCriteriaOperandDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField2-mainbutton')
	end

	def adminTerminalInquirySelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField2-search')
	end

	def adminTerminalInquirySelectionCriteriaValueDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField3-mainbutton')
	end

	def adminTerminalInquirySelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField3-search')
	end

	def adminTerminalInquirySelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def adminTerminalInquirySelectionCriteriaCancelIcon
		@browser.button(id: 'Terminals-Group-FilterDiv1CancelButton')
	end

	def adminTerminalInquirySelectionCriteriaAddIcon
		@browser.button(id: 'Terminals-Group-FilterDiv2OKButton')
	end

	def adminTerminalInquirySelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def adminTerminalInquirySelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def adminTerminalInquirySelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################
	def adminTerminalInquiryResultModal
		@browser.div(id: 'TerminalInquiry-Summary')
	end

	#### GETTERS ####
	def getAdminTerminalInquiryResultError
		@browser.label(id: 'TerminalInquiry-Error')
	end

	#### VERIFIERS ####
	def verifyTerminalInquiryResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalInquiryResultError.text).to include(expectedResult)
		getAdminTerminalInquiryResultError.flash(color: ["yellow"])
	end
end
