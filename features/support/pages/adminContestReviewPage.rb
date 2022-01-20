## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$playerGroupdId = "TL1-1"
$playerGroupdIdInvalid = "TNT"

module ContestReviewPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST REVIEW METHODS / LOCATORS ####
	def contestPlayerReviewModal
		@browser.div(id: 'ContestReview-Select')
	end

	def contestPlayerReviewModalPlayerTextField
		@browser.text_field(id: 'ContestReview-Select-Account')
	end

	def contestPlayerReviewModalRefreshButton
		@browser.button(id: 'ContestReview-Select-Refresh')
	end

	def contestPlayerReviewModalHelpButton
		@browser.button(id: 'ContestReview-Select-Help')
	end

	def contestPlayerShowDropdown
		@browser.button(id: 'ContestReview-Filter-Mode-mainbutton')
	end

	def contestPlayerSearchTextField
		@browser.text_field(id: 'ContestReview-Filter-Mode-search')
	end

	def contestPlayerBeginTimeDropdown
		@browser.button(id: 'inputContestReview-Filter-Time-Begin')
	end

	def contestPlayerEndTimeDropdown
		@browser.button(id: 'inputContestReview-Filter-Time-End')
	end

	def contestPlayerTransactionResultByIndex(index)
		sleep(1)
		@browser.button(id: "ContestReview-Transactions-#{index}-TransactionBox-Transaction")
	end

	def contestPlayerTransactionResultHeader
		@browser.div(utindex: 'ContestReview-Transaction-HT')
	end

	#### GETTERS ####
	def getContestPlayerReviewError
		@browser.label(id: "ContestReview-Error")
	end

	#### VERIFIERS ####
	def verifyContestInquiryError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getContestPlayerReviewError.text).to include(expectedResult)
		getContestPlayerReviewError.flash(color: ["yellow"])
	end

	def verifyContestPlayerReviewHeaderResult(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(contestPlayerTransactionResultHeader.text).to include(expectedResult)
		contestPlayerTransactionResultHeader.flash(color: ["yellow"])
	end
end
