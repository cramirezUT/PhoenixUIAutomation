## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminContestUnlockPlayerId = "TL1-1"
$adminContestUnlockPlayerIdInvalid = "TNT"

module ContestUnlockPage
	include RSpec::Matchers
	include Selenium

	#### PLAYER UNLOCK METHODS / LOCATORS ####
	def unLockPlayerModal
		@browser.div(id: 'Unlock-Select')
	end

	def unlockplayerModalSearchTextField
		@browser.text_field(id: 'Unlock-Select-Account')
	end

	def unlockPlayerHelpButton
		@browser.button(id: 'Unlock-Select-Help')
	end

	def unlockPlayerModalViewButton
		@browser.button(id: 'Unlock-Select-View')
	end

	def unlockPlayerModalUnlockedIcon
		@browser.button(id: 'Unlock-Select-Locked-Icon')
	end

	#### LOCKED PLAYERS MODAL ####
	def unlockPlayerLockedModal
		@browser.div(id: 'Unlock-List')
	end

	def unlockPlayerLockedModalCloseButton
		@browser.button(id: 'Unlock-Close')
	end
	##############################

	#### GETTERS ####
	def getUnlockPlayerError
		@browser.label(id: 'Unlock-Error')
	end

	#### VERIFIERS ####
	def verifyUnlockplayerErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getUnlockPlayerError.text).to include(expectedResult)
		getUnlockPlayerError.flash(color: ["yellow"])
	end

	def verifyUnlockPlayerSearchResultsView
		sleep(1)
		expect(unlockPlayerLockedModal).to be_truthy
		unlockPlayerLockedModal.flash(color: ["yellow"])
	end

	def verifyUnlockPlayerLockedIcon
		sleep(1)
		expect(unlockPlayerModalUnlockedIcon).to be_truthy
		unlockPlayerModalUnlockedIcon.flash(color: ["yellow"])
	end
end
