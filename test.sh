import pytest
import time
from selenium import webdriver

chrome_path = "/Users/jao/Documents/Projetos/Automation-Python/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing"

chrome_options = webdriver.ChromeOptions()
chrome_options.binary_location = chrome_path
driver = webdriver.Chrome(options=chrome_options)


url = "https://www.example.com"

driver.get(url)
time.sleep(5)  # Wait for the page to load