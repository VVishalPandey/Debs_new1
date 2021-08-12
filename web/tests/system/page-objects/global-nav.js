const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {}
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {}
} else {
    selectors = {
        // headerMenuText: '.u-justify-start >.c-button > div',
        headerMenuText: '.u-justify-start > .pw-button > .pw-button__inner',
        topMenuText: '.pw-nav-header__title',
        closeIcon: '.pw--icon-only',
        backOption: '.pw-nav-header button',
        navCloseIcon: '.t-navigation__close'
    }
}

const globalNav = function() {
    this.selectors = selectors
}

export default globalNav
