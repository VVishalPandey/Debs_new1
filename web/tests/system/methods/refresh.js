import {client} from 'nightwatch-cucumber'

export const pageRefresh = async () => {
    await client.execute(`location.reload()`)
}
