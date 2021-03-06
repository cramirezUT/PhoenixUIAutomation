## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminEventClassEventId = "CHF"
$adminEventClassGroupId = "CHD"
$adminEventClassGroupIdInvalid = "TNT"
$adminEventClassSourceMeregeId = "Merged"

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

	def getAdminEventClassEventSearchResults
		@browser.li(id: 'ut-ms-opt-EventClass-Select-Group_noresults')
	end

	def getEventClassDefinition(index)
		eventClassButtonByIndex(index)
	end

	def getEventInformationByRow(index)
		@browser.div(id: "Information-View-#{index}-1")
	end

	def getEventClassDefinitionForCleanUp
		if getEventClassDefinition(0).text == 'B'
			eventClassButtonByIndex(0).wait_until_present.flash.click
			eventClassButtonByIndex(0).wait_until_present.flash.click
		elsif getEventClassDefinition(0).text == 'A'
			eventClassButtonByIndex(0).wait_until_present.flash.click
		elsif getEventClassDefinition(0).text == ' '
			eventClassButtonByIndex(0).wait_until_present.flash.click
		else
			puts "No clean up needed moving to next step"
		end
	end

	#### VERIFIERS ####
	def verifyAdminEventClassEventSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getEventResultView.text).to include(expectedResult)
		getEventResultView.flash(color: ["yellow"])
	end

	def verifyAdminEventClassEventSearchResultsInvalid(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminEventClassEventSearchResults.text).to eq(expectedResult)
		getAdminEventClassEventSearchResults.flash(color: ["yellow"])
	end

	def verifyEventClassDefinitionB(index)
		sleep(1)
		expectedClassDenfinition = "B"
		expect(getEventClassDefinition(index).text).to eq(expectedClassDenfinition)
		getEventClassDefinition(index).flash(color: ["yellow"])
	end

	def verifyEventClassDefinitionA(index)
		sleep(1)
		expectedClassDenfinition = "A"
		expect(getEventClassDefinition(index).text).to eq(expectedClassDenfinition)
		getEventClassDefinition(index).flash(color: ["yellow"])
	end


	def verifyEventClassDefinitionReset(index)
		sleep(1)
		expectedClassDenfinition = " "
		expect(getEventClassDefinition(index).text).to eq(expectedClassDenfinition)
		getEventClassDefinition(index).flash(color: ["yellow"])
	end

	def verifyGroupSearchResult(index, result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getEventInformationByRow(index).text).to include(expectedResult)
		getEventInformationByRow(index).flash(color: ["yellow"])
	end
end
