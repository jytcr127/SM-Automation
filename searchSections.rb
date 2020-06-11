require 'page-object'

#test 5 variables
$optionsMenu = '/html/body/div[2]/div[1]/div/div/a[2]'
$musicVideoOption = '/html/body/div[2]/div[1]/div/div/div[2]/ul/li[1]/a'

#test 6 variables
$groupDropdownButton = '/html/body/div/div[2]/div[1]/div[2]/div/div[2]/ul/li/div/a'
$groupToClick = '/html/body/div/div[2]/div[1]/div[2]/div/div[2]/ul/li/div/div/div[1]/div[6]/a'
$musicVideoToClick = '/html/body/div/div[2]/div[1]/div[2]/div/ul/li[1]/a/span[1]/span'
$musicVideoLoaded = '/html/body/div/div[2]/div[2]'




class SearchSections 

    include PageObject

    def searchMusicians
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
   driver.find_element(xpath:'//*[@id="header"]/div/div/ul/li[1]/a').click
    headliner = driver.find_element(xpath: '/html/body/div/div[2]/div/div[2]/div/div[1]/div/h2').text
    return headliner
    end

    def searchActors
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(xpath:'//*[@id="header"]/div/div/ul/li[2]/a').click
    headliner = driver.find_element(xpath: '/html/body/div/div[2]/div/div[2]/div/div[1]/div/h2').text
    return headliner
    end

    def searchEntertainers
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(xpath:'//*[@id="header"]/div/div/ul/li[3]/a').click
    headliner = driver.find_element(xpath: '/html/body/div/div[2]/div/div[2]/div/div[1]/div/h2').text
    return headliner
    end

    def searchGroup
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(class: 'btn_search').click
    driver.find_element(class: 'input_search').send_keys('nct')
    driver.find_element(class: 'input_search').send_keys :return
    groupname = driver.find_element(class: 'title').text
    return groupname
    end

    def searchMusicVideo
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/'
    driver.find_element(xpath: $optionsMenu).click
    driver.find_element(xpath: $musicVideoOption).click
    headertitle = driver.find_element(class: 'title2').text 
    return headertitle
    end

    def loadMusicVideo
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://www.smtown.com/mv'
    driver.find_element(xpath: $groupDropdownButton).click
    wait = Selenium::WebDriver::Wait.new(timeout: 50) # seconds
    wait.until { driver.find_element(xpath: $groupToClick).displayed?}
    driver.find_element(xpath: $groupToClick).click
    driver.find_element(xpath: $musicVideoToClick).click
    return driver.find_element(xpath: $musicVideoLoaded).displayed?
    end
end

