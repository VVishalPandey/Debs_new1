const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        heroImageContainer: '.t-home__uber-component--top-hero',
        offersComponentHome: '.hp-offers-spotlight-sale-wrapper',
        uberComponentContainer:
            '.hp-hero-banner-a .t-home__uber-component-container'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        heroImageContainer: '.hp-hero-banner-a',
        offersComponentHome: '.hp-offers-spotlight-sale-wrapper',
        uberComponentContainer:
            '.hp-hero-banner-a .t-home__uber-component-container'
    }
} else {
    selectors = {
        heroImageContainer: '.hp-hero-banner-a',
        offersComponentHome: '.hp-offers-spotlight-sale-wrapper',
        uberComponentContainer:
            '.hp-hero-banner-a .t-home__uber-component-container'
    }
}

const home = function() {
    this.selectors = selectors
}

export default home
