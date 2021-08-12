This readMe is related to automation work and scripts.

1. TEST_DATA_SET:

    a.  Mobile TEST_DATA_SET: UK, ROI, INT,PREPROD-UK
    b.  Tablet TEST_DATA_SET: TABLET, TABLET-ROI, TABLET-INT, PREPROD-TABLET
    c.  Desktop TEST_DATA_SET: DESKTOP, DESKTOP-ROI, DESKTOP-INT,PREPROD-DESKTOP, CCC-DESKTOP, CCC-DESKTOP-ROI


2. TEST_PROFILE:

    a.  local - to run scripts on local code hittonh localhost:3443
    b.  prodToBe - to run scripts on evcert environment
    c.  bundleUat1 - to run scripts on uat-1 environment
    d.  bundleUat2 - to run scripts on uat-2 environment (which is pointing ot PREPROD or wcs-test.debenhams.com)


3.  TAG:
    a.  Sanity E2E TAG - automatedSanity
    b.  Regression TAG - automatedSanity
    c.  payment/order confirmation on alpha - automatedPayment


3. COMMAND FOR RUNNING THE SCRIPTS:

    a.  DESKTOP command to Run:
        TEST_PROFILE="prodToBe" TEST_DATA_SET="DESKTOP-INT" TAG="automatedSanity" npm run test:automation

    b.  APPIUM comamnd to Run:
        TEST_PROFILE="bundleUat1" TEST_DATA_SET="UK" TAG="aip" npm run test:appium_android

    c.  DESKTOP BROWSER command to Run:
        TEST_PROFILE="prodToBe" TEST_DATA_SET="DESKTOP-INT" TAG="automatedSanity" npm run test:automation-safari

    d.  DESKTOP PARALLEL command to Run:
        TEST_PROFILE="prodToBe" TEST_DATA_SET="DESKTOP-INT" TAG="automatedSanity" npm run test:automation-multi

    ** PLEASE NOTE AFTER ALL CONFIG CHANGES MERGED BELOW IS THE NEW COMMAND FOR RUNNIG SCRIPTS **

        TEST_PROFILE="bundleUat1" TEST_DATA_SET="DESKTOP" TAG="aip" INSTANCE="deviceAndroid3" npm run test:automation
        TEST_PROFILE="bundleUat1" TEST_DATA_SET="DESKTOP" TAG="aip" INSTANCE="chrome" npm run test:automation
        TEST_PROFILE="bundleUat1" TEST_DATA_SET="DESKTOP" TAG="aip" INSTANCE="safari" npm run test:automation
        TEST_PROFILE="bundleUat1" TEST_DATA_SET="DESKTOP" TAG="aip" INSTANCE="safari,firefox,chrome" npm run test:automation


4.  LOCAL GRID SETUP
    
    Step 1: Create duplicate instances of selenium-server-standalone-3.4.0 jar as selenium-server-standalone-3.4.0.1, selenium-server-standalone-3.4.0.2 and selenium-server-standalone-3.4.3 in folder ./node_modules/selenium-server-standalone-jar/jar
    Step 2: Create duplicate instances of:
        - chromedriver as (chromedriver1, chromedriver2 and chromedrive3) in folder ./node_modules/nightwatch-commands/selenium/drivers/chromedriver
        - geckodriver as (geckodriver1, geckodriver2 and geckodriver3) in folder ./node_modules/geckodriver/geckodriver
    Step 3: Start the hub by running below command on terminal
        - Chrome:
            java -Dwebdriver.chrome.driver=./node_modules/nightwatch-commands/selenium/drivers/chromedriver  -jar ./node_modules/selenium-server-standalone-jar/jar/selenium-server-standalone-3.4.0.jar
        - Firefox:
            java -Dwebdriver.gecko.driver=./node_modules/geckodriver/geckodriver  -jar ./node_modules/selenium-server-standalone-jar/jar/selenium-server-standalone-3.4.0.jar
    Step 4: While running the scripts pass an additional parameter GRID="TRUE" so that the DESKTOP test scripts can run on the node


5.  ADDING CHROMEDRIVER FOR APPIUM

    Step 1: Install the required chrome driver from https://sites.google.com/a/chromium.org/chromedriver/downloads
    Step 2: Copy the chromedriver binary to /usr/local/bin
    Step 3: Update the chromedriver binary path in nightwatch-config device configuration "chromedriverExecutable"


6.  ADDING THE STEPS TO CONNECT REAL DEVICES OVER WIFI USING ADB

    Step 1: Connect the device to machine using USB
    Step 2: Run the command adb usb in web directory of the terminal
    Step 3: Run the command adb kill-server
    Step 4: Now assign the unique port adb -d tcpip 5555
    Step 5: Fetch the IP from the device you want to build a TCPIP connection E.g :- adb connect 192.168.226.138:5554
    Step 6: Remove the USB
    Step 7: Run the command adb devices in web directory of the terminal and verify device connected is via IP
 

7. RUNNING TEST ON SAFARI BROWSER

   Step 1: Enable the browser by running the command in terminal "/usr/bin/safaridriver --enable"
