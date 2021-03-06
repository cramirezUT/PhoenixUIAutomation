## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminEventPoolsEventId = "CHF"
$adminEventPoolsSourceId = "CHD"
$adminEventPoolsSourceMeregeId = "Merged"
$adminEventPoolsEventIdInvalid = "TNT"

module PoolsPage
	include RSpec::Matchers
	include Selenium

	#### POOLS METHODS / LOCATORS ####
	def eventPoolsSelectStyleButton
		@browser.button(id: 'EventPools-Select-Style')
	end

	def eventPoolsRefreshButton
		@browser.button(id: 'EventPools-Select-Refresh')
	end

	def eventPoolsExpandButton
		@browser.button(id: 'EventPools-Select-Detail')
	end

	def eventPoolsHelpButton
		@browser.button(id: 'EventPools-Select-Help')
	end

	def eventPoolsCurrentRaceButton
		@browser.button(id: 'EventPools-Select-Current')
	end

	def eventPoolsPastButton
		@browser.button(id: 'EventPools-Select-Past')
	end

	def eventPoolsEventDropdown
		@browser.button(id: 'EventPools-Select-Event-mainbutton')
	end

	def eventPoolsEventSearchTextField
		@browser.text_field(id: 'EventPools-Select-Event-search')
	end

	def eventPoolsEventDropdownFilterButton
		@browser.button(id: 'EventPools-Select-Event-filterbutton')
	end

	#### Pools EVENT SELECTION CRITERIA ####
	def eventPoolsSelectionCriteriaModal
		@browser.div(id: 'EventPools-Select-Event-FilterDivrows')
	end

	def eventPoolsSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventPools-Select-Event-FilterDiv1FilterField1-mainbutton')
	end

	def eventPoolsSelectionCriteriaSearchTextField
		@browser.text_field(id: 'EventPools-Select-Event-FilterDiv1FilterField1-searchdiv')
	end

	def eventPoolsSelectionCriteriaOperandDropdown
		@browser.button(id: 'EventPools-Select-Event-FilterDiv1FilterField2-mainbutton')
	end

	def eventPoolsSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'EventPools-Select-Event-FilterDiv1FilterField2-search')
	end

	def eventPoolsSelectionCriteriaValueDropdown
		@browser.button(id: 'EventPools-Select-Event-FilterDiv1FilterField3-mainbutton')
	end

	def eventPoolsSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventPoolsSelectionCriteriaCancelIcon
		@browser.button(id: 'EventPools-Select-Event-FilterDiv1CancelButton')
	end

	def eventPoolsSelectionCriteriaAddIcon
		@browser.button(id: 'EventPools-Select-Event-FilterDiv2OKButton')
	end

	def eventPoolsSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventPoolsSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventPoolsSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	def eventPoolsSourceDropdown
		@browser.button(id: 'EventPools-Select-Source-mainbutton')
	end

	def eventPoolsSourceSearchTextField
		@browser.text_field(id: 'EventPools-Select-Source-search')
	end

	def eventPoolsSourceFilterButton
		@browser.button(id: 'EventPools-Select-Source-filterbutton')
	end

	def eventPoolsSourceFilterButton
		@browser.button(id: 'EventPools-Select-Source-filterbutton')
	end

	#### SOURCE SELECTION CRITERIA ####
	def eventSourceSelectionCriteriaModal
		@browser.div(id: 'EventPools-Select-Source-FilterDivrows')
	end

	def eventSourceSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventPools-Select-Source-FilterDiv1FilterField1-mainbutton')
	end

	def eventSourceSelectionCriteriaSearchTextField
		@browser.text_field(id: 'EventPools-Select-Source-FilterDiv1FilterField1-searchdiv')
	end

	def eventSourceSelectionCriteriaOperandDropdown
		@browser.button(id: 'EventPools-Select-Source-FilterDiv1FilterField2-mainbutton')
	end

	def eventSourceSelectionCriteriaValueDropdown
		@browser.button(id: 'EventPools-Select-Source-FilterDiv1FilterField3-mainbutton')
	end

	def eventSourceSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventSourceSelectionCriteriaCancelIcon
		@browser.button(id: 'EventPools-Select-Source-FilterDiv1CancelButton')
	end

	def eventSourceSelectionCriteriaAddIcon
		@browser.button(id: 'EventPools-Select-Source-FilterDiv2OKButton')
	end

	def eventSourceSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventSourceSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventSourceSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	def eventRacesDropdown
		@browser.button(id: 'EventPools-Select-Races-mainbutton')
	end

	def eventRacesSearchTextField
		@browser.text_field(id: 'EventPools-Select-Races-searchdiv')
	end

	def adminEventPoolEventRacesSearchDoneButton
		@browser.button(id: 'EventPools-Select-Races-donebutton')
	end

	def eventRaceSearchSelectAllCheckbox
		@browser.checkbox(id: 'ut-ms-opt-EventPools-Select-Races-selectallcheckbox')
	end

	def eventPoolsRightArrow
		@browser.button(id: 'EventPools-Select-Next')
	end

	def eventPoolsLeftArrow
		@browser.button(id: 'EventPools-Select-Prev')
	end

	def eventPoolsResultsModal
		@browser.div(id: 'EventPools-View')
	end

	#### GETTERS ####
	def getEventResultView
		@browser.div(id: 'EventPools-View-HT-0')
	end

	def getEventResultsRaceTotal(index)
		@browser.div(id: "EventPools-View-#{index}-0").text
	end

	def getEventResultsPool(index)
		@browser.div(id: "EventPools-View-#{index}-1").text
	end

	def getEventResultsTotalTotal(index)
		@browser.div(id: "EventPools-View-#{index}-2").text
	end

	def getEventResultsChangeTotal(index)
		@browser.div(id: "EventPools-View-#{index}-3").text
	end

	def getEventSearchResults
		@browser.li(id: 'ut-ms-opt-EventPools-Select-Event_noresults')
	end

	#### VERIFIERS ####
	def verifyAdminEventPoolsEventSearchResults(result)
		expectedResult = "#{result}"
		expect(getEventResultView.text).to include(expectedResult)
		getEventResultView.flash(color: ["yellow"])
	end

	def verifyAdminEventPoolsEventSearchResultsInvalid(result)
		expectedResult = "#{result}"
		expect(getEventSearchResults.text).to eq(expectedResult)
		getEventSearchResults.flash(color: ["yellow"])
	end
	end
