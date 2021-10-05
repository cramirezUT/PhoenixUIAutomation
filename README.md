# PhoenixUIAutomation

## Prerequisites for mac

You need to have the following installed to run RSpec specs(Tests)

* Ruby version 2.6.3 *requried, => for the Ruby libraries to create and edit tests

* RSpec gem *requiredd => For asserts and validation

* Watir gem *requiredd

* Selenium Webdriver *requiredd => to interact with browsers pages

* Chromdriver *requried => for Chrome browser 

* Geckodriver => for Firefox browser

Easiest way is through Hombrew and RVM

### 1. Install Homebrew

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### 2. Install RVM

`\curl -sSL https://get.rvm.io | bash`

## Install Ruby Gems
From terminal: 

root directory - **PhoenixUIAutomations:$** 

`gem install watir` *requried

`gem install rspec` *requried

`rvm pkg install openssl`

`rvm install 2.6.3 --with-openssl-dir=$HOME/.rvm/usr`

Then you need to run :$ `bundle install` to have all the required gems installed

## Install Selenium WebDriver
*requried

Go to: https://www.seleniumhq.org/projects/webdriver/

On the right of the page there is a "Download Selenium" button click it to download

## Install Chromedriver via brew 

root directory - **PhoenixUIAutomation:$** 

`brew install chromedriver` *requried

Next run **PhoenixUIAutomations:$** 

`which chromedriver`

You should see a path similar to this => ` /usr/local/bin/chromedriver`

## Install Firefoxdriver via tar.qz file

Go to: https://github.com/mozilla/geckodriver/releases

Abut halfway down the page look for `geckodriver-v0.30.0-macos.tar.gz` click on it to download
or 
Abut halfway down the page look for `geckodriver-v0.30.0-win64.zip` click on it to download

## Ready to run automation suite

**Running a single test:**

from the root directory only PhoenixUIAutomation, run the following command: 

`app_type=browser browser_type=chrome bundle exec rspec features/support/automation/<the_test_number_you_wish_to_run>`

**Running all tests in suite:**

from the root directory only PhoenixUIAutomation, run the following command: 

`app_type=browser browser_type=chrome bundle exec rspec features/support/automation/*`

**Running all tests in with a specific tag e.g. "smoke":**

from the root directory only PhoenixUIAutomation, run the following command: 

`app_type=browser browser_type=chrome bundle exec rspec --tag smoke features/support/automation/*`

