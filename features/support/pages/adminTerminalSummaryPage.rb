## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$grouplId = "TL1"
$grouplIdInvalid = "TNT"

module AdminTerminalSummaryPage
	include RSpec::Matchers
	include Selenium

	#### TERMINAL Summary METHODS / LOCATORS ####
	def adminTerminalSummaryModal
		@browser.div(id: 'TerminalSummary-Select')
	end

	def adminTerminalSummaryModalRefreshButton
		@browser.button(id: 'TerminalSummary-Select-Refresh')
	end

	def adminTerminalSummaryModalHelpButton
		@browser.button(id: 'TerminalSummary-Select-Help')
	end

	def adminTerminalSummaryModalGroupsDropdown
		@browser.button(id: 'TerminalSummary-Select-Groups-mainbutton')
	end

	def adminTerminalSummaryModalGroupsSearchTextField
		@browser.text_field(id: 'TerminalSummary-Select-Groups-search')
	end

	def adminTerminalSummaryModalGroupsFilterButton
		@browser.button(id: 'TerminalSummary-Select-Groups-filterbutton')
	end

	def adminTerminalSummaryModalGroupsDoneButton
		@browser.button(id: 'TerminalSummary-Select-Groups-donebutton')
	end

	#### TERMINAL SUMMARY SELECTION CRITERIA MODAL####
	def adminTerminalSummarySelectionCriteriaModal
		@browser.div(id: 'TerminalSummary-Select-Groups-FilterDivrows')
	end

	def adminTerminalSummarySelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'TerminalSummary-Select-Groups-FilterDiv1FilterField1-mainbutton')
	end

	def adminTerminalSummarySelectionCriteriaSearchTextField
		@browser.text_field(id: 'TerminalSummary-Select-Groups-FilterDiv1FilterField1-search')
	end

	def adminTerminalSummarySelectionCriteriaOperandDropdown
		@browser.button(id: 'TerminalSummary-Select-Groups-FilterDiv1FilterField2-mainbutton')
	end

	def adminTerminalSummarySelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'TerminalSummary-Select-Groups-FilterDiv1FilterField2-search')
	end

	def adminTerminalSummarySelectionCriteriaValueDropdown
		@browser.button(id: 'TerminalSummary-Select-Groups-FilterDiv1FilterField3-mainbutton')
	end

	def adminTerminalSummarySelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'TerminalSummary-Select-Groups-FilterDiv1FilterField3-search')
	end

	def adminTerminalSummarySelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def adminTerminalSummarySelectionCriteriaCancelIcon
		@browser.button(id: 'TerminalSummary-Select-Groups-FilterDiv1CancelButton')
	end

	def adminTerminalSummarySelectionCriteriaAddIcon
		@browser.button(id: 'TerminalSummary-Select-Groups-FilterDiv2OKButton')
	end

	def adminTerminalSummarySelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def adminTerminalSummarySelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def adminTerminalSummarySelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	def adminTerminalGroupSummaryResultModal
		@browser.div(id: 'TerminalSummary-Summary')
	end

	#### GETTERS ####
	def getAdminTerminalGroupSummaryResultError
		@browser.li(id: 'ut-ms-opt-TerminalSummary-Select-Groups_noresults')
	end

	#### VERIFIERS ####
	def verifyTerminalGroupSummaryResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAdminTerminalGroupSummaryResultError.text).to include(expectedResult)
		getAdminTerminalGroupSummaryResultError.flash(color: ["yellow"])
	end
end
