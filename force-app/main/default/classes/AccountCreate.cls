public class AccountCreate implements Queueable {
    private Integer startKey;
    private Integer endKey;
    public AccountCreate(Integer startKey, Integer endKey) {
        this.startKey = startKey;
        this.endKey = endKey;
    }
    public void execute(QueueableContext context) {
        if (endKey - startKey + 1 > 10000) {
            System.enqueueJob(new AccountCreate(startKey + 10000, endKey));
            endKey = startKey + 9999;
        }
        List<Account> accounts = new List<Account>();
        for (Integer i = startKey; i <= endKey; i++) {
            String key = String.valueOf(i).leftPad(10, '0');
            accounts.add(new Account(
            	Name='Account '+i,
                Type='Customer - Direct',
                BillingStreet='Street '+i,
                BillingCountry='USA',
                BillingPostalCode=key,
                Description='This is Account with key ' + key,
                Customer_Key__c=key
            ));
        }
        insert accounts;
    }
}