public class PaypalPaymentStrategy implements IPaymentStrategy {
	public Boolean validate(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        System.debug('Validating the linked bank account, debit card, or credit card:::::');
        return true;
    }
    public String paymentProcess(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        System.debug('Deducting amount from your PayPal balance (if you have one) or your linked bank account, credit/debit card, depending on your choice and settings. :::::');
        return 'Payment processed successfully using PayPal';
    }
}