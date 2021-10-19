require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module PrizePage
	include RSpec::Matchers
	include Selenium

	#### PRIZE MODAL METHODS / LOCATORS ####
	def prizeConfigurationModal
		@browser.div(id: 'gridcontentFileprizes-Select')
	end

	def prizeConfigurationSettingButton
		@browser.button(id: 'Fileprizes-Manage')
	end

	def prizeConfigurationEditButton
		@browser.button(id: 'FilePrizes-Edit')
	end

	def prizeConfigurationHelpButton
		@browser.button(id: 'Fileprizes-Help')
	end

	def prizeConfigurationSortAscend
		@browser.button(id: 'sortascct1Fileprizes-Select')
	end

	def prizeConfigurationSortDescend
		@browser.button(id: 'sortdescct1Fileprizes-Select')
	end

	def prizeConfigurationRowSelection(index)
		@browser.div(id: "row#{index}Fileprizes-Select")
	end

	#### DISPLAYED COLUMNS METHODS / LOCATORS #####
	def prizeDispalyedColumnsModal
		@browser.button(id: 'GridColumns-Columns')
	end

	def prizeDispalyedColumnsSaveButton
		@browser.button(id: 'GridColumns-Save')
	end

	def prizeDispalyedColumnsCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def prizeDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end

	#### PRIZE EDIT METHODS / LOCATORS #####
	def prizeEditSaveButton
		@browser.button(id: 'FilePrize-Data-Save')
	end

	def prizeEditCloseButton
		@browser.button(id: 'FilePrize-Data-Close')
	end

	def prizeEditHelpButton
		@browser.button(id: 'FilePrize-Data-Help')
	end

	def prizeEditIdField
		@browser.input(id: 'FilePrize-Data-Id')
	end

	def prizeEditDescriptionField
		@browser.input(id: 'FilePrize-Data-Description')
	end

	def prizePrizesRadioButtonByIndex(index)
		@browser.td(xpath: "//td[@data-value='#{index}']")
	end

	def prizePrizesOnActiveCheckbox
		@browser.td(xpath: "//td[@data-value='(ON ) Active'][0]")
	end

	def prizePrizesPRZPrizeCheckbox
		@browser.td(xpath: "//td[@data-value='(PRZ) Prize'][0]")
	end

	#NEED TO CRAETE PRIZE EDIT DEF FOR SPLIT

end
