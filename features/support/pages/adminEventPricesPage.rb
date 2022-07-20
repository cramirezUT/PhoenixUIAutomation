## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$adminEventPricesEventId = "CHF"
$adminEventPricesEventIdInvalid = "TNT"
$adminEventPricesRaceNumber2 = "2"
$adminEventPricesSourceMeregeId = "Merged"

module PricesPage
	include RSpec::Matchers
	include Selenium

	#### PRICES METHODS / LOCATORS ####
	def eventPricesEventDropdown
		@browser.button(id: 'Prices-Select-Event-mainbutton')
	end

	def eventPricesEventSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-search')
	end

	def eventPricesEventFilterButton
		@browser.button(id: 'Prices-Select-Event-filterbutton')
	end

	def eventPricesRaceDropdown
		@browser.button(id: 'Prices-Select-Race-mainbutton')
	end

	def eventPricesRaceSearchTextField
		sleep(1)
		@browser.text_field(id: 'Prices-Select-Race-search')
	end

	def eventPricesGroupDropdown
		@browser.button(id: 'Prices-Select-Group-mainbutton')
	end

	def eventPricesRaceNumberByIndex(index)
		@browser.li(id: "ut-ms-opt-Prices-Select-Race_#{index}")
	end

	def eventPricesGroupSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-search')
	end

	def eventPricesLeftArrow
		@browser.button(id: 'Prices-Select-Prev')
	end

	def eventPricesRightArrow
		@browser.button(id: 'Prices-Select-Next')
	end

	#### PRICES GROUP EVENT SELECTION CRITERIA ####
	def eventPricesGroupSelectionCriteriaModal
		@browser.div(id: 'Prices-Select-Group-FilterDivrows')
	end

	def eventPricesGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def eventPricesGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-FilterDiv1FilterField1-search')
	end

	def eventPricesGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def eventPricesGroupSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField2-search')
	end

	def eventPricesGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def eventPricesGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-FilterDiv1FilterField3-search')
	end

	def eventPricesGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventPricesGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'Prices-Select-Group-FilterDiv1CancelButton')
	end

	def eventPricesGroupSelectionCriteriaAddIcon
		@browser.button(id: 'Prices-Select-Group-FilterDiv2OKButton')
	end

	def eventPricesGroupSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventPricesGroupSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventPricesGroupSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	#########################################

	#### PRICES EVENT SELECTION CRITERIA ####
	def eventPricesSelectionCriteriaModal
		@browser.div(id: 'Prices-Select-Event-FilterDivrows')
	end

	def eventPricesSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Prices-Select-Event-FilterDiv1FilterField1-mainbutton')
	end

	def eventPricesSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-FilterDiv1FilterField1-search')
	end

	def eventPricesSelectionCriteriaOperandDropdown
		@browser.button(id: 'Prices-Select-Event-FilterDiv1FilterField2-mainbutton')
	end

	def eventPricesSelectionCriteriaOperandSearchTextField
		@browser.button(id: 'Prices-Select-Event-FilterDiv1FilterField2-search')
	end

	def eventPricesSelectionCriteriaValueDropdown
		@browser.button(id: 'Prices-Select-Event-FilterDiv1FilterField3-mainbutton')
	end

	def eventPricesSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-FilterDiv1FilterField3-search')
	end

	def eventPricesSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def eventPricesSelectionCriteriaCancelIcon
		@browser.button(id: 'Prices-Select-Event-FilterDiv1CancelButton')
	end

	def eventPricesSelectionCriteriaAddIcon
		@browser.button(id: 'Prices-Select-Event-FilterDiv2OKButton')
	end

	def eventPricesSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def eventPricesSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def eventPricesSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	############################################

	#### EVENT FINISH RESLUT MODAL ####
	def eventFinishResultsModal
		@browser.table(id: 'Prices-Price-Finishers')
	end

	def eventFinishResultsModal1stPlaceFinisher
		@browser.tr(data_utrow: '0').text
	end

	def eventFinishResultsModal2ndPlaceFinisher
		@browser.tr(data_utrow: '1').text
	end

	def eventFinishResultsModal3rdPlaceFinisher
		@browser.tr(data_utrow: '2').text
	end

	def eventFinishResultsModal4thPlaceFinisher
		@browser.tr(data_utrow: '3').text
	end
	###################################

	#### GETTERS ####
	def getEventResultHeaderTitle
		sleep(1)
		@browser.div(utclass: 'LargeText BoldText')
	end

	def getEventFinishResults
		@browser.div(utclass: 'Prices-Price-Finishers')
	end

	def getEventErrorMessage
		@browser.li(id: 'ut-ms-opt-Prices-Select-Event_noresults')
	end

	#### VERIFIERS ####
	def verifyAdminEventPricesEventSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getEventResultHeaderTitle.text).to include(expectedResult)
		getEventResultHeaderTitle.flash(color: ["yellow"])
	end

	def verifyEventFinishResults(result)
		expectedResult = "#{result}"
		expect(getEventFinishResults.text).to eq(expectedResult)
		getEventFinishResults.flash(color: ["yellow"])
	end

	def verifyEventErrorMessage(result)
		expectedResult = "#{result}"
		expect(getEventErrorMessage.text).to eq(expectedResult)
		getEventErrorMessage.flash(color: ["yellow"])
	end
end
