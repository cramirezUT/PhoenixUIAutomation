## Class Page Helper File
## Auther: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$eventById = "ID"
$eventByName = "Name"
$eventByPostTime = "PostTime"
$eventByOpenRaces = "Open Races"

module InquirePage
	include RSpec::Matchers
	include Selenium

	#### Inquiry METHODS / LOCATORS ####
	def eventInquiryHelpButton
		@browser.button(id: 'EventInquiry-Select-Help')
	end

	def eventInquiryDropdown
		@browser.button(id: 'EventInquiry-Select-Filter-mainbutton')
	end

	def eventInquirySearchTextField
		@browser.text_field(id: 'EventInquiry-Select-Filter-search')
	end

	def eventInquiryRefreshBtton
		@browser.button(id: 'EventInquiry-Select-Refresh')
	end

	def eventInquiryHelpBtton
		@browser.button(id: 'EventInquiry-Select-Help')
	end

	def eventInquiryResultView
		@browser.div(id: 'EventInquiry-View')
	end


	#### GETTERS ####
	def getEventInquiryResultNameByRow(row)
		@browser.div(id: "EventInquiry-View-#{row}-1")
	end

	def getEventInquiryResultRacesByRow(row)
		@browser.div(id: "EventInquiry-View-#{row}-2")
	end

	def getEventInquiryResultRaceByRow(row)
		@browser.div(id: "EventInquiry-View-#{row}-5")
	end

	def getEventInquiryResultStatusByRow(row)
		@browser.div(id: "EventInquiry-View-#{row}-6")
	end

	#### VERIFIERS ####
	def verifyEventInquirySearchResultsForName(row, result)
		expectedResult = "#{result}"
		expect(getEventInquiryResultNameByRow(row).text).to include(expectedResult)
		getEventInquiryResultNameByRow(row).flash(color: ["yellow"])
	end

	def verifyEventInquirySearchResultsForRaces(row, result)
		expectedResult = "#{result}"
		expect(getEventInquiryResultRacesByRow(row).text).to include(expectedResult)
		getEventInquiryResultRacesByRow(row).flash(color: ["yellow"])
	end

	def verifyEventInquirySearchResultsForRace(row, result)
		expectedResult = "#{result}"
		expect(getEventInquiryResultRaceByRow(row).text).to include(expectedResult)
		getEventInquiryResultRaceByRow(row).flash(color: ["yellow"])
	end

	def verifyEventInquirySearchResultsForStatus(row, result)
		expectedResult = "#{result}"
		expect(getEventInquiryResultStatusByRow(row).text).to include(expectedResult)
		getEventInquiryResultStatusByRow(row).flash(color: ["yellow"])
	end
end
