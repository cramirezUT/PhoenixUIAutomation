## Class Page Helper File
## Author: Carlos Ramirez

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$filesSellerGroupNumber = "UTS-3"

module FilesSellerPage
	include RSpec::Matchers
	include Selenium

	#### SELLER CONFIGURATION MODAL METHODS / LOCATORS####
	def sellerConfigurationModal
		sleep(1)
		@browser.div(id: 'FileSellers-Select')
	end

	def sellerConfigurationModalHelpButton
		@browser.button(id: 'FileSellers-Select-Help')
	end

	def sellerConfigurationModalSellerTextField
		@browser.text_field(id: 'FileSellers-Select-Seller-Number')
	end

	#### SELLER MODAL ####
	def sellerModal
		@browser.div(id: 'FileSeller')
	end

	def sellerModalDeleteButton
		@browser.button(id: 'FileSeller-Delete')
	end

	def sellerModalBalaneDetail
		@browser.div(id: 'FileSeller-Detail')
	end

	def sellerModalBalaneDetailCurrencyDropdown
		@browser.button(id: 'FileSeller-Detail-Currency-mainbutton')
	end

	def sellerModalBalaneDetailCurrencySearchTextField
		@browser.text_field(id: 'FileSeller-Detail-Currency-search')
	end
	######################

	#### SELLER PAGE VERIFIERS ####
	def verifySellerConfigurationModal
		if expect(sellerConfigurationModal.visible?).to eql true
			then
				sellerConfigurationModal.flash(color: ["yellow"])
				puts "#{true}: Displayed Columns Popup IS Displayed"
			else
				expect { raise StandardError, "Seller Configuration Modal NOT Displayed: Step FAILED"}.to raise_error('PLEASE VERIFY: Seller Configuration Modal NOT Displayed')
		end
	end
end
