## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module RegionPage
	include RSpec::Matchers
	include Selenium

	#### REGION CONFIGURATION MODAL METHODS / LOCATORS####
	def regionConfigurationModal
		@browser.div(id: 'gridcontentFileRegions-Select')
	end

	def regionConfigurationSettingButton
		@browser.button(id: 'FileRegions-Manage')
	end

	def regionConfigurationEditButton
		@browser.button(id: 'FileRegions-Edit')
	end

	def regionConfigurationHelpButton
		@browser.button(id: 'FileRegions-Help')
	end

	def regionConfigurationRowSelection(index)
		@browser.div(id: "row#{index}FileRegions-Select")
	end

	def regionConfigurationSortAscend
		@browser.button(id: 'sortascct1FileRegions-Select')
	end

	def regionConfigurationSortDescend
		@browser.button(id: 'sortdescct1FileRegions-Select')
	end

	def regionConfigurationFilterButton
		@browser.button(id: 'FileRegions-Select-gridFilterBtn')
	end

	def regionConfigurationFilterButton
		@browser.button(id: 'FileRegions-Select-gridFilterBtn')
	end

	#### REGION DISPLAYED COLUMNS MODAL METHODS / LOCATORS ####
	def regionDisplayedColumnsSaveButton
		@browser.button(id: 'GridColumns-Save')
	end

	def regionDisplayedColumnsCloseButton
		@browser.button(id: 'GridColumns-Close')
	end

	def regionDisplayedColumsModalAllRows
		@browser.button(id: 'GridColumns-Columns')
	end

	def regionDisplayedColumsModalIterateByRows
		@browser.table(id: "GridColumns-Columns").trs.collect{ |tr| tr[0].text.gsub!(/[\s!@%\/&"']/,'')}
	end

	#### REGION EDIT MODAL METHODS / LOCATORS ####
	def regionEditSaveButton
		@browser.button(id: 'FileRegion-Data-Save')
	end

	def regionEditCloseButton
		@browser.button(id: 'FileRegion-Data-Close')
	end

	def regionEditHelpButton
		@browser.button(id: 'FileRegion-Data-Help')
	end

	def regionEditNameTextField
		@browser.text_field(id: 'FileRegion-Data-Name')
	end

	def regionEditTracksDropdown
		@browser.div(id: 'FileRegion-Data-Tracks-ut-ms-parent')
	end

	def regionEditTracksSearchField
		@browser.iput(id: 'FileRegion-Data-Tracks-search')
	end

	def regionEditTracksFilterButton
		@browser.div(id: 'FileRegion-Data-Tracks-filterbutton')
	end

	def regionEditTracksDoneButton
		@browser.button(id: 'FileRegion-Data-Tracks-donebutton')
	end

	def regionEditTracksCheckboxByIndex(index)
		@browser.input(xpath: "//*[@id='FileRegion-Data-Tracks-ul']//*[@type='checkbox']["+index+"]")
	end

	def regionEditBreedDropdown
		@browser.div(id: 'FileRegion-Data-Breed-ut-ms-parent')
	end

	def regionEditBreedSearchField
		@browser.input(id: 'FileRegion-Data-Breed-search')
	end

	def regionEditInstanceDropdown
		@browser.div(id: 'FileRegion-Data-Instance-ut-ms-parent')
	end

	def regionEditInstanceSearchField
		@browser.input(id: 'FileRegion-Data-Instance-search')
	end

	def regionEditRacesDropdown
		@browser.div(id: 'FileRegion-Data-Races-ut-ms-parent')
	end

	def regionEditRacesSearchField
		@browser.input(id: 'FileRegion-Data-Races-search')
	end

	def regionEditRacesDoneButton
		@browser.button(id: 'FileRegion-Data-Races-donebutton')
	end

	def regionEditRacesCheckboxByIndex(index)
		@browser.input(xpath: "//*[@id='FileRegion-Data-Races-ul']//*[@type='checkbox']["+index+"]")
	end

	def regionEditPoolsDropdown
		@browser.div(id: 'FileRegion-Data-Pools-ut-ms-parent')
	end

	def regionEditPoolsSearchField
		@browser.input(id: 'FileRegion-Data-Pools-search')
	end

	def regionEditPoolsDoneButton
		@browser.button(id: 'FileRegion-Data-Pools-donebutton')
	end

	def regionEditPoolsCheckboxByIndex()
		@browser.button(xpath: "//*[@id='FileRegion-Data-Pools-ul']//*[@type='checkbox']["+index+"]")
	end

	#### SELECTION CRITERIA MODAL METHODS / LOCATORS ####
	def regionSelectCriteriaHelpButton
		@browser.button(id: 'FilterHelp')
	end

	def regionSelectionCriteriaDropdown
		@browser.div(id: 'FileRegions-Select-FilterDiv1FilterField1-ut-ms-parent')
	end

	def regionSelectCriteriaSearchField
		@browser.input(id: 'FileRegions-Select-FilterDiv1FilterField1-search')
	end

	def regionSelectionCriteriaDropdown
		@browser.div(id: 'FileRegions-Select-FilterDiv1FilterField1-ut-ms-parent')
	end

	def regionSelectionOperandDropdown
		@browser.div(id: 'FileRegions-Select-FilterDiv1FilterField2-mainbutton-span')
	end

	def regionSelectCriteriaOperandSearchField
		@browser.input(id: 'FileRegions-Select-FilterDiv1FilterField2-search')
	end

	def regionSelectionOperandDropdown
		@browser.div(id: 'FileRegions-Select-FilterDiv1FilterField3-ut-ms-parent')
	end

	def regionSelectCriteriaValueDropdown
		@browser.div(id: 'FileRegions-Select-FilterDiv1FilterField3-ut-ms-parent')
	end

	def regionSelectCriteriaValueSearchField
		@browser.input(id: 'FileRegions-Select-FilterDiv1FilterField3-search')
	end

	def regionSelectionCriteriaCancelIcon
		@browser.button(id: 'FileRegions-Select-FilterDiv2CancelButton')
	end

	def regionSelectionCriteriaAddIcon
		@browser.button(id: 'FileRegions-Select-FilterDiv3OKButton')
	end

	def regionSelectionCriteriaClearButton
		@browser.button(id: 'resetFilterButton')
	end

	def regionSelectionCriteriaApplyButton
		@browser.button(id: 'applyFilterButton')
	end

	def regionSelectionCriteriaCancelButton
		@browser.button(id: 'cancelFilterButton')
	end
end
