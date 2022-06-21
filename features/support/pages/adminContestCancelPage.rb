## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminContestCancelPlayerId = "TLC-10"
$adminContestCancelPlayerIdInvalid = "TNT"

module ContestCancelPage
	include RSpec::Matchers
	include Selenium

	#### Unlock METHODS / LOCATORS ####
	def contestCancelPlayerCancelTicketModal
		@browser.div(id: 'ContestCancel-Select')
	end

	def playerCancelTicketModalRefreshButton
		@browser.button(id: 'ContestCancel-Select-Refresh')
	end

	def playerCancelTicketModalHelpButton
		@browser.button(id: 'ContestCancel-Select-Help')
	end

	def playerCancelTicketModalGroupNumberTextField
		@browser.text_field(id: 'ContestCancel-Select-Account')
	end

	def playerCancelTicketModalCancelTicketButton
		@browser.button(id: 'ContestCancel-Cancel')
	end

	#### GETTERS ####
	def getContestCancelError
		@browser.label(id: 'ContestCancel-Error')
	end

	#### VERIFIERS ####
	def verifycontestCancelErrorSearchResults(result)
		sleep(2)
		expectedResult = "#{result}"
		expect(getContestCancelError.text).to include(expectedResult)
		getContestCancelError.flash(color: ["yellow"])
	end
end
