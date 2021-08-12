// const {login} = require('../loginPage')
// const {find} = require('../findStore')
import login from '../page-objects/login-page'
import locate from '../page-objects/locate-store'
import register from '../page-objects/register'
import common from '../page-objects/common-page'
import user from '../page-objects/new-user'
import details from '../page-objects/my-details'
import forgotPass from '../page-objects/forgot-password'
import emailRem from '../page-objects/email-reminder'
import psp from '../page-objects/psp-page'
import accountLocked from '../page-objects/account-locked'
import globalNav from '../page-objects/global-nav'
import basketCheckout from '../page-objects/basket-checkout'
import ghost from '../page-objects/ghost'
import mySavedItems from '../page-objects/my-saved-items'
import deliveryOption from '../page-objects/delivery-option'
import myBag from '../page-objects/my-bag'
import homeDelivery from '../page-objects/home-delivery'
import pdp from '../page-objects/pdp-page'
import minibag from '../page-objects/minibag'
import payment from '../page-objects/payment'
import beautyClub from '../page-objects/beauty-club'
import storeFinder from '../page-objects/store-finder'
import addressBook from '../page-objects/address-book'
import managePassword from '../page-objects/manage-password'
import myOrders from '../page-objects/my-orders'
import myAccount from '../page-objects/my-account'
import orderConfirmation from '../page-objects/order-confirmation'
import cccLogin from '../page-objects/ccc-login-page'
import cccCustomerSearch from '../page-objects/ccc-customer-search-page'
import home from '../page-objects/home-page'

const pageObjects = {
    loginPage: new login(),
    locateStorePage: new locate(),
    registerPage: new register(),
    newUserPage: new user(),
    myDetailsPage: new details(),
    commonPage: new common(),
    forgotPasswordPage: new forgotPass(),
    emailReminderPage: new emailRem(),
    pspPage: new psp(),
    accountLockedPage: new accountLocked(),
    globalNavigation: new globalNav(),
    basketCheckoutPage: new basketCheckout(),
    ghostPage: new ghost(),
    mySavedItemPage: new mySavedItems(),
    deliveryOptionPage: new deliveryOption(),
    myBagPage: new myBag(),
    homeDeliveryPage: new homeDelivery(),
    pdpPage: new pdp(),
    minibagPage: new minibag(),
    paymentPage: new payment(),
    beautyClubPage: new beautyClub(),
    storeFinderPage: new storeFinder(),
    addressBookPage: new addressBook(),
    managePasswordPage: new managePassword(),
    myOrdersPage: new myOrders(),
    myAccountPage: new myAccount(),
    orderConfirmationPage: new orderConfirmation(),
    cccLoginPage: new cccLogin(),
    cccCustomerSearchPage: new cccCustomerSearch(),
    homePage: new home()
}

const PageObjects = function() {
    this.pageObjects = pageObjects
}

export default PageObjects
