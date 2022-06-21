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
$filterOptionAll = "All"
$filterOptionOuts = "Outs"
$filterOptionEvents = "Events"
$filterOptionCash = "Cash"
$filterOptionCoupon = "Coupon"
$filterOptionPending = "Pending"
$filterOptionChanges = "Changes"
$eventsOptionText = "A"
$dateTime = DateTime.now
$dateTimePlus1Day = $dateTime + 1
$dateTimePlus2Days = $dateTime + 2
$currentDateTime = $dateTime.strftime("%d %m %Y")
$currentDateTimePlus1Day = $dateTimePlus1Day.strftime("%d %m %Y")
$currentDateTimePlus2Days = $dateTimePlus2Days.strftime("%d %m %Y")

module ContestInquirePlayerPage
	include RSpec::Matchers
	include Selenium

	#### PLAYER INQUIRE PLAYER METHODS / LOCATORS ####
	def playerMenuInquireSubLinks(string)
		sleep(1)
		@browser.element(xpath: "//*[@id='Command-Menu-Inquire-#{string}']")
	end

	def playerInquiryModal
		@browser.div(id: 'PlayerInquiry-Select')
	end

	def playerInquiryModalPlayerSearchTextField
		@browser.text_field(id: 'PlayerInquiry-Select-Account')
	end

	def contestInquiryModalContestSearchTextField
		@browser.text_field(id: 'ContestInquiry-Select-Contest-search')
	end

	def playerInquiryModalRequestButton
		@browser.button(id: 'PlayerInquiry-Select-Request')
	end

	def playerInquiryModalFilterDropdown
		@browser.button(id: 'PlayerInquiry-Select-Option-Mode-mainbutton')
	end

	def playerInquiryModalFilterSearchTextField
		@browser.text_field(id: 'PlayerInquiry-Select-Option-Mode-search')
	end

	def playerInquiryModalEventsDropdown
		@browser.button(id: 'PlayerInquiry-Select-Event-Events-mainbutton')
	end

	def playerInquiryModalEventsSearchTextField
		@browser.text_field(id: 'PlayerInquiry-Select-Event-Events-search')
	end

	def playerInquiryModalEventsSearchOptionAll
		@browser.label(id: 'ut-ms-opt-PlayerInquiry-Select-Event-Events-selectalllabel')
	end

	def playerInquiryModalEventsDoneButton
		@browser.button(id: 'PlayerInquiry-Select-Event-Events-donebutton')
	end

	def playerInquiryModalRacesDropdown
		@browser.button(id: 'PlayerInquiry-Select-Race-Races-mainbutton')
	end

	def playerInquiryModalRacesAllOption
		@browser.label(id: 'ut-ms-opt-PlayerInquiry-Select-Race-Races-selectalllabel')
	end

	def playerInquiryModalRacesByIndex(index)
		@browser.label(id: "ut-ms-opt-PlayerInquiry-Select-Race-Races_#{index}-label")
	end

	def playerInquiryModalRacesDoneButton
		@browser.button(id: 'PlayerInquiry-Select-Race-Races-donebutton')
	end

	def playerInquiryModalPoolsDropdown
		@browser.button(id: 'PlayerInquiry-Select-Pool-Pools-mainbutton')
	end

	def playerInquiryModalPoolsSearchTextField
		@browser.text_field(id: 'PlayerInquiry-Select-Pool-Pools-search')
	end

	def playerInquiryModalPoolsAllOption
		@browser.label(id: 'ut-ms-opt-PlayerInquiry-Select-Pool-Pools-selectalllabel')
	end

	def playerInquiryModalPoolsDoneButton
		@browser.button(id: 'PlayerInquiry-Select-Pool-Pools-donebutton')
	end

	def playerInquiryModalHelpButton
		@browser.button(id: 'ContestInquiry-Select-Help')
	end

	def playerInquiryModalClearButton
		@browser.button(id: 'PlayerInquiry-Select-Clear')
	end

	def playerInquiryResultModal
		@browser.div(id: 'PlayerInquiry-ScreenOutput')
	end

	def playerInquiryModalBeginTextField
		@browser.text_field(id: 'inputPlayerInquiry-Select-Time-Begin')
	end

	def playerInquiryModalEndTextField
		@browser.text_field(id: 'inputPlayerInquiry-Select-Time-End')
	end

	#### GETTERS ####
	def getPlayerInquiryModalError
		@browser.label(id: "PlayerInquiry-Error")
	end

	#### VERIFIERS ####
	def verifyPlayerInquiryError(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getPlayerInquiryModalError.text).to include(expectedResult)
		getPlayerInquiryModalError.flash(color: ["yellow"])
	end

	def verifyPlayerResultModal
		sleep(1)
		expect(playerInquiryResultModal).to be_truthy
		playerInquiryResultModal.flash(color: ["yellow"])
	end
end
