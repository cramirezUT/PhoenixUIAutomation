## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

@adminSellerControlRandom = rand(9999)
$adminSellerControlSellerId = "UTS-1"
$adminSellerControlSellerIdInvalid = "TNT"
$adminSellerControlLockSellerOneCharacter = "A"

module AdminSellerControlPage
	include RSpec::Matchers
	include Selenium

	#### SELLER CONTROL METHODS / LOCATORS ####
	def adminSellerControlModal
		@browser.div(id: 'SellerControl-Command')
	end

	def adminSellerControlModalSellerTextField
		@browser.text_field(id: 'SellerControl-Command-Seller')
	end

	def adminSellerControlModalLockButton
		sleep(1)
		@browser.button(id: 'SellerControl-Command-Locked-Button')
	end

	def adminSellerControlModalUnlockButton
		sleep(1)
		@browser.button(id: 'SellerControl-Command-Locked-Button')
	end

	def adminSellerControlModalHelpButton
		@browser.button(id: 'SellerControl-Command-Help')
	end

	def adminSellerControlModalLockIcon
		@browser.button(id: 'SellerControl-Command-Locked-Icon')
	end

	def adminSellerControlModalUnlockIcon
		@browser.button(id: 'SellerControl-Command-Locked-Icon')
	end

	#### UNLOCK SELELR MODAL ####
	def adminSellerControlUnlockSellerModal
		@browser.div(id: 'Ack')
	end

	def adminSellerControlUnlockSellerModalYesButton
		@browser.button(id: 'Ack-Yes')
	end

	def adminSellerControlUnlockSellerModalNoButton
		@browser.button(id: 'Ack-No')
	end
	#############################

	#### LOCK SELLER MODAL ####
	def adminSellerControlLockSellerModal
		@browser.div(id: 'Confirm')
	end

	def adminSellerControlLockSellerModalTextField
		@browser.text_field(id: 'Confirm-Text')
	end

	def adminSellerControlLockSellerModalYesButton
		@browser.button(id: 'Confirm-Yes')
	end

	def adminSellerControlLockSellerModalNoButton
		@browser.button(id: 'Confirm-No')
	end
	###########################

	#### CONTROL MODAL ####
	def adminSellerControlResultModal
		@browser.div(id: 'SellerControl-Control')
	end

	def adminSellerControlResultModalBeginningControl
		@browser.div(id: 'SellerControl-Control-0-1')
	end

	def adminSellerControlResultModalSellerPayments
		@browser.div(id: 'SellerControl-Control-1-1')
	end

	def adminSellerControlResultModalTerminalControl
		@browser.div(id: 'SellerControl-Control-4-1')
	end

	def adminSellerControlResultModalEndingControl
		@browser.div(id: 'SellerControl-Control-6')
	end
	#######################

	#### GETTERS ####
	def getSellerControlError
		@browser.label(id: 'SellerControl-Error')
	end

	#### VERIFIERS ####
	def verifySellerControlError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getSellerControlError.text).to include(expectedResult)
		getSellerControlError.flash(color: ["yellow"])
	end
end
