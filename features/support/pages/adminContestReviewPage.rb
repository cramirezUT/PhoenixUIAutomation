## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminContestReviewPlayerGroupdId = "TL1-1"
$adminContestReviewPlayerGroupdIdInvalid = "TNT"
$adminContestReviewDateTime = DateTime.now
$adminContestReviewDateTimePlus1Day = $adminContestReviewDateTime + 1
$adminContestReviewDateTimePlus2Days = $adminContestReviewDateTime + 2
$adminContestReviewCurrentDateTime = $adminContestReviewDateTime.strftime("%d %m %Y")
$adminContestReviewCurrentDateTimePlus1Day = $adminContestReviewDateTimePlus1Day.strftime("%d %m %Y")
$adminContestReviewCurrentDateTimePlus2Days = $adminContestReviewDateTimePlus2Days.strftime("%d %m %Y")

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

	def contestPlayerBeginCalanerButton
		@browser.element(xpath: "//div[@id='ContestReview-Filter-Time-Begin-seconddiv']/div")
	end

	def contestPlayerBeginDateTextField
    @browser.text_field(id: 'inputContestReview-Filter-Time-Begin')
  end

	def contestPlayerEndDateTextField
    @browser.text_field(id: 'inputContestReview-Filter-Time-End')
  end

	def contestPlayerTransactionResultHeader
		@browser.div(utindex: 'ContestReview-Transaction-HT')
	end

	#### GETTERS ####
	def getContestPlayerReviewError
		@browser.label(id: "ContestReview-Error")
	end

	#### VERIFIERS ####
	def verifyAdminContestReviewError(result)
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
