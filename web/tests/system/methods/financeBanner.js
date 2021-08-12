import {client} from 'nightwatch-cucumber'
import {clickBySelector} from './click'
import {getText, getTextBySelector} from './getText'
import {countElements} from './elements'
import testData from '../test-data'
import {goBack} from '../methods/navigateBack'

export const getFinanceBannerDate = async () => {
    const todaysDate = new Date().getTime()

    const recruitmentFinanceBannerTestDate1 = new Date(
        testData.recruitmentFinanceBannerTestDate1
    ).getTime()
    const recruitmentFinanceBannerTestDate2 = new Date(
        testData.recruitmentFinanceBannerTestDate2
    ).getTime()
    const recruitmentFinanceBannerTestDate3 = new Date(
        testData.recruitmentFinanceBannerTestDate3
    ).getTime()
    const recruitmentFinanceBannerTestDate4 = new Date(
        testData.recruitmentFinanceBannerTestDate4
    ).getTime()
    const recruitmentFinanceBannerTestDate5 = new Date(
        testData.recruitmentFinanceBannerTestDate5
    ).getTime()
    const recruitmentFinanceBannerTestDate6 = new Date(
        testData.recruitmentFinanceBannerTestDate6
    ).getTime()

    const privateFinanceBannerTestDate1 = new Date(
        testData.privateFinanceBannerTestDate1
    ).getTime()
    const privateFinanceBannerTestDate2 = new Date(
        testData.privateFinanceBannerTestDate2
    ).getTime()
    const privateFinanceBannerTestDate3 = new Date(
        testData.privateFinanceBannerTestDate3
    ).getTime()
    const privateFinanceBannerTestDate4 = new Date(
        testData.privateFinanceBannerTestDate4
    ).getTime()
    const privateFinanceBannerTestDate5 = new Date(
        testData.privateFinanceBannerTestDate5
    ).getTime()
    const privateFinanceBannerTestDate6 = new Date(
        testData.privateFinanceBannerTestDate6
    ).getTime()

    if (
        (todaysDate > recruitmentFinanceBannerTestDate1 &&
            todaysDate < recruitmentFinanceBannerTestDate2) ||
        (todaysDate > recruitmentFinanceBannerTestDate3 &&
            todaysDate < recruitmentFinanceBannerTestDate4) ||
        (todaysDate > recruitmentFinanceBannerTestDate5 &&
            todaysDate < recruitmentFinanceBannerTestDate6)
    ) {
        return 'RB'
    } else if (
        (todaysDate > privateFinanceBannerTestDate1 &&
            todaysDate < privateFinanceBannerTestDate2) ||
        (todaysDate > privateFinanceBannerTestDate3 &&
            todaysDate < privateFinanceBannerTestDate4) ||
        (todaysDate > privateFinanceBannerTestDate5 &&
            todaysDate < privateFinanceBannerTestDate6)
    ) {
        return 'PB'
    } else {
        return 'SB'
    }
}

export const financeBannerCalculation = async bannerType => {
    let totalFinanceBannerDisAmt = 0
    let currentProduct = 1
    let priceOfProducttemp
    let priceOfProduct
    let discountPercentage = 0

    const productsCount = await countElements('myBagPage', 'ProductPrice')
    while (currentProduct <= productsCount) {
        const priceSelector = `.dbh-product-list .c-product-item:nth-child(${currentProduct}) .dbh-product-price .inline-price`
        priceOfProducttemp = await getTextBySelector(priceSelector)
        if (priceOfProducttemp.toUpperCase() !== 'FREE') {
            const discountOnProductSelector = `.dbh-product-list .c-product-item:nth-child(${currentProduct}) .dbh-product-price .discounted-section .u-color-error`
            const discountOnProduct = await getTextBySelector(
                discountOnProductSelector
            )
            if (bannerType === 'RB' || bannerType === 'PB') {
                const imageSelector = `.dbh-product-list .c-product-item:nth-child(${currentProduct}) .dbh-product-image`
                if (discountOnProduct !== '') {
                    priceOfProduct =
                        priceOfProducttemp.split('£')[1] -
                        discountOnProduct.split('£')[1]
                } else {
                    priceOfProduct = priceOfProducttemp.split('£')[1]
                }
                await clickBySelector(imageSelector)
                await client.pause(testData.implicitTimeOut)
                const productNumber = await getText(
                    'prodDescItemNumber',
                    'pdpPage'
                )
                const consessionProductSkuAray =
                    testData[bannerType.concat('ConcessionProductSkuStart')]
                const nonConsessionProductSkuAray =
                    testData[bannerType.concat('NonConcessionProductSkuStart')]
                let skuMatched = false
                let skuListInNumber = 0
                while (
                    skuMatched !== true &&
                    skuListInNumber < consessionProductSkuAray.length
                ) {
                    if (
                        productNumber.startsWith(
                            consessionProductSkuAray[skuListInNumber]
                        )
                    ) {
                        skuMatched = true
                        discountPercentage = testData.financeBannerOfferDis
                        break
                    } else {
                        skuListInNumber++
                    }
                }
                skuListInNumber = 0
                while (
                    skuMatched !== true &&
                    skuListInNumber < nonConsessionProductSkuAray.length
                ) {
                    if (
                        productNumber.startsWith(
                            nonConsessionProductSkuAray[skuListInNumber]
                        )
                    ) {
                        skuMatched = true
                        discountPercentage = testData.financeBannerNormalDis
                        break
                    } else {
                        skuListInNumber++
                    }
                }
                await goBack()
                await client.pause(testData.implicitTimeOut)
                totalFinanceBannerDisAmt =
                    Number(totalFinanceBannerDisAmt) +
                    (Number(priceOfProduct) * Number(discountPercentage)) / 100
            } else {
                if (discountOnProduct !== '') {
                    priceOfProduct =
                        priceOfProducttemp.split('£')[1] -
                        discountOnProduct.split('£')[1]
                } else {
                    priceOfProduct = priceOfProducttemp.split('£')[1]
                }
                discountPercentage = testData.financeBannerNormalDis
                totalFinanceBannerDisAmt =
                    Number(totalFinanceBannerDisAmt) +
                    (Number(priceOfProduct) * Number(discountPercentage)) / 100
            }
        }
        currentProduct++
    }
    await client.pause(testData.implicitTimeOut)
    totalFinanceBannerDisAmt = totalFinanceBannerDisAmt.toFixed(2)
    return totalFinanceBannerDisAmt
}
