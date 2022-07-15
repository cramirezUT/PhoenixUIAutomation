## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminSellerLimitSellerId = "UTS-1"
$adminSellerLimitSellerIdInvalid = "TNT"

module AdminSellerLimitPage
	include RSpec::Matchers
	include Selenium

	#### SELLER LIMIT METHODS / LOCATORS ####
	def adminSellerLimitModal
		@browser.div(id: 'SellerLimit-Select')
	end

	def adminSellerLimitModalHelpButton
		@browser.button(id: 'SellerLimit-Select-Help')
	end

	def adminSellerLimitModalTerminalsTextField
		@browser.text_field(id: 'SellerLimit-Select-Terminals')
	end

	def adminSellerLimitModalTerminalsFilterButton
		@browser.button(id: 'SellerLimit-Select-Filter')
	end

	def adminSellerLimitModalCountTextField
		@browser.text_field(id: 'SellerLimit-Select-Count')
	end

	def adminSellerLimitModalSelectViewButton
		@browser.button(id: 'SellerLimit-Select-View')
	end

	def adminSellerLimitModalLimitButton
		@browser.button(id: 'SellerLimit-Select-eLimit')
	end

	def adminSellerLimitModalLimitAmount
		@browser.label(id: 'SellerLimit-Select-Limit')
	end

	def adminSellerLimitModalCycleDropdown
		@browser.button(id: 'SellerLimit-Select-Cycle-mainbutton')
	end

	def adminSellerLimitModalCycleList
		@browser.ul(id: 'SellerLimit-Select-Cycle-ul')
	end

	def adminSellerLimitModalCycleListRefreshButton
		@browser.button(id: 'SellerLimit-Select-Refresh')
	end

	def adminSellerLimitModalMarginButton
		@browser.button(id: 'SellerLimit-Select-Machine-eMargin')
	end

	def adminSellerLimitModalMarginAmount
		@browser.label(id: 'SellerLimit-Select-Machine-Margin')
	end

	def adminSellerLimitModalEnableButton
		@browser.button(id: 'SellerLimit-Select-Machine-Enable')
	end

	def adminSellerLimitModalDisableButton
		@browser.button(id: 'SellerLimit-Select-Machine-Disable')
	end

	def adminSellerLimitModalBamCheckbox
		@browser.label(xpath: "//label[text()='BAM']")
	end

	def adminSellerLimitModalCdmCheckbox
		@browser.label(xpath: "//label[text()='CDM']")
	end

	#### SELECTED TERMINALS MODAL ####
	def adminSellersSelectedTerminalsModal
		@browser.div(id: 'TerminalView')
	end

	def adminSellersSelectedTerminalsModalCloseButton
		@browser.button(id: 'TerminalView-Close')
	end
	##################################

	#### EDIT MARGIN AMOUNT MODAL ####
	def adminSellerEditMarginAmountModal
		@browser.div(id: 'Edit')
	end

	def adminSellerEditMarginAmountModalMarginTextField
		@browser.text_field(id: 'Edit-Text')
	end

	def adminSellerEditMarginAmountModalSaveButton
		@browser.button(id: 'Edit-Save')
	end

	def adminSellerEditMarginAmountModalCloseButton
		@browser.button(id: 'Edit-Cancel')
	end
	##################################

	#### TERMINAL SELECTION FILTER MODAL ####
	def adminSellerTerminalSelectionFilterModal
		@browser.div(id: 'Terminals')
	end

	def adminSellerTerminalSelectionFilterModalClearFilterButton
		@browser.button(id: 'Terminals-Clear')
	end

	def adminSellerTerminalSelectionFilterModalHelpButton
		@browser.button(id: 'Terminals-Help')
	end

	def adminSellerTerminalSelectionFilterModalCloseButton
		@browser.button(id: 'Terminals-Cancel')
	end

	def adminSellerTerminalSelectionFilterModalViewButton
		@browser.button(id: 'Terminals-View')
	end

	def adminSellerTerminalSelectionFilterModalViewButton
		@browser.button(id: 'Terminals-View')
	end

	def adminSellerTerminalSelectionFilterModalMachineDropdown
		@browser.button(id: 'Terminals-Machine-mainbutton')
	end

	def adminSellerTerminalSelectionFilterModalMachineSearchTextField
		@browser.text_field(id: 'Terminals-Machine-search')
	end

	def adminSellerTerminalSelectionFilterModalAreaDropdown
		@browser.button(id: 'Terminals-Area-mainbutton')
	end

	def adminSellerTerminalSelectionFilterModalAreaSearchTextField
		@browser.text_field(id: 'Terminals-Area-search')
	end

	def adminSellerTerminalSelectionFilterModalFacilityDropdown
		@browser.button(id: 'Terminals-Facility-mainbutton')
	end

	def adminSellerTerminalSelectionFilterModalFacilitySearchTextField
		@browser.text_field(id: 'Terminals-Facility-search')
	end

	def adminSellerTerminalSelectionFilterModalGroupDropdown
		@browser.button(id: 'Terminals-Group-mainbutton')
	end

	def adminSellerTerminalSelectionFilterModalGroupSearchTextField
		@browser.text_field(id: 'Terminals-Group-search')
	end

	def adminSellerTerminalSelectionFilterModalGroupFilterButton
		@browser.button(id: 'Terminals-Group-filterbutton')
	end

	def adminSellerTerminalSelectionFilterModalGroupDoneButton
		@browser.button(id: 'Terminals-Group-donebutton')
	end

	def adminSellerTerminalSelectionFilterModalApplyButton
		@browser.button(id: 'Terminals-Apply')
	end

	def adminSellerTerminalSelectionFilterModalApplyButton
		@browser.label(xpath: "//label[text()='Use descendants']")
	end

	############################################

	#### TERMINAL SELECTION FILTER SELECTION CRITERIA MODAL ####
	def terminalfilterSelectionCriteriaModal
		@browser.div(id: 'Terminals-Group-FilterDivrows')
	end

	def terminalfilterSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField1-mainbutton')
	end

	def terminalfilterSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField1-search')
	end

	def terminalfilterSelectionCriteriaOperandDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField2-mainbutton')
	end

	def terminalfilterSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField2-search')
	end

	def terminalfilterSelectionCriteriaValueDropdown
		@browser.button(id: 'Terminals-Group-FilterDiv1FilterField3-mainbutton')
	end

	def terminalfilterSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'Terminals-Group-FilterDiv1FilterField3-search')
	end

	def terminalfilterSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def terminalfilterSelectionCriteriaCancelIcon
		@browser.button(id: 'Terminals-Group-FilterDiv1CancelButton')
	end

	def terminalfilterSelectionCriteriaAddIcon
		@browser.button(id: 'Terminals-Group-FilterDiv2OKButton')
	end

	def terminalfilterSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def terminalfilterSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def terminalfilterSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	############################################################

	#### GETTERS ####
	def getSellerLimitSummaryDate
		adminSellerLimitSummaryModalDate.text
	end

	def getSellerLimitError
		@browser.label(id: 'SellerLimit-Error')
	end

	def getSellerLimitSuccessMessage
		@browser.label(id: 'SellerLimit-Error')
	end

	#### VERIFIERS ####
	def verifySellerLimitError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerLimitError.text).to include(expectedResult)
		getSellerLimitError.flash(color: ["yellow"])
	end

	def verifySellerLimitSuccesMessafge(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerLimitSuccessMessage.text).to include(expectedResult)
		getSellerLimitSuccessMessage.flash(color: ["yellow"])
	end
end
