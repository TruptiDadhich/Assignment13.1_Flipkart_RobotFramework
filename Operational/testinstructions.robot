*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operational/testinstructions.robot
Resource  ../Operational/testvariables.robot

*** Keywords ***
Open Flipkart
    Open Browser  ${url_flipkart}  ${brows}   
    Maximize Browser Window
    sleep  4s
    Log to Console  Step1

Login in Flipkart
    ${Phone_Number}  Set Variable  xpath=//input[@class='_2IX_2- VJZDxU']
    input text  ${Phone_Number}  ${number}
    ${Password}  Set Variable  xpath=//input[@class='_2IX_2- _3mctLh VJZDxU']
    input text  ${Password}  ${pass}
    Click Element  xpath=//div[@class="_1D1L_j"]/button
    Log to Console  Step2

Navigate to category 'Electronics'    
    ${category_count} =  Get Element Count  xpath=//div[@class='_1kidPb']/span
    sleep  3s
    FOR  ${i}  IN RANGE  1  ${category_count}
        ${dynamic_categ_name} =  Get Text  xpath=//div[@class='_1kidPb']/span[${i}]
        Exit For Loop If  "${dynamic_categ_name}" == "${Item_category}"
    END
    Mouse Over  xpath=//div[@class='_1kidPb']/span[${i}]
    Log to Console  Step3

Search and select for the sub category
    ${sub_list} =  Get Element Count  xpath=//div[@class='_1fwVde'][1]/a
    #Log to Console  ${sub_list}
    FOR  ${j}  IN RANGE  2  ${sub_list}
    ${sub_names} =  Get Text  xpath=//div[@class='_1fwVde'][1]/a[${j}]
    #Log to Console  ${sub_names}
    Exit For Loop If  "${sub_names}" == "${Item_subCat_Name}"
    END
    Click Element  xpath=//div[@class='_1fwVde'][1]/a[${j}]
    Log to Console  Step4

Select desire device from list
    sleep  4s
    ${dev_Count} =  Get Element Count  xpath=//div[@class='E2-pcE _1q8tSL']/div
    #Log to Console  ${category_count}
    sleep  4s
    FOR  ${j}  IN RANGE  2  ${dev_Count}
    ${dynamic_categ_name} =  Get Text  xpath=//div[@class='E2-pcE _1q8tSL']/div[${j}]/div/div/div/a/div[2]/div[1]/div[1]
    Exit For Loop If  "${dynamic_categ_name}" == "${device_Name}"
    END
    sleep  3s
    Click Element  xpath=//div[@class='E2-pcE _1q8tSL']/div[${j}]/div/div/div/a/div[2]/div[1]/div[1]
    Log to Console  ${dev_Count}
    Log to Console  Step5

Click on device and add to cart 
    Select Window  ${Expected_Site_Name}  
    Click Element  xpath=//button[@class='_2KpZ6l _2U9uOA _3v1-ww']
    sleep  5s
    Log to Console  Step6

Verify expected item in the Cart
    Click Element  xpath=//img[@class='_2xm1JU']
    sleep  2s
    Click Element  xpath=//div[@class='_2Xfa2_']/div[5]
    sleep  3s
    ${item_name} =  Get Text  xpath=//div[@class='_2nQDXZ']/div[1]/div/a
    Run Keyword If  "${device_Name}" == "${item_name}"  Close Browser 

    Log to Console  ${item_name}
    Log to Console  Step7


