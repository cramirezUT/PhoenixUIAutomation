## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$eventId = "CHF"
$groupId = "CHD"
$invalidGroupId = "CNR"
$sourceMeregeId = "Merged"

module ClassPage
	include RSpec::Matchers
	include Selenium

	#### Class METHODS / LOCATORS ####
	def eventClassHelpButton
		@browser.button(id: 'EventClass-Select-Help')
	end

	def eventClassGroupDropdown
		@browser.button(id: 'EventClass-Select-Group-mainbutton')
	end

	def eventClassGroupSearchTextField
		@browser.text_field(id: 'EventClass-Select-Group-search')
	end

	def eventClassGroupFilterButton
		@browser.button(id: 'EventClass-Select-Group-filterbutton')
	end

	def eventClassSortByDropdown
		@browser.button(id: 'EventClass-Select-By-mainbutton')
	end

	def eventClassSortBySearchTextField
		@browser.button(id: 'EventClass-Select-By-search')
	end

	#### Class Group SELECTION CRITERIA ####
	def eventClassGroupSelectionCriteriaModal
		@browser.div(id: 'EventClass-Select-Group-FilterDivrows')
	end

	def eventClassGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventClass-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def eventClassGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'EventClass-Select-Group-FilterDiv1FilterField1-search')
	end

	def eventClassGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'EventClass-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def eventClassGroupSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'EventClass-Select-Group-FilterDiv1FilterField2-search')
	end

	def eventClassGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'EventClass-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def eventClassGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventClassGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'EventClass-Select-Group-FilterDiv1CancelButton')
	end

	def eventClassGroupSelectionCriteriaAddIcon
		@browser.button(id: 'EventClass-Select-Group-FilterDiv2OKButton')
	end

	def eventClassSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventClassSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventClassSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	def eventClassSearchResultByRow(index)
		@browser.link(id: "EventClass-Events-#{index}-Event-Id")
	end

	def eventClassButtonByIndex(index)
		@browser.button(id: "EventClass-Events-#{index}-Event-Class")
	end

	def eventClassSaveChangesButton
		@browser.button(id: 'EventClass-Select-Save')
	end

	#### GETTERS ####
	def getEventResultView
		@browser.div(id: 'EventClass-View-HT-0')
	end

	def getEventSearchResults
		@browser.li(id: 'ut-ms-opt-EventClass-Select-Group_noresults')
	end

	def getEventClassDefinition(index)
		eventClassButtonByIndex(index)
	end

	def getEventInformationByRow(index)
		@browser.div(id: "Information-View-#{index}-1")
	end

	#### VERIFIERS ####
	def verifyEventSearchResults(result)
		expectedResult = "#{result}"
		expect(getEventResultView.text).to include(expectedResult)
		getEventResultView.flash(color: ["yellow"])
	end

	def verifyEventSearchResultsInvalid(result)
		expectedResult = "#{result}"
		expect(getEventSearchResults.text).to eq(expectedResult)
		getEventSearchResults.flash(color: ["yellow"])
	end

	def verifyEventClassDefinition(index)
		expectedClassDenfinition = "B"
		expect(getEventClassDefinition(index).text).to eq(expectedClassDenfinition)
		getEventClassDefinition(index).flash(color: ["yellow"])
	end

	def verifyEventClassDefinitionReset(index)
		expectedClassDenfinition = " "
		expect(getEventClassDefinition(index).text).to eq(expectedClassDenfinition)
		getEventClassDefinition(index).flash(color: ["yellow"])
	end

	def verifyEventInformationResultByIndex(index, result)
		expectedResult = "#{result}"
		expect(getEventInformationByRow(index).text).to include(expectedResult)
		getEventInformationByRow(index).flash(color: ["yellow"])
	end
end
