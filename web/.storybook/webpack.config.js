const path = require('path')
const resolve = dir => path.resolve(__dirname, dir)

// Export a function. Accept the base config as the only param.
module.exports = async ({config, mode}) => {
    // `mode` has a value of 'DEVELOPMENT' or 'PRODUCTION'
    // You can change the configuration based on that.
    // 'PRODUCTION' is used when building the static version of storybook.
    config.resolve = Object.assign(config.resolve, {
        alias: {
            components: resolve('../app/components'),
            containers: resolve('../app/containers'),
            utils: resolve('../app/utils'),
            'stub-connector': resolve(
                '../app/integration-manager/_stub-connector'
            ),
            'connector-extension': resolve('../app/connector-extension')
        }
    })

    // Make whatever fine-grained changes you need
    config.module.rules.push({
        test: /\.scss$/,
        use: ['style-loader', 'css-loader', 'sass-loader'],
        include: path.resolve(__dirname, '../')
    })

    // Return the altered config
    return config
}
