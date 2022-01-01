## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$accountGroupId = "uqa-10032"
$invalidGroupId = "99"

module AccountReviewPage
	include RSpec::Matchers
	include Selenium

	#### ACCOUNT REVIEW METHODS / LOCATORS ####
	def accountReviewModal
		@browser.div(id: 'AccountReview-Select')
	end

	def accountReviewSearchTextField
		@browser.text_field(id: 'AccountReview-Select-Account')
	end

	def accountReviewRefreshButton
		@browser.button(id: 'AccountReview-Select-Refresh')
	end

	def accountReviewHelpButton
		@browser.button(id: 'AccountReview-Select-Help')
	end

	def accountReviewFilterBar
		@browser.div(id: 'AccountReview-Filter')
	end

	def accountReviewFilterBarShowDropdown
		@browser.button(id: 'AccountReview-Filter-Mode-mainbutton')
	end

	def accountReviewFilterBarShowTextField
		@browser.button(id: 'AccountReview-Filter-Mode-search')
	end

	def accountReviewFilterBarBeginDate
		@browser.button(id: 'AccountReview-Filter-Time-Begin-firstdiv')
	end

	def accountReviewFilterBarBeginDatePickerButton
		@browser.button(id: 'AccountReview-Filter-Time-Begin-thirddiv')
	end

	def accountReviewFilterBarBeginTimePickerButton
		@browser.button(id: 'AccountReview-Filter-Time-Begin-fifthdiv')
	end

	def accountReviewFilterBarEndDate
		@browser.button(id: 'AccountReview-Filter-Time-End-firstdiv')
	end

	def accountReviewFilterBarEndDatePickerButton
		@browser.button(id: 'AccountReview-Filter-Time-End-seconddiv')
	end

	def accountReviewFilterBarEndTimePickerButton
		@browser.button(id: 'AccountReview-Filter-Time-End-fourthdiv')
	end

	def accountReviewResultsBoxByIndex(index)
		@browser.button(id: "AccountReview-Transactions-#{index}-TransactionBox-Transaction")
	end

	#### Review Confirmation Modal ####
	def accountReviewConfirmationModal
		@browser.div(id: 'Confirm')
	end

	def accountReviewConfirmationModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def accountReviewConfirmationModalNoButton
		@browser.button(id: 'Confirm-No')
	end

	#### GETTERS ####
	def getAccountReviewError
		@browser.label(id: 'AccountReview-Error')
	end

	def getAccountReview
		@browser.label(id: 'AccountReview-Amounts-Review')
	end

	#### VERIFIERS ####
	def verifyReviewEventErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountReviewError.text).to include(expectedResult)
		getAccountReviewError.flash(color: ["yellow"])
	end

	def verifyAccountReviewAmount(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountReview.text).to include(expectedResult)
		getAccountReview.flash(color: ["yellow"])
	end
end
