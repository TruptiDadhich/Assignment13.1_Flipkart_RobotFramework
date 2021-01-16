*** Settings ***
Resource  ../Operational/testinstructions.robot
Resource  ../Operational/testvariables.robot


#robot -d results TestsBook/TestCases.robot  


*** Test Cases ***
User should be able to Land on Flipkart Page 
    [Tags]    sanity
    Open Flipkart
    Login in Flipkart
    
Scenario 1: Selecting device of any electronics accessories and adding to Cart
    Navigate to category 'Electronics'
    Search and select for the sub category
    Select desire device from list
    Click on device and add to cart

Scenario 2: Verifying if the added item is available in the Cart
    Verify expected item in the Cart
    
