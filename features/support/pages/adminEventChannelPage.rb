## Class Page Helper File
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$eventId = "CHF"
$groupId = "UQA"
$invalidGroupId = "CNR"
$sourceMeregeId = "Merged"

module ChannelPage
	include RSpec::Matchers
	include Selenium

	#### Channel METHODS / LOCATORS ####
	def eventChannelHelpButton
		@browser.button(id: 'EventChannel-Select-Help')
	end

	def eventChannelGroupDropdown
		@browser.button(id: 'EventChannel-Select-Group-mainbutton')
	end

	def eventChannelGroupSearchTextField
		@browser.text_field(id: 'EventChannel-Select-Group-search')
	end

	def eventChannelGroupFilterButton
		@browser.button(id: 'EventChannel-Select-Group-filterbutton')
	end

	def eventChannelSortByDropdown
		@browser.button(id: 'EventChannel-Select-By-mainbutton')
	end

	def eventChannelSortBySearchTextField
		@browser.button(id: 'EventChannel-Select-By-search')
	end

	#### Channel Group SELECTION CRITERIA ####
	def eventChannelGroupSelectionCriteriaModal
		@browser.div(id: 'EventChannel-Select-Group-FilterDivrows')
	end

	def eventChannelGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventChannel-Select-Group-mainbutton')
	end

	def eventChannelGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'EventChannel-Select-Group-FilterDiv2FilterField1-search')
	end

	def eventChannelGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv2FilterField2-mainbutton')
	end

	def eventChannelGroupSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv2FilterField2-search')
	end

	def eventChannelGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv2FilterField3-mainbutton')
	end

	def eventChannelGroupSelectionCriteriaValueSearchTextField
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv2FilterField3-search')
	end

	def eventChannelGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventChannelGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv2CancelButton')
	end

	def eventChannelGroupSelectionCriteriaAddIcon
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv3OKButton')
	end

	def eventChannelSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventChannelSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventChannelSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	def eventChannelSearchResultByRow(index)
		@browser.link(id: "EventChannel-Events-#{index}-Event-Id")
	end

	def eventChannelButtonByIndex(index)
		@browser.button(id: "EventChannel-Events-#{index}-Event-Channel")
	end

	def eventChannelGuidesButton
		@browser.button(id: 'EventChannel-Select-Guides')
	end

	def eventChannelSaveChangesButton
		@browser.button(id: 'EventChannel-Select-Save')
	end

	#### GETTERS ####
	def getEventResultView
		@browser.div(id: 'EventChannel-View-HT-0')
	end

	def getEventSearchResults
		@browser.li(id: 'ut-ms-opt-EventChannel-Select-Group_noresults')
	end

	def getEventChannelDefinition(index)
		eventChannelButtonByIndex(index)
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

	def verifyEventChannelDefinition(index)
		expectedChannelDenfinition = " "
		expect(getEventChannelDefinition(index).text).to eq(expectedChannelDenfinition)
		getEventChannelDefinition(index).flash(color: ["yellow"])
	end

	def verifyEventChannelDefinitionReset(index)
		expectedChannelDenfinition = " "
		expect(getEventChannelDefinition(index).text).to eq(expectedChannelDenfinition)
		getEventChannelDefinition(index).flash(color: ["yellow"])
	end

	def verifyEventInformationResultByIndex(index, result)
		expectedResult = "#{result}"
		expect(getEventInformationByRow(index).text).to include(expectedResult)
		getEventInformationByRow(index).flash(color: ["yellow"])
	end
end
