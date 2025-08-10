public class PaymentProcessor {
    private static IPaymentStrategy paymentStrategy;
    
    private static void getPaymentStrategy(String paymentMethod){
        //Using developer name retrive the metadata record
        Payment_Strategy_Mapping__mdt paymentStrategyMapping = Payment_Strategy_Mapping__mdt.getInstance(paymentMethod);
        if(paymentStrategyMapping != null && paymentStrategyMapping.Payment_Class_Name__c != null){
            Type className = Type.forName(paymentStrategyMapping.Payment_Class_Name__c);
            paymentStrategy = (IPaymentStrategy) className.newInstance();
        } else{
            paymentStrategy = null;
        }        
    }
    
    @AuraEnabled(cacheable= true)
    public static String callPaymentClass(String paymentMethod, String cardNumber, String accountNo, String fullName, String billingAddress, Decimal amount){
        getPaymentStrategy(paymentMethod);
        if(paymentStrategy == null){
            //throw new customNoDataFoundException('No payment startegy class exists');            
        } else {
            Boolean isValidated = paymentStrategy.validate(cardNumber, accountNo, fullName, billingAddress, amount);
            if(isValidated){
                String paymentMessage = paymentStrategy.paymentProcess(cardNumber, accountNo, fullName, billingAddress, amount);
                return paymentMessage;
            } else{
                //throw new customInvalidDataException('Card/Paypal details is not valid. Please use different payment method/card.');         
            }
        }
        return null;
    }
}