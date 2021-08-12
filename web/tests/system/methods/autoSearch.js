import PageObjects from '../page-objects/page-objects'
import {getTextBySelector} from '../methods/getText'
import {clickBySelector} from '../methods/click'
import {countElements} from '../methods/elements'

const cssSelectorsList = new PageObjects()

export const autoSearchDepartment = async department => {
    let j
    let autoSearchResult = 0
    let searchTextResult
    let found
    autoSearchResult = await countElements('commonPage', 'autoSuggestionResult')
    if (autoSearchResult > 0) {
        for (j = 1; j <= autoSearchResult; j++) {
            searchTextResult = cssSelectorsList.pageObjects.commonPage.selectors.autoSuggestionOption.replace(
                /[0-9]/g,
                `${j}`
            )
            found = await getTextBySelector(searchTextResult)
            if (found.trim() === department) {
                await clickBySelector(searchTextResult)
                break
            }
        }
    }
}

export const autoSearchProduct = async option => {
    let j
    let autoSearchResult = 0
    let searchTextResult
    let found
    autoSearchResult = await countElements('commonPage', 'autoSuggestAll')
    if (autoSearchResult > 0) {
        for (j = 1; j <= autoSearchResult; j++) {
            searchTextResult = cssSelectorsList.pageObjects.commonPage.selectors.autoSuggestSelect.replace(
                /[0-9]/g,
                `${j}`
            )
            found = await getTextBySelector(searchTextResult)
            if (found.trim().includes(option)) {
                await clickBySelector(searchTextResult)
                break
            }
        }
    }
}
