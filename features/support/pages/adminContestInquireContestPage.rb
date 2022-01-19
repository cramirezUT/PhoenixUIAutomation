## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$tournamentId = "T02 - Tourney 2"
$tournamentIdInvalid = "TNT"
$contestId = "S02 - Tourney 2"
$contestIdInvalid = "TNT"
$playerGroupdId = "TL1-1"

module ContestInquireContestPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST INQUIRE METHODS / LOCATORS ####
	def eventMenuInquireSubLinks(string)
		@browser.element(xpath: "//*[@id='Command-Menu-Inquire-#{string}']")
	end

	def contestInquiryModal
		@browser.div(id: 'ContestInquiry-Select')
	end

	def contestInquiryModalTournamentDropdown
		@browser.button(id: 'ContestInquiry-Select-Tournament-mainbutton')
	end

	def contestInquiryModalTournamentSearchTextField
		@browser.text_field(id: 'ContestInquiry-Select-Tournament-search')
	end

	def contestInquiryModalContestDropdown
		@browser.button(id: 'ContestInquiry-Select-Contest-mainbutton')
	end

	def contestInquiryModalContestSearchTextField
		@browser.text_field(id: 'ContestInquiry-Select-Contest-search')
	end

	def contestInquiryModalHelpButton
		@browser.button(id: 'ContestInquiry-Select-Help')
	end

	def contestInquiryTournamentModal
		@browser.div(id: 'ContestInquiry-Tournament')
	end

	def contestInquiryContestModal
		@browser.div(id: 'ContestInquiry-Contest')
	end

	#### GETTERS ####
	def getContestInquiryModalError(string)
		@browser.li(id: "ut-ms-opt-ContestInquiry-Select-#{string}_noresults")
	end

	#### VERIFIERS ####
	def verifyContestInquiryError(string, result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getContestInquiryModalError(string).text).to include(expectedResult)
		getContestInquiryModalError(string).flash(color: ["yellow"])
	end

	def verifyContestTournamentModal
		sleep(1)
		expect(contestInquiryTournamentModal).to be_truthy
		contestInquiryTournamentModal.flash(color: ["yellow"])
	end

	def verifyContestContestModal
		sleep(1)
		expect(contestInquiryContestModal).to be_truthy
		contestInquiryContestModal.flash(color: ["yellow"])
	end
end
