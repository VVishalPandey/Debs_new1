const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {}
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        title: '.dbh-tablet-my-account-details h2',
        totalOrders: '.dbh-tablet-my-account-details p',
        returnInfoLink: '.dbh-returns-info-link',
        trackOrderLink: '.dbh-track-order-link',
        orderDetailsContainers: '.dbh-order',
        orderNumberText: '.dbh-order-no',
        lastOrderNumber: '.dbh-order-no span',
        lastOrderDateText: '.dbh-order-placed-date span:nth-child(1)',
        lastOrderDate: '.dbh-order-placed-date span:nth-child(2)',
        viewOrderDetailsLink: '.dbh-view-order-details',
        totalCost: '.dbh-order-total-price',
        noOrdersMessageContainer: '.dbh-no-orders-message',
        noOrdersMessage: '.dbh-no-orders-message p',
        startShoppingMessage: '.dbh-no-orders-message p.u-margin-center',
        goShoppingButton: '.dbh-continue-shopping',
        orderNumberDetails: '.dbh-order-no span:nth-child(2)',
        productDetails: '.dbh-product',
        productColor: '.dbh-color',
        productSize: '.dbh-size',
        productQuantity: '.dbh-quantity',
        subTotalText: '.dbh-summary div:nth-child(1) span:nth-child(1)',
        subTotalAmount: '.dbh-summary div:nth-child(1) span:nth-child(2)',
        deliveryText: '.dbh-summary div:nth-child(3) span:nth-child(1)',
        deliveryAmount: '.dbh-summary div:nth-child(3) span:nth-child(2)',
        discountText: '.dbh-summary div:nth-child(4) span:nth-child(1)',
        discountAmount: '.dbh-summary div:nth-child(4) span:nth-child(2)',
        totalText: '.dbh-summary div:nth-child(5) span:nth-child(1)',
        totalAmount: '.dbh-summary div:nth-child(5) span:nth-child(2)',
        orderPlaceText: '.dbh-delivery div:nth-child(1) span:nth-child(1)',
        orderPlaceDate: '.dbh-delivery div:nth-child(1) span:nth-child(2)',
        deliveryForText: '.dbh-delivery div:nth-child(2) span:nth-child(1)',
        deliveryForName: '.dbh-delivery div:nth-child(2) span:nth-child(2)',
        deliveryAddressText: '.dbh-delivery div:nth-child(3) span:nth-child(1)',
        deliveryAddress: '.dbh-delivery div:nth-child(3) span:nth-child(2)',
        deliveryMethodText: '.dbh-delivery div:nth-child(4) span:nth-child(1)',
        deliveryMethodSelected: '.dbh-delivery div:nth-child(4) span:nth-child(2)',
        trackOrderButton: '.dbh-track-btn',
        orderNumberInput: '.dbh-order-number input[name="customerOrderId"]',
        emailIdInput: 'input[name="emailAddr"]',
        postcodeInput: 'input[name="postCode"]',
        submitButton: '.dbh-track-order'
    }
} else {
    selectors = {}
}

const myOrders = function() {
    this.selectors = selectors
}

export default myOrders
