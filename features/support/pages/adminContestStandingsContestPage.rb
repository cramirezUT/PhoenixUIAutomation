## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$tournamentId = "T02"
$tournamentIdInvalid = "TNT"
$contestId = "S02"
$contestIdInvalid = "TNT"

module ContestStandingsContestPage
	include RSpec::Matchers
	include Selenium

	#### CONTEST STANDINGS METHODS / LOCATORS ####
	def eventMenuInquireSubLinks(string)
		@browser.element(xpath: "//*[@id='Command-Menu-Standings-#{string}']")
	end

	def contestStandingsModal
		@browser.div(id: 'ContestStandings-Select')
	end

	def contestStandingsModalTournamentDropdown
		@browser.button(id: 'ContestStandings-Select-Tournament-mainbutton')
	end

	def contestStandingsModalTournamentSearchTextField
		@browser.text_field(id: 'ContestStandings-Select-Tournament-search')
	end

	def contestStandingsModalContestDropdown
		@browser.button(id: 'ContestStandings-Select-Contest-mainbutton')
	end

	def contestStandingsModalContestSearchTextField
		@browser.text_field(id: 'ContestStandings-Select-Contest-search')
	end

	def contestStandingsModalHelpButton
		@browser.button(id: 'ContestStandings-Select-Help')
	end

	def contestStandingsTournamentResultsModal
		@browser.div(id: 'ContestStandings-Tournament')
	end

	def contestStandingsContestResultsModal
		@browser.div(id: 'ContestStandings-Contest')
	end

	#### GETTERS ####
	def getContestTournamentResultError
		@browser.li(id: "ut-ms-opt-ContestStandings-Select-Tournament_noresults")
	end

	def getContestContestResultError
		@browser.li(id: "ut-ms-opt-ContestStandings-Select-Contest_noresults")
	end

	#### VERIFIERS ####
	def verifyContestTournamentResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getContestTournamentResultError.text).to include(expectedResult)
		getContestTournamentResultError.flash(color: ["yellow"])
	end

	def verifyContestContestResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getContestContestResultError.text).to include(expectedResult)
		getContestContestResultError.flash(color: ["yellow"])
	end
end
