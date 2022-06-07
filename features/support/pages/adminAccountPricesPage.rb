## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$eventId = "CHF"
$eventIdInvalid = "TNT"

module AccountPricesPage
	include RSpec::Matchers
	include Selenium

	#### PRICES METHODS / LOCATORS ####
	def accountPricesEventDropdown
		@browser.button(id: 'Prices-Select-Event-mainbutton')
	end

	def accountPricesEventSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-search')
	end

	def accountPricesEventFilterButton
		@browser.button(id: 'Prices-Select-Event-filterbutton')
	end

	def accountPricesHelpButton
		@browser.button(id: 'Prices-Select-Help')
	end

	#### PRCIES ACCOUNT SELECTION CRITERIA MODAL####
	def accountPricesSelectionCriteriaModal
		@browser.div(id: 'Prices-Select-Event-FilterDivrows')
	end

	def accountPricesSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Prices-Select-Event-FilterDiv4FilterField1-mainbutton')
	end

	def accountPricesSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-FilterDiv4FilterField1-search')
	end

	def accountPricesSelectionCriteriaOperandDropdown
		@browser.button(id: 'Prices-Select-Event-FilterDiv4FilterField2-mainbutton')
	end

	def accountPricesSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-FilterDiv4FilterField2-search')
	end

	def accountPricesSelectionCriteriaValueDropdown
		@browser.button(id: 'Prices-Select-Event-FilterDiv4FilterField3-mainbutton')
	end

	def accountPricesSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'Prices-Select-Event-FilterDiv4FilterField3-search')
	end

	def accountPricesSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def accountPricesSelectionCriteriaCancelIcon
		@browser.button(id: 'Prices-Select-Event-FilterDiv4CancelButton')
	end

	def accountPricesSelectionCriteriaAddIcon
		@browser.button(id: 'Prices-Select-Event-FilterDiv5OKButton')
	end

	def accountPricesSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def accountPricesSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def accountPricesSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	def accountPricesRaceDropdown
		@browser.button(id: 'Prices-Select-Race-mainbutton')
	end

	def accountPricesRaceLeftArrow
		@browser.button(id: 'Prices-Select-Prev')
	end

	def accountPricesRaceRightArrow
		@browser.button(id: 'Prices-Select-Next')
	end

	def accountPricesGroupDropdown
		@browser.button(id: 'Prices-Select-Group-mainbutton')
	end

	def accountPricesGroupSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-search')
	end

	def accountPricesGroupFilterButton
		@browser.button(id: 'Prices-Select-Group-filterbutton')
	end

	#### GROUP SELECTION CRITERIA MODAL####
	def accountPricesGroupSelectionCriteriaModal
		@browser.div(id: 'Prices-Select-Group-FilterDivrows')
	end

	def accountPricesGroupSelectionCriteriaSelectFieldDropdown
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField1-mainbutton')
	end

	def accountPricesGroupSelectionCriteriaSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-FilterDiv1FilterField1-search')
	end

	def accountPricesGroupSelectionCriteriaOperandDropdown
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField2-mainbutton')
	end

	def accountPricesGroupSelectionCriteriaOperandSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-FilterDiv1FilterField2-search')
	end

	def accountPricesGroupSelectionCriteriaValueDropdown
		@browser.button(id: 'Prices-Select-Group-FilterDiv1FilterField3-mainbutton')
	end

	def accountPricesGroupSelectionCriteriaValueSearchTextField
		@browser.text_field(id: 'Prices-Select-Group-FilterDiv1FilterField3-search')
	end

	def accountPricesGroupSelectionCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def accountPricesGroupSelectionCriteriaCancelIcon
		@browser.button(id: 'Prices-Select-Group-FilterDiv1CancelButton')
	end

	def accountPricesGroupSelectionCriteriaAddIcon
		@browser.button(id: 'Prices-Select-Group-FilterDiv2OKButton')
	end

	def accountPricesGroupSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def accountPricesGroupSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def accountPricesGroupSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
	##################################################

	#### GETTERS ####
	def getPricesEventNoMatchError
		@browser.li(id: 'ut-ms-opt-Prices-Select-Event_noresults')
	end

	def getEventResultView
		@browser.div(id: 'Prices-Price')
	end

	def getEventFinishResultHorseNameByIndex(index) #Index starts with 2 and increases by 3
		@browser.element(xpath: "//*[contains(@utindex,'#{index}') and contains(@data-utcolumn, '2')]")
	end

	#### VERIFIERS ####
	def verifyPricesEventErrorSearchResults(result)
		sleep(1)
		expectedResult = "#{result}"
		expect(getPricesEventNoMatchError.text).to include(expectedResult)
		getPricesEventNoMatchError.flash(color: ["yellow"])
	end

	def verifyPricesEventSearchResultsFirstPlaceHorse(result)
		sleep(2)
		expectedResult = "#{result}"
		expect(getEventFinishResultHorseNameByIndex(2).text).to eq(expectedResult)
		getEventFinishResultHorseNameByIndex(2).flash(color: ["yellow"])
	end
end
