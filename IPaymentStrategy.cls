public interface IPaymentStrategy {
    Boolean validate(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount);
    String paymentProcess(String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount);
}