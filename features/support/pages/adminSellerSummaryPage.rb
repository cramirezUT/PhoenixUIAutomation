## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$groupsId = "TL1"
$groupsIdInvalid = "TNT"

module AdminSellerSummaryPage
	include RSpec::Matchers
	include Selenium

	#### SELLER SUMMARY METHODS / LOCATORS ####
	def adminSellerGroupSummaryModal
		@browser.div(id: 'SellerSummary-Select')
	end

	def adminSellerGroupSummaryModalGroupsDropdown
		@browser.button(id: 'SellerSummary-Select-Groups-mainbutton')
	end

	def adminSellerGroupSummaryModalGroupsSearchTextField
		@browser.text_field(id: 'SellerSummary-Select-Groups-search')
	end

	def adminSellerGroupSummaryModalHelpButton
		@browser.button(id: 'SellerSummary-Command-Help')
	end

	def adminSellerGroupSummaryModalFilterButton
		@browser.button(id: 'SellerSummary-Select-Groups-filterbutton')
	end

	def adminSellerGroupSummaryModalDoneButton
		@browser.button(id: 'SellerSummary-Select-Groups-donebutton')
	end

	##### SELLER GROUP SUMMARY SELECTION CRITERIA MODAL ####
	def sellerGroupSummarySelectionCriteriaModal
		@browser.div(id: 'SellerSummary-Select-Groups-FilterDivrows')
	end

	def sellerGroupSummarySelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv1FilterField1-mainbutton')
	end

	def sellerGroupSummarySelectionCriteriaSearchTextField
		@browser.text_field(id: 'SellerSummary-Select-Groups-FilterDiv1FilterField1-search')
	end

	def sellerGroupSummarySelectionCriteriaOperandDropdown
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv1FilterField2-mainbutton')
	end

	def sellerGroupSummaryCriteriaOperandSearchTextField
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv1FilterField2-search')
	end

	def sellerGroupSummarySelectionCriteriaValueDropdown
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv1FilterField3-mainbutton')
	end

	def sellerGroupSummarySelectionCriteriaValueSearchTextField
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv1FilterField3-search')
	end

	def sellerGroupSummarySelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def sellerGroupSummarySelectionCriteriaCancelIcon
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv1CancelButton')
	end

	def sellerGroupSummarySelectionCriteriaAddIcon
		@browser.button(id: 'SellerSummary-Select-Groups-FilterDiv2OKButton')
	end

	def sellerGroupSummarySelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def sellerGroupSummarySelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def sellerGroupSummarySelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	########################################################

	def sellerGroupSummarySearchResultModal
		@browser.div(id: 'SellerSummary-Summary')
	end

	#### GETTERS ####
	def getSellerSummaryError
		@browser.ul(id: 'SellerSummary-Select-Groups-ul')
	end

	#### VERIFIERS ####
	def verifySellerSummaryError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerSummaryError.text).to include(expectedResult)
		getSellerSummaryError.flash(color: ["yellow"])
	end
end
