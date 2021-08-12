const testFeatureFile = process.env.TEST_DATA_SET || 'UK'

let selectors

if (testFeatureFile.includes('DESKTOP')) {
    selectors = {
        minibagCount: '.dbh-mini-bag-icon .pw-button__label',
        minibagProductCountOnHover: '.t-mini-cart__content .dbh-count',
        productMiniBag: '.dbh-product',
        productImg: '.dbh-product-img',
        productRemove: '.t-mini-cart__product-remove.dbh-product-remove',
        minibagHeader: '.dbh-heading .dbh-title',
        miniBagClose: 'button.t-mini-cart__popover-carousel-close',
        emptyCartMiniBagMessage:
            '.t-mini-cart__popover-carousel-mask empty p.t-mini-cart__empty-label',
        productPrice: '.dbh-product-price',
        miniCartBagButton: '.dbh-cart-btn.c--secondary',
        miniCartCheckoutButton: '.dbh-cart-btn.c--primary',
        productTitle: '.t-mini-cart__product-title.dbh-product-title',
        firstProductRemove:
            '.dbh-product-list div .t-mini-cart__product:nth-child(1) .dbh-product-remove-btn',
        emptyBagMessage: '.t-mini-cart__empty-title.u-margin-bottom-md'
    }
} else if (testFeatureFile.includes('TABLET')) {
    selectors = {
        minibagCount: '.dbh-mini-bag-icon .t-header__button-icon-count',
        minibagCountNew: 'button > span.rm-bt-number',
        secureCheckoutButton: '.dbh-cart-btn',
        closeButton: '.dbh-header-bar .pw-header-bar div:nth-of-type(5) button',
        colourName: 'span.dbh-option',
        firstProductTitle:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content > h2',
        firstProductQuantity:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content > div.u-text-quiet',
        firstProductPrice:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content > div.u-text-weight-bold',
        firstProductColor:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content>div>span:nth-child(2)> span:nth-child(1)',
        firstProductSize:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content>div>span:nth-child(1)> span:nth-child(1)',
        subTotal: '.t-mini-cart__subtotal>div.u-text-align-center.u-width-full',
        secondProductImage:
            '.t-mini-cart__product:nth-child(2) div:nth-child(1).pw-image.pw--is-loaded > img.pw-image__tag',
        secondProductTitle:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content > h2',
        secondProductQuantity:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content > div.u-text-quiet',
        secondProductPrice:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content > div.u-text-weight-bold',
        secondProductColor:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content>div>span:nth-child(2)> span:nth-child(1)',
        secondProductSize:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content>div>span:nth-child(1)',
        secondProductRemove:
            '.dbh-product-list div .t-mini-cart__product:nth-child(2) .dbh-product-remove-btn',
        removeConfirm: '.c-notification-error__msg',
        miniCartComponent: '.t-mini-cart__content',
        emptyBagMessage: '.t-mini-cart__empty-title.u-margin-bottom-md',
        totalRemoveProductIcon: '.dbh-product .dbh-product-remove-btn',
        removeProductIcon: '.dbh-product:nth-child(1) .dbh-product-remove-btn',
        firstProductRemove:
            '.dbh-product-list div .t-mini-cart__product:nth-child(1) .dbh-product-remove-btn',
        productMiniBag: '.dbh-product',
        productImg: '.dbh-product-img',
        productRemove: '.t-mini-cart__product-remove.dbh-product-remove',
        minibagHeader: '.dbh-title',
        miniBagClose: 'button.t-mini-cart__popover-carousel-close',
        emptyCartMiniBagMessage: 'p.t-mini-cart__empty-label',
        productPrice: '.dbh-product-price',
        productTitle: '.t-mini-cart__product-title.dbh-product-title',
        goToMyBagMiniCartBtn: '.t-mini-cart__cart-btn'
    }
} else {
    selectors = {
        minibagCount: '.dbh-mini-bag-icon .t-header__button-icon-count',
        minibagCountNew: 'button > span.rm-bt-number',
        minibagicon: '.qa-header__cart',
        emptyBagMessage: '.t-mini-cart__empty-title.u-margin-bottom-md',
        emptyCartSubtitleMessage:
            '.t-mini-cart__empty-subtitle.u-margin-bottom-lg',
        secureCheckoutButton: '.dbh-cart-btn',
        closeButton:
            '.pw-sheet__content .pw-header-bar div:nth-child(3) button',
        continueshoppingButton:
            '.t-mini-cart__empty-button > div.pw-button__inner',
        firstProductImage:
            '.t-mini-cart__product:nth-child(1) div:nth-child(1).pw-image.pw--is-loaded > img.pw-image__tag',
        firstProductTitle:
            '.t-cart__product-list .c-product-item:nth-child(1) h2',
        firstProductQuantity:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content > div.u-text-quiet',
        firstProductPrice:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content > div.u-text-weight-bold',
        firstProductColor:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content>div>span:nth-child(2)> span:nth-child(1)',
        firstProductSize:
            '.t-mini-cart__product:nth-child(1) div.t-mini-cart__product-content>div>span:nth-child(1)> span:nth-child(1)',
        subTotal: '.t-mini-cart__subtotal>div.u-text-align-center.u-width-full',
        secondProductImage:
            '.t-mini-cart__product:nth-child(2) div:nth-child(1).pw-image.pw--is-loaded > img.pw-image__tag',
        secondProductTitle:
            '.t-cart__product-list .c-product-item:nth-child(2) h2',
        secondProductQuantity:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content > div.u-text-quiet',
        secondProductPrice:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content > div.u-text-weight-bold',
        secondProductColor:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content>div>span:nth-child(2)> span:nth-child(1)',
        secondProductSize:
            '.t-mini-cart__product:nth-child(2) div.t-mini-cart__product-content>div>span:nth-child(1)',
        secondProductRemove:
            '.t-cart__product-list .c-product-item:nth-child(2) .dbh-remove',
        colourName: 'span.dbh-option',
        totalRemoveProductIcon: '.t-cart__product-list .dbh-remove',
        removeProductIcon:
            '.t-cart__product-list .c-product-item:nth-child(1) .dbh-remove',
        firstProductRemove:
            '.t-cart__product-list .c-product-item:nth-child(1) .dbh-remove',
        productMiniBag: '.dbh-product',
        productImg: '.dbh-product-img',
        productRemove: '.t-mini-cart__product-remove.dbh-product-remove',
        minibagHeader: '.dbh-title',
        miniBagClose: 'button.t-mini-cart__popover-carousel-close',
        emptyCartMiniBagMessage: 'p.t-mini-cart__empty-label',
        productPrice: '.dbh-product-price',
        productTitle: '.t-mini-cart__product-title.dbh-product-title',
        miniCartComponent: '.t-mini-cart__content',
        removeConfirm: '.c-notification-error__msg',
        removeConfirmButton: '.dbh-remove-item-button'
    }
}

const minibag = function() {
    this.selectors = selectors
}

export default minibag
