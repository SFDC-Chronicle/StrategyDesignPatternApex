public class CreditCardPaymentStrategy implements IPaymentStrategy {
    public Boolean validate(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        System.debug('Validating line of credit extended by the card issuer:::::');
        return true;
    }
    public String paymentProcess(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        System.debug('Processing payment based on line of credit extended by the card issuer:::::');
        return 'Payment processed successfully using Credit Card';
    }
}