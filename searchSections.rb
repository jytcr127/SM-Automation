require 'page-object'

class SearchSections 

    include PageObject

    def searchMusicians
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    sleep 2
   driver.find_element(xpath:'//*[@id="header"]/div/div/ul/li[1]/a').click
    headliner = driver.find_element(xpath: '/html/body/div/div[2]/div/div[2]/div/div[1]/div/h2').text
    return headliner
    end

    def searchActors
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    sleep 2
   driver.find_element(xpath:'//*[@id="header"]/div/div/ul/li[2]/a').click
    headliner = driver.find_element(xpath: '/html/body/div/div[2]/div/div[2]/div/div[1]/div/h2').text
    return headliner
    end

    def searchEntertainers
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    sleep 2
   driver.find_element(xpath:'//*[@id="header"]/div/div/ul/li[3]/a').click
    headliner = driver.find_element(xpath: '/html/body/div/div[2]/div/div[2]/div/div[1]/div/h2').text
    return headliner
    end
end