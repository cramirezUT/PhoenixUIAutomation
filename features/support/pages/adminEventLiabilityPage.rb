require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$eventId = "CHF"
$invalidEventId = "TNT"
$sourceId = "CHD"
$sourceMerge = "Merge"

module LiabilityPage
	include RSpec::Matchers
	include Selenium

	#### LIABILITY METHODS / LOCATORS ####
	def eventLiabilitySelectStyleButton
		@browser.button(id: 'EventLiability-Select-Style')
	end

	def eventLiabilityRefreshButton
		@browser.button(id: 'EventLiability-Select-Refresh')
	end

	def eventLiabilityExpandButton
		@browser.button(id: 'EventLiability-Select-Detail')
	end

	def eventLiabilityHelpButton
		@browser.button(id: 'EventLiability-Select-Help')
	end

	def eventLiabilityHomeButton
		@browser.button(id: 'EventLiability-Select-Current')
	end

	def eventLiabilityPastButton
		@browser.button(id: 'EventLiability-Select-Past')
	end

	def eventLiabilityEventDropdown
		@browser.button(id: 'EventLiability-Select-Event-mainbutton')
	end

	def eventLiabilityEventSearchTextField
		@browser.text_field(id: 'EventLiability-Select-Event-search')
	end

	def eventLiabilityEventDropdownFilterButton
		@browser.button(id: 'EventLiability-Select-Event-filterbutton')
	end

	#### LIABILITY EVENT SELECTION CRITERIA ####
	def eventLiabilitySelectionCriteriaModal
		@browser.div(id: 'EventLiability-Select-Event-FilterDivrows')
	end

	def eventLiabilitySelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventLiability-Select-Event-FilterDiv1FilterField1-mainbutton')
	end

	def eventLiabilitySelectionCriteriaSearchTextField
		@browser.text_field(id: 'EventLiability-Select-Event-FilterDiv1FilterField1-searchdiv')
	end

	def eventLiabilitySelectionCriteriaOperandDropdown
		@browser.button(id: 'EventLiability-Select-Event-FilterDiv1FilterField2-mainbutton')
	end

	def eventLiabilitySelectionCriteriaValueDropdown
		@browser.button(id: 'EventLiability-Select-Event-FilterDiv1FilterField3-mainbutton')
	end

	def eventLiabilitySelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventLiabilitySelectionCriteriaCancelIcon
		@browser.button(id: 'EventLiability-Select-Event-FilterDiv1CancelButton')
	end

	def eventLiabilitySelectionCriteriaAddIcon
		@browser.button(id: 'EventLiability-Select-Event-FilterDiv2OKButton')
	end

	def eventLiabilitySelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventLiabilitySelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventLiabilitySelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end

	def eventLiabilitySourceDropdown
		@browser.button(id: 'EventLiability-Select-Source-mainbutton')
	end

	def eventLiabilitySourceSearchTextField
		@browser.text_field(id: 'EventLiability-Select-Source-search')
	end

	def eventLiabilitySourceFilterButton
		@browser.button(id: 'EventLiability-Select-Source-filterbutton')
	end

	def eventLiabilitySourceFilterButton
		@browser.button(id: 'EventLiability-Select-Source-filterbutton')
	end

	def eventLiabilityRacesDropdown
		@browser.button(id: 'EventLiability-Select-Races-mainbutton')
	end

	def eventLiabilityRacesSearchTextField
		@browser.text_field(id: 'EventLiability-Select-Races-search')
	end

	def eventLiabilityRacesDoneButton
		@browser.button(id: 'EventLiability-Select-Races-donebutton')
	end

	def eventLiabilityRacesAllCheckbox
		@browser.checkbox(id: 'ut-ms-opt-EventLiability-Select-Races-selectallcheckbox')
	end

	def eventLiabilityRacesCheckboxByIndex(index)
		@browser.checkbox(id: "ut-ms-opt-EventLiability-Select-Races_#{index}-checkbox")
	end

	#### SOURCE SELECTION CRITERIA ####
	def eventSourceSelectionCriteriaModal
		@browser.div(id: 'EventLiability-Select-Source-FilterDivrows')
	end

	def eventSourceSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'EventLiability-Select-Source-FilterDiv1FilterField1-mainbutton')
	end

	def eventSourceSelectionCriteriaSearchTextField
		@browser.text_field(id: 'EventLiability-Select-Source-FilterDiv1FilterField1-searchdiv')
	end

	def eventSourceSelectionCriteriaOperandDropdown
		@browser.button(id: 'EventLiability-Select-Source-FilterDiv1FilterField2-mainbutton')
	end

	def eventSourceSelectionCriteriaValueDropdown
		@browser.button(id: 'EventLiability-Select-Source-FilterDiv1FilterField3-mainbutton')
	end

	def eventSourceSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventSourceSelectionCriteriaCancelIcon
		@browser.button(id: 'EventLiability-Select-Source-FilterDiv1CancelButton')
	end

	def eventSourceSelectionCriteriaAddIcon
		@browser.button(id: 'EventLiability-Select-Source-FilterDiv2OKButton')
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
		@browser.button(id: 'EventLiability-Select-Races-mainbutton')
	end

	def eventRacesSearchTextField
		@browser.text_field(id: 'EventLiability-Select-Races-searchdiv')
	end

	def eventRacesSearchDoneButton
		@browser.button(id: 'EventLiability-Select-Races-donebutton')
	end

	def eventRaceSearchSelectAllCheckbox
		@browser.checkbox(id: 'ut-ms-opt-EventLiability-Select-Races-selectallcheckbox')
	end

	#### GETTERS ####
	def getEventResultView
		@browser.div(id: 'EventLiability-View-HT-0')
	end

	def getEvenSearchResults
		@browser.li(id: 'ut-ms-opt-EventLiability-Select-Event_noresults')
	end

	#### VERIFIERS ####
	def verifyEventSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getEventResultView.text).to include(expectedResult)
		getEventResultView.flash(color: ["yellow"])
	end

	def verifyEventSearchResultsInvalid(result)
		expectedResult = "#{result}"
		expect(getEvenSearchResults.text).to eq(expectedResult)
		getEvenSearchResults.flash(color: ["yellow"])
	end
end
