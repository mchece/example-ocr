*** Keywords ***
Fill Data
    Fill Name               OCR testing
    ${region}=              Fill Code And Get Region    1337
    Fill Description        ${region}    Found by OCR and region locators
    Fill Notes              Next we'll find the cancel button by image template

Open Gnucash
    Open Application        ${GNUCASH_EXECUTABLE}
    Wait For Element        ocr:New  timeout=20

Close Gnucash
    [Documentation]         Close the application with internal
    ...                     hotkeys. This is better than calling
    ...                     `Close Application  <application>`.
    Press Keys              ctrl  q

Open Create New Account Form
    [Documentation]         Click button by label (OCR).
    Wait For element        ocr:New
    ${new_button_region}=   Find element     ocr:New
    Click                   ${new_button_region}
    Wait For element        ocr:New Account - <No name>

Fill Name
    [Documentation]         Type text. We know that the cursor is
    ...                     already in the right place here.
    [Arguments]             ${text}
    Type Text               ${text}

Fill Code and Get Region
    [Documentation]         Fill text by field label (OCR) and region,
    ...                     then return the region.
    [Arguments]             ${text}
    ${code_text_region}=    Find Element    ocr:Account code
    ${code_input_region}=   Move Region
    ...                     ${code_text_region}  500  0
    Click                   ${code_input_region}
    Type Text               ${text}
    [Return]                ${code_input_region}

Fill Description
    [Documentation]                 Fill text by known region.
    [Arguments]                     ${region}  ${text}
    ${description_input_region}=    Move Region
    ...                             ${region}  0  70
    Click                           ${description_input_region}
    Type Text                       ${text}

Fill Notes
    [Documentation]         Fill text by field label (OCR) and offset.
    [Arguments]             ${text}
    Click With Offset       ocr:Notes  500  0
    Type Text               ${text}

Click Cancel
    [Documentation]     Click Cancel by image template.
    Click               image:resources/gnucash_newaccount_cancel_button.png
