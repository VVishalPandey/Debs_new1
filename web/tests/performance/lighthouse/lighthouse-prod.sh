#!/usr/bin/env bash
# npm run test:pwa-prod

# Get Timestamp
# timestamp=`date +'%m-%d_%T'`

OUTPUT_PATH=reports/lighthouse


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


# See package.json's siteUrl key.
URL=${1-$npm_package_siteUrl}
HEADLESS=""

# Comparing ${3-default} variable value
if [[ "${3-default}" == "headless" ]] ; then
    HEADLESS="--headless"
fi

lighthouse \
	--chrome-flags="$HEADLESS --window-size=412,800" \
	--config-path tests/performance/lighthouse/prod-lighthouse-config.js \
	--quiet \
	--output json \
	--output html \
	--output-path $OUTPUT_PATH/audit-prod-${2-default} \
	$URL

# Verify the Lighthouse score against min_lighthouse_score
npm run test:check-lighthouse-score $OUTPUT_PATH/audit-prod-${2-default}.report.json
echo "Report located in:" $OUTPUT_PATH/audit-prod-${2-default}.report.html

# Sync the Lighthouse score to InfluxDB
npm run test:sync-lighthouse-score $OUTPUT_PATH/audit-prod-${2-default}.report.json production
