## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$playerId = "TL1-1"
$playerIdInvalid = "TNT"

module ContestStandingsPlayerPage
	include RSpec::Matchers
	include Selenium

	#### player STANDINGS METHODS / LOCATORS ####
	def eventMenuInquireSubLinks(string)
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

	def playerStandingsResultModal
		@browser.div(id: 'PlayerStandings-Standing')
	end

	#### GETTERS ####
	def getPlayerResultError
		@browser.label(id: 'PlayerStandings-Error')
	end

	#### VERIFIERS ####
	def verifyPlayerResultError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getPlayerResultError.text).to include(expectedResult)
		getPlayerResultError.flash(color: ["yellow"])
	end
end
