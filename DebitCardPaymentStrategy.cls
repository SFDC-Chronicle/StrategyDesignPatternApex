public class DebitCardPaymentStrategy implements IPaymentStrategy {
	public Boolean validate(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        System.debug('Validating the availability of amount in your checking or savings account:::::');
        return true;
    }
    public String paymentProcess(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        System.debug('Deducting amount directly from your checking or savings account:::::');
        return 'Payment processed successfully using Debit Card';
    }
}