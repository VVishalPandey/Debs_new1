import {configure} from '@storybook/react'
import {addParameters} from '@storybook/client-api'
import '../app/stylesheet.scss'

// disable viewport by default
addParameters({
    viewport: {
        disable: true
    }
})

// automatically import all files ending in *.stories.js
configure(require.context('../app', true, /\.stories\.jsx?$/), module)
