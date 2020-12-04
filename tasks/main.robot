***Settings***
Documentation           Gnucash automation example.
...                     Showcases different methods of utilizing
...                     image/character recognition based automation.
Variables               settings.py
Library                 RPA.Desktop
Library                 GnucashLibrary.py
Resource                gnucash.robot
Suite Setup             Open Gnucash
Suite Teardown          Close Gnucash


*** Tasks ***
Create Account
    Open Create New Account Form
    Fill Data
    Click Cancel

Get Assets Sum
    ${sum}=             GnucashLibrary.Get Net Assets
    Log                 ${sum}
