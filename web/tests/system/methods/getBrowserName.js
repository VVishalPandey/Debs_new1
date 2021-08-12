export const getBrowserName = async () => {
    const argments = process.argv
    const argumentsString = argments.toString()
    const parts = argumentsString.split('-e')
    const secondPart = parts[1]
    const partsArray = secondPart.split(',')
    const browser = partsArray[1]
    return browser
}
