const previewUrl = 'https://go.mobify.com/debenhams-progressive/latest'

/* eslint-disable import/no-commonjs */
module.exports = {
    run(context) {
        return context.runWithDriver((driver) => {
            // Go to Go to Debenhams Progressive Latest URL
            return driver.get(previewUrl)
              .then(() => {
                  // we fetch the selenium webdriver from context
                  const webdriver = context.webdriver
                  // and get hold of some goodies we want to use
                  const until = webdriver.until
                  const By = webdriver.By

                  const previewBtn = driver.findElement(By.id('authorize'))
                  previewBtn.click()
                  // we wait for something on the page that verifies that we are enabled preview
                  return driver.wait(until.urlContains('www.debenhams.com'), 3000)
              })
        })
    }
}
