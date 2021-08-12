/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */
/* Copyright (c) 2017 Mobify Research & Development Inc. All rights reserved. */
/* * *  *  * *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * */

import 'raf/polyfill' // fix requestAnimationFrame issue with polyfill
import Enzyme from 'enzyme'
import Adapter from 'enzyme-adapter-react-16'
import $ from '../app/static/js/jquery.min.js'

Enzyme.configure({adapter: new Adapter()})

// Parser tests need to be supplied a selector library
global.$ = $
// Prevents a console.error when using asset-utils/getAssetUrl in tests
global.document.head.innerHTML = '<head><script src="https://localhost:8443/loader.js"></script></head>'

// Mocking `uuid` method for snapshots as this returns random value
jest.mock('progressive-web-sdk/dist/utils/uuid-utils', () => {
    let i = 0
    return () => {
        return i++
    }
})

// set SSR related variables
global.Progressive = {
    isServerSide: true
}
