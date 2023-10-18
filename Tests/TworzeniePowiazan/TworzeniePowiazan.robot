*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${urlLoginBaseliner}  https://login.baselinker.com/
${loginBaselinker}  AutomatUipath

*** Keywords ***
Click Element With Timeout
    [Arguments]    ${locator}    ${timeout}=20s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}
Open And Login Baselinker
	Open Browser    ${urlLoginBaseliner}  Chrome
	Maximize Browser Window
	Input Text    //*[@id="loginField"]    ${loginBaselinker}
	Input Password    //*[@id="passwordField"]    Lewapek200!
	Click Element   //*[@id="signinButton"]
	Wait Until Page Contains Element  //*[@id="login-name"]  25s  ${loginBaselinker}
Check Is Have Connection To Create
	Go To    https://panel-e.baselinker.com/inventory_products.php
	Click Element With Timeout  //*[@id="table_inventory_products_container-filters-btn"]
	Click Element With Timeout  //*[@id="table_inventory_products_containerViewsDropdown"]
	Click Element With Timeout  //*[@id="table_inventory_products_container_view_1374"]/a
	Wait Until Element Does Not Contain    //*[@class="lds-ellipsis"]  15s
	${elementVisible}=  Run Keyword And Return Status  Page Should Contain Element  //*[@id="inventoryDropdownOperations"]
	RETURN  ${elementVisible}
	Log To Console    ${elementVisible}


*** Test Cases ***
Tworzenie Powiazan
	[Documentation]     Tworzenie Powiazan
	Open And Login Baselinker
	${elementVisible} =  Check Is Have Connection To Create
	Run Keyword If    ${elementVisible}  Click Element With Timeout  //*[@id="inventoryDropdownOperations"] 15s
	Sleep    15s







