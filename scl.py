import platform
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from webdriver_manager.chrome import ChromeDriverManager
import time

# Get chrome driver base on current platform
def getChromeDriver():
    osType = platform.system()

    # Enable Performance Logging of Chrome.
    desired_capabilities = DesiredCapabilities.CHROME
    desired_capabilities["goog:loggingPrefs"] = {"performance": "ALL"}
    capabilities = DesiredCapabilities.CHROME
    
    # Create the webdriver object and pass the arguments
    options = webdriver.ChromeOptions()

    if osType == 'Linux':
        options.add_argument('headless')
        options.add_argument('--no-sandbox')
        # options.add_argument('--disable-dev-shm-usage')
        options.add_argument("--ignore-certificate-errors")
        options.add_argument('--ignore-ssl-errors')
        options.add_argument('--mute-audio')
        options.page_load_strategy = 'none'

        driver = webdriver.Chrome(
            '/usr/bin/chromedriver',
            desired_capabilities=capabilities,
            chrome_options=options
        )
        return driver
    elif osType == 'Darwin':
        # options.add_argument('headless')
        options.add_argument("--ignore-certificate-errors")
        options.add_argument('--ignore-ssl-errors')
        options.add_argument('--mute-audio')
        options.page_load_strategy = 'none'

        driver = webdriver.Chrome(
            ChromeDriverManager().install(),
            desired_capabilities=capabilities,
            options=options
        )
        return driver
    else:
        # Windows
        options.add_argument('headless')
        options.add_argument("--ignore-certificate-errors")
        options.add_argument('--ignore-ssl-errors')
        options.add_argument('--mute-audio')
        options.add_argument("--log-level=OFF")
        options.page_load_strategy = 'none'

        driver = webdriver.Chrome(
            ChromeDriverManager().install(),
            desired_capabilities=capabilities,
            chrome_options=options
        )
        return driver


### Get page source
def getPageSource(link):
    driver = getChromeDriver()
    driver.get(link)
    time.sleep(10)

    for i in range(4):
        try:
            buttonLoadMore = driver.find_element('xpath', '//*[@id="content"]/div/div[3]/div[1]/div/div[2]/div[2]/div/div[2]/div/ul/li[1]')
            buttonLoadMore.click()
            time.sleep(10)
        except Exception as e:
            print(e)
            pass
            # break
    
    time.sleep(500)
    return driver.page_source



def main():
    link = "https://soundcloud.com/ilyanaazman/sets/bestoftrapnation"
    getPageSource(link)


main()