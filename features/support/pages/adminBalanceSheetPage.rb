## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'date'

$groupId = "UTS - UNITED TOTE SYSTEMS"
$textForField = "Test"

module AdminBalanceSheetPage
	include RSpec::Matchers
	include Selenium

	#### BALANCE METHODS / LOCATORS ####
	def adminBalanceModal
		@browser.div(id: "AdminBalanceSheet-Select")
	end

	def adminBalanceModalRunTextField
		@browser.text_field(id: "AdminBalanceSheet-Select-Run")
	end

	def adminBalanceModalGroupDropdown
		@browser.button(id: "AdminBalanceSheet-Select-Group-mainbutton")
	end

	def adminBalanceModalGroupSearchTextField
		@browser.text_field(id: "AdminBalanceSheet-Select-Group-search")
	end

	def adminBalanceSelectButton
		@browser.button(id: 'AdminBalanceSheet-Select-Load')
	end

	def adminBalanceSettingsButton
		@browser.button(id: 'AdminBalanceSheet-Select-Settings')
	end

	def adminBalanceHelpButton
		@browser.button(id: 'AdminBalanceSheet-Select-Help')
	end

	#### ADMIN BALANCE GROUP SELECTION CRITERIA MODAL ####
	def adminBalanceGroupSelectionCriteriaModal
		@browser.div(id: 'AdminBalanceSheet-Select-Group-FilterDivrows')
	end

	def adminBalanceGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def adminBalanceGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'AdminBalanceSheet-Select-Group-FilterDiv1FilterField1-search')
	end

	def adminBalanceGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def adminBalanceGroupSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv1FilterField2-search')
	end

	def adminBalanceGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def adminBalanceGroupSelectionCriteriaValueSearchTextField
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv1FilterField3-search')
	end

	def adminBalanceGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def adminBalanceGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv1CancelButton')
	end

	def adminBalanceGroupSelectionCriteriaAddIcon
		@browser.button(id: 'AdminBalanceSheet-Select-Group-FilterDiv2OKButton')
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

	#### BALANCE SHEET MODAL####
	def adminBalanceSheetModal
		@browser.button(id: 'AdminBalanceSheet-Balance')
	end

	def adminBalanceSheetModalFinalCheckbox
		@browser.td(data_uticon: 'Final')
	end

	def adminBalanceSheetModalPrintButton
		@browser.button(id: 'AdminBalanceSheet-Balance-Report-Print')
	end

	def adminBalanceSheetModalRefreshButton
		@browser.button(id: 'AdminBalanceSheet-Balance-Refresh')
	end

	def adminBalanceSheetModalEditButton
		@browser.button(id: 'AdminBalanceSheet-Balance-Edit')
	end

	def adminBalanceSheetModalSaveButton
		@browser.button(id: 'AdminBalanceSheet-Balance-Save')
	end

	def adminBalanceSheetModalCancelButton
		@browser.button(id: 'AdminBalanceSheet-Balance-Close')
	end
	############################

	#### EDIT TEMPLATE MODAL####
	def adminBalanceSheetEditTemplateModal
		@browser.div(id: 'AdminBalanceSheet-Template')
	end

	def adminBalanceSheetEditTemplateModalTextFieldValueByIndex(index)
		@browser.label(id: "AdminBalanceSheet-Template-Sheet-#{index}-Cell-Value")
	end

	def adminBalanceSheetEditTemplateModalTemplateDropdown
		@browser.button(id: 'AdminBalanceSheet-Template-Set-mainbutton')
	end

	def adminBalanceSheetEditTemplateModalCopyButton
		@browser.button(id: 'AdminBalanceSheet-Template-Copy')
	end

	def adminBalanceSheetEditTemplateModalClearButton
		@browser.button(id: 'AdminBalanceSheet-Template-Clear')
	end

	def adminBalanceSheetEditTemplateModalPrintButton
		@browser.button(id: 'AdminBalanceSheet-Template-Print')
	end

	def adminBalanceSheetEditTemplateModalSaveButton
		@browser.button(id: 'AdminBalanceSheet-Template-Save')
	end

	def adminBalanceSheetEditTemplateModalCloseButton
		@browser.button(id: 'AdminBalanceSheet-Template-Close')
	end

	def adminBalanceSheetEditTemplateModalHelpButton
		@browser.button(id: 'AdminBalanceSheet-Template-Help')
	end

	#### CONFIRM TEMPLATE CLOSE MODAL ####
	def adminBalanceSheetConfirmTemplateModal
		@browser.div(id: 'Confirm')
	end
	def adminBalanceSheetConfirmTemplateModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def adminBalanceSheetConfirmTemplateModalNoButton
		@browser.button(id: 'Confirm-No')
	end
	######################################
	############################

	#### CELL EDITOR MODAL####
	def adminBalanceSheetCellEditorModal
		@browser.div(id: 'AdminBalanceSheet-Cell')
	end

	def adminBalanceSheetCellEditorModalHelpButton
		@browser.button(id: 'AdminBalanceSheet-Cell-Help')
	end

	def adminBalanceSheetCellEditorModalTypeByName(name)
		@browser.td(xpath: "//*[contains(@data-value,'#{name}') and contains(@data-uticon,'Radio')]")
	end

	def adminBalanceSheetCellEditorModalLabelTextField
		@browser.text_field(id: "AdminBalanceSheet-Cell-Label")
	end

	def adminBalanceSheetCellEditorModalUpArrow
		@browser.button(id: 'AdminBalanceSheet-Cell-Move-Up')
	end

	def adminBalanceSheetCellEditorModalLeftArrow
		@browser.button(id: 'AdminBalanceSheet-Cell-Move-Left')
	end

	def adminBalanceSheetCellEditorModalRightArrow
		@browser.button(id: 'AdminBalanceSheet-Cell-Move-Right')
	end

	def adminBalanceSheetCellEditorModalDownArrow
		@browser.button(id: 'AdminBalanceSheet-Cell-Move-Down')
	end
	##########################

	#### BALANCE USD MODAL####
	def adminBalanceBalanceUSDModal
		@browser.div(id: 'AdminBalanceSheet-View')
	end
	##########################

	#### GETTERS ####
	def getEditTemplateValueByIndex(index)
		adminBalanceSheetEditTemplateModalTextFieldValueByIndex(index)
	end

	#### VERIFIERS ####
	def verifyEditTemplateValueByIndex(index)
		sleep(1)
		expectedResult = "Test"
		expect(getEditTemplateValueByIndex(index).text).to include(expectedResult)
		getEditTemplateValueByIndex(index).flash(color: ["yellow"])
	end
end
