## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminContestStandingsPlayerId = "TL1-10"
$adminContestStandingsPlayerIdInvalid = "TNT"
$adminContestStandingsPlayerDateTime = DateTime.now
$adminContestStandingsPlayerDateTimePlus1Day = $adminContestStandingsPlayerDateTime + 1
$adminContestStandingsPlayerDateTimePlus2Days = $adminContestStandingsPlayerDateTime + 2
$adminContestStandingsPlayerCurrentDateTime = $dateTime.strftime("%d %m %Y")
$adminContestStandingsPlayerCurrentDateTimePlus1Day = $adminContestStandingsPlayerDateTimePlus1Day.strftime("%d %m %Y")
$adminContestStandingsPlayerCurrentDateTimePlus2Days = $adminContestStandingsPlayerDateTimePlus2Days.strftime("%d %m %Y")

module ContestStandingsPlayerPage
	include RSpec::Matchers
	include Selenium

	#### player STANDINGS METHODS / LOCATORS ####
	def playerMenuStandingsSubLinks(string)
		sleep(1)
		@browser.element(xpath: "//*[@id='Command-Menu-Standings-#{string}']")
	end

	def playerStandingsModal
		@browser.div(id: 'PlayerStandings-Select')
	end

	def playerStandingsModalSearchTextField
		@browser.text_field(id: 'PlayerStandings-Select-Player')
	end

	def playerStandingsModalHelpButton
		@browser.button(id: 'PlayerStandings-Select-Help')
	end
	#### PLAYER RESULT MODAL ####
	def playerStandingsResultModal
		@browser.div(id: 'PlayerStandings-Standing')
	end
	#############################

	#### GETTERS ####
	def getPlayerResultError
		@browser.label(id: 'PlayerStandings-Error')
	end

	def getPlayerStandingsResultModalWinnings
		@browser.label(id: 'PlayerStandings-Standing-Winnings')
	end

	def getPlayerStandingsResultModalWagered
		@browser.label(id: 'PlayerStandings-Standing-Wagered')
	end

	def getPlayerStandingsResultModalContest
		@browser.label(id: 'PlayerStandings-Standing-Contest')
	end

	def getPlayerStandingsResultModalTournament
		@browser.label(id: 'PlayerStandings-Standing-Tournament')
	end

	def getPlayerStandingsResultModalStatus
		@browser.label(id: 'PlayerStandings-Standing-cStatus')
	end

	def getPlayerStandingsResultModalRank
		@browser.label(id: 'PlayerStandings-Standing-cRank')
	end

	def getPlayerStandingsResultModalPrize
		@browser.label(id: 'PlayerStandings-Standing-cPrize')
	end

	#### VERIFIERS ####
	def verifyPlayerResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getPlayerResultError.text).to include(expectedResult)
		getPlayerResultError.flash(color: ["yellow"])
	end


	def verifyPlayerResultModalData(winnings, wagered, contest, tournament, status, rank, prize)
		sleep(1)
		expectedResultWinnings = "#{winnings}"
		expectedResultWagered = "#{wagered}"
		expectedResultContest = "#{contest}"
		expectedResultTournament = "#{tournament}"
		expectedResultStatus = "#{status}"
		expectedResultRank = "#{rank}"
		expectedResultPrize = "#{prize}"
		expect(getPlayerStandingsResultModalWinnings.text).to include(expectedResultWinnings)
		expect(getPlayerStandingsResultModalWagered.text).to include(expectedResultWagered)
		expect(getPlayerStandingsResultModalContest.text).to include(expectedResultContest)
		expect(getPlayerStandingsResultModalTournament.text).to include(expectedResultTournament)
		expect(getPlayerStandingsResultModalStatus.text).to include(expectedResultStatus)
		expect(getPlayerStandingsResultModalRank.text).to include(expectedResultRank)
		expect(getPlayerStandingsResultModalPrize.text).to include(expectedResultPrize)
		getPlayerStandingsResultModalWinnings.flash(color: ["yellow"])
		getPlayerStandingsResultModalWagered.flash(color: ["yellow"])
		getPlayerStandingsResultModalContest.flash(color: ["yellow"])
		getPlayerStandingsResultModalTournament.flash(color: ["yellow"])
		getPlayerStandingsResultModalStatus.flash(color: ["yellow"])
		getPlayerStandingsResultModalRank.flash(color: ["yellow"])
		getPlayerStandingsResultModalPrize.flash(color: ["yellow"])
	end
end
