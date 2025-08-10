import { LightningElement } from 'lwc';
import callPaymentClass from '@salesforce/apex/PaymentProcessor.callPaymentClass';

export default class StrategyPatternDemo extends LightningElement {
    paymentMethod='';
    response = '';
    get options() {
        return [
            { label: 'Credit Card', value: 'Credit_Card' },
            { label: 'Debit Card', value: 'Debit_Card' },
            { label: 'PayPal', value: 'Paypal' },
        ];
    }
    async handleChange(event) {
        this.paymentMethod = event.detail.value;
        try {
            const result = await callPaymentClass({ paymentMethod: this.paymentMethod, cardNumber : '2345678', accountNo:'123456', fullName: 'XXXXX', billingAddress: '123 Main St', amount: 1000 });
            console.log('Payment processed successfully:', result);
            this.response = result;
        } catch (error) {
            console.error('Error processing payment:', error);
        }
    }
}