## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminAccountUnlockId = "uqa-10032"
$adminAccountUnlockIdInvalid = "TNT"

module AccountUnlockPage
	include RSpec::Matchers
	include Selenium

	#### Unlock METHODS / LOCATORS ####
	def accountUnlockSearchTextField
		@browser.text_field(id: 'Unlock-Select-Account')
	end

	def accountUnlockHelpButton
		@browser.button(id: 'Unlock-Select-Help')
	end

	def accountUnlockSearchButton
		@browser.button(id: 'Unlock-Select-View')
	end

	def accountUnlocClearAllButton
		@browser.button(id: 'Unlock-History-button')
	end

	def accountUnlockLockedAccountsCloseButton
		@browser.button(id: 'Unlock-Close')
	end

	#### GETTERS ####
	def getAccountUnlockError
		@browser.label(id: 'Unlock-Error')
	end

	def getAccountUnlockLockedAccountsResultView
		@browser.div(id: 'Unlock-List')
	end

	def getAccountUnlockedLockedAccountsIcon
		@browser.button(id: 'Unlock-Select-Locked-Icon')
	end

	#### VERIFIERS ####
	def verifyAccountUnlockErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getAccountUnlockError.text).to include(expectedResult)
		getAccountUnlockError.flash(color: ["yellow"])
	end

	def verifyAccountUnlockSearchResultsView
		sleep(1)
		expect(getAccountUnlockLockedAccountsResultView).to be_truthy
		getAccountUnlockLockedAccountsResultView.flash(color: ["yellow"])
	end

	def verifyAccountUnlockIcon
		sleep(1)
		expect(getAccountUnlockedLockedAccountsIcon).to be_truthy
		getAccountUnlockedLockedAccountsIcon.flash(color: ["yellow"])
	end
end
