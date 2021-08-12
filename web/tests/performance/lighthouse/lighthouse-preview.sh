#!/usr/bin/env bash
# Run the Lighthouse test against the dev build
# npm run test:pwa-preview

# Get Timestamp
# timestamp=`date +'%m-%d_%T'`

# Location to save the generated report.
OUTPUT_PATH=reports/lighthouse
# See package.json's siteUrl key.
URL=${1-$npm_package_siteUrl}
# Append Mobify Hash to the URL to force the Mobify Tag to load the local bundle.
PREVIEW=#mobify-override\&mobify-path=true\&mobify-url=https://localhost:8443/loader.js\&mobify-global=true\&mobify-domain=\&mobify-all=true\&mobify=1\&mobify-debug=1\&mobify-js=1

# Make Folder Structure
echo "checking folder structure for light house"

if [[ ! -d "$OUTPUT_PATH" ]]
then
        if [[ ! -L $OUTPUT_PATH ]]
        then
                echo "Directory doesn't exist. Creating now"
                mkdir -p $OUTPUT_PATH
                echo "Directory created"
        else
                echo "Directory exists"
        fi
fi
# Lighthouse uses your local installation of Chrome, which should be at least
# version 54.0. Use a custom user agent containing "MobifyPreview" so that
# Preview will accept our requests, and disable device emulation so that the
# "MobifyPreview" user agent does not get overridden.

# Note that we _must_ use a full, valid, mobile user agent string and append
# "MobifyPreview" to that, or else the v8 tag and loader.js will not treat
# it as a supported browser.

# Also note that we use a non-iOS user agent, because recent versions (11.4)
# has issues with Service Workers, so we want to stick with Android until iOS
# issues are resolved. See here for details:
# https://github.com/mobify/platform-scaffold/pull/1416

# Shh... the user agent really should have spaces, but right now Lighthouse
# handles spaces really poorly (ie, it doesn't).  So we smash them together
# and move on.
CHROME_FLAGS="--user-agent=\"MobileMobifyPreview\" --allow-insecure-localhost --ignore-certificate-errors --window-size=412,800"

HEADLESS=""

# Comparing ${3-default} variable value
if [[ "${3-default}" == "headless" ]] ; then
    HEADLESS="--headless"
fi

# Finally, parse the HTML report for the Lighthouse score.
# CI will fail the build if the score is below a threshold.
# See min_lighthouse_score in package.json

# --ignore-certificate-errors thanks to https://github.com/GoogleChrome/lighthouse/issues/559
lighthouse "${URL}${PREVIEW}" \
	--quiet \
	--chrome-flags="$HEADLESS $CHROME_FLAGS" \
	--output json \
	--output html \
	--output-path ${OUTPUT_PATH}/audit-preview-${2-default} \
	--disable-device-emulation=true \
	 > /dev/null 2>&1

# Verify the Lighthouse score against min_lighthouse_score
npm run test:check-lighthouse-score ${OUTPUT_PATH}/audit-preview-${2-default}.report.json
echo "Report located in:" $OUTPUT_PATH/audit-preview-${2-default}.report.html

# Sync the Lighthouse score to InfluxDB
npm run test:sync-lighthouse-score $OUTPUT_PATH/audit-preview-${2-default}.report.json development
