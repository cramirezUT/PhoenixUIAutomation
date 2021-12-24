## Class Page Helper File
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$groupUtsId = "UTS"
$invalidGroupId = "CNR"
$wildCharacterGroupId = "*All"

module HandlePage
	include RSpec::Matchers
	include Selenium

	#### HANDLE METHODS / LOCATORS ####
	def eventHandleSelectStyleButton
		@browser.button(id: 'EventHandle-Select-Style')
	end

	def eventHandleRefreshButton
		@browser.button(id: 'EventHandle-Select-Refresh')
	end

	def eventHandleExpandButton
		@browser.button(id: 'EventHandle-Select-Expand')
	end

	def eventHandleHelpButton
		@browser.button(id: 'EventHandle-Select-Help')
	end

	def eventHandleGourpDropdown
		@browser.button(id: 'EventHandle-Select-Group-mainbutton')
	end

	def eventHandleGroupSerachTextField
		@browser.text_field(id: 'EventHandle-Select-Group-search')
	end

	def eventHandleGroupDropdownFilterButton
		@browser.button(id: 'EventHandle-Select-Group-filterbutton')
	end

	def eventHandleGroupDropdownDoneButton
		@browser.button(id: 'EventHandle-Select-Group-donebutton')
	end

	#### HANDLE SELECTION CRITERIA ####
	def eventHandleSelectionCriteriaModal
		@browser.div(id: 'EventHandle-Select-Group-FilterDivrows')
	end

	def eventHandleSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventHandle-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def eventHandleSelectCriteriaSearchTextField
		@browser.text_field(id: 'EventHandle-Select-Group-FilterDiv1FilterField1-search')
	end

	def eventHandleSelectCriteriaOperandDropdown
		@browser.button(id: 'EventHandle-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def eventHandleSelectionCriteriaValueDropdown
		@browser.button(id: 'EventHandle-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def eventHandleSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventHandleSelectionCriteriaCancelIcon
		@browser.button(id: 'EventHandle-Select-Group-FilterDiv1CancelButton')
	end

	def eventHandleSelectionCriteriaAddIcon
		@browser.button(id: 'EventHandle-Select-Group-FilterDiv2OKButton')
	end

	def eventHandleSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventHandleSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventHandleSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	def eventHandleSubGroupsCheckbox
		@browser.element(data_utcicon: 'CheckBox')
	end

	def eventHandleCurrencyDropdown
		@browser.button(id: 'EventHandle-Select-Currency-mainbutton')
	end

	def eventHandleCurrencySearchTextField
		@browser.text_field(id: 'EventHandle-Select-Currency-search')
	end

	#### GETTERS #####
	def getEventHandleViewBoxPrice
		@browser.div(id: 'EventHandle-View-0-3')
	end

	def getEventHandleSearchResults
		@browser.li(id: 'ut-ms-opt-EventHandle-Select-Group_noresults')
	end

	#### VERIFIERS ####
	def verifyEventHandleSearchResults(result)
		expectedResult = "#{result}"
		expect(getEventHandleSearchResults.text).to eq(expectedResult)
		getEventHandleSearchResults.flash(color: ["yellow"])
	end
end
