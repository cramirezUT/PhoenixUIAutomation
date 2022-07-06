## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminEventChannelGroupId = "UQA - United Tote QA"
$adminEventChannelGroupIdInvalid = "TNT"
$adminEventChannelSortById = "Id"
$adminEventChannelSortByName = "Name"
$adminEventChannelSortByNumber = "Number"
$adminEventChannelId = ""
$adminEventChannelChannelIdInvalid = "C"

module EventChannelPage
	include RSpec::Matchers
	include Selenium

	#### CHANNEL METHODS / LOCATORS ####
	def eventMenuInquireSubLinks(string)
		sleep(1)
		@browser.element(xpath: "//*[@id='Command-Menu-#{string}']")
	end

	def eventChannelModal
		@browser.div(id: 'EventChannel-Select')
	end

	def eventChannelModalHelpButton
		@browser.button(id: 'EventChannel-Select-Help')
	end

	def eventChannelModalGroupDropdown
		@browser.button(id: 'EventChannel-Select-Group-mainbutton')
	end

	def eventChannelModalGroupSearchTextField
		@browser.text_field(id: 'EventChannel-Select-Group-search')
	end

	def eventChannelModalSortByDropdown
		@browser.button(id: 'EventChannel-Select-By-mainbutton')
	end

	def eventChannelModalSortBySearchTextField
		@browser.text_field(id: 'EventChannel-Select-By-search')
	end

	def eventChannelEventModal(index)
		@browser.div(id: "EventChannel-Events-#{index}-Event")
	end

	#### CHANNEL GROUP SELECTION CRITERIA ####
	def eventChannelGroupSelectionCriteriaModal
		@browser.div(id: 'EventChannel-Select-Group-FilterDivrows')
	end

	def eventChannelGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventChannel-Select-Group-FilterDiv1FilterField1-mainbutton')
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
	#############################################

	def eventChannelEeventResultsByIndex(index)
		@browser.div(id: "EventChannel-Events-#{index}-Event")
	end

	def eventChannelEeventChannelTextFieldByIndex(index)
		@browser.text_field(id: "EventChannel-Events-#{index}-Event-Channel")
	end

	#### GETTERS ####
	def getEventChannelError
		@browser.li(id: 'ut-ms-opt-EventChannel-Select-Group_noresults')
	end

	def getEventChannelResultError
		@browser.label(id: 'EventChannel-Error')
	end

	#### VERIFIERS ####
	def verifyEventChannelSearchResults(result)
		expectedResult = "#{result}"
		expect(getEventChannelError.text).to include(expectedResult)
		getEventChannelError.flash(color: ["yellow"])
	end

	def verifyAdminEventChannelEventSearchResultsInvalid(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getEventChannelError.text).to eq(expectedResult)
		getEventChannelError.flash(color: ["yellow"])
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

	def verifyEventChannelInvalidChannelIdError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getEventChannelResultError.text).to include(expectedResult)
		getEventChannelResultError.flash(color: ["yellow"])
	end
end
