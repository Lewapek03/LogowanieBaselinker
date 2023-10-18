*** Settings ***
Library    SeleniumLibrary
*** Tasks ***
Pierwszty
	Open Browser    https://rpachallengeocr.azurewebsites.net/  chrome
	Sleep    5s
	Click Button    //*[@id="start"]
	Sleep    2s

