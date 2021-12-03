require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module FilesPage
	include RSpec::Matchers
	include Selenium

	#### METHODS / LOCATORS ####
	def filesVerificationAcessTextField
		@browser.text_field(id: 'VerifyAccess-Text')
	end

	def filesCommandMenuLinks(string)
		@browser.element(xpath: "//*[@id='Command-Menu']//*[text()='#{string}']")
	end

	def filesAccountMenuLinks(string)
		@browser.element(xpath: "//*[@id='Command-Menu-Account']//*[text()='#{string}']")
	end
end
