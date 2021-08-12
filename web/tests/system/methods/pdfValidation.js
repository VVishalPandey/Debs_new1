import {client} from 'nightwatch-cucumber'
import rp from 'request-promise-native'
import pdf from 'pdf-parse'

let result

export const isPDF = async buffer => {
    return pdf(buffer).then(
        data => {
            return {isPDF: true, info: data.info}
        },
        err => {
            console.log('error in pdf is ==>', err)
            return {isPDF: false, info: null}
        }
    )
}

export const testPDFCheck = async url => {
    const pdfBuffer = await rp({uri: url, encoding: null})
    result = await isPDF(pdfBuffer)
    console.log(`Is PDF result: (${url}): `, result)
}

export const validatePdf = async text => {
    let newUrl
    await client.assert.urlContains('.pdf')
    await client.url(result => {
        newUrl = result.value
    })
    await testPDFCheck(newUrl)
    await client.assert.equal(result.info.Title, text)
}
