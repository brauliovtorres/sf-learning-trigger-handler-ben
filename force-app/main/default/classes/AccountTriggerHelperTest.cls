/**
 * @description       : 
 * @author            : Braulio Villares Torres
 * @group             : 
 * @last modified on  : 06-17-2022
 * @last modified by  : Braulio Villares Torres
**/
@isTest
private class AccountTriggerHelperTest {
    
    @isTest
    static void createAccountShouldWork() {
        Test.startTest();
        
        String accountName = 'Account Name Test';
        Account acc = new Account(
            Name = accountName
        );
        Database.insert(acc);
        
        Test.stopTest();

        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = :accountName];
        System.assertNotEquals(0, accounts.size(), 'An Account named ' + accountName + ' should be created');
    }
    
    @isTest
    static void updateAccountShouldWork() {
        
        String accountName = 'Account Name Test';
        Account acc = new Account(
            Name = accountName
        );
        Database.insert(acc);

        Test.startTest();

        String changedAccountName = 'Account Updated Name Test';
        acc.Name = changedAccountName;
        Database.update(acc);

        Test.stopTest();

        List<Account> updatedAccount = [SELECT Id, Name FROM Account WHERE Name = :changedAccountName];
        System.assertNotEquals(0, updatedAccount.size(), 'An account named ' + changedAccountName + ' should exist');
    }
    
    @isTest
    static void deleteAccountShouldWork() {
        
        String accountName = 'Account Name Test';
        Account acc = new Account(
            Name = accountName
        );
        Database.insert(acc);

        Test.startTest();

        Database.delete(acc);
        
        Test.stopTest();

        List<Account> accounts = [SELECT Id, Name FROM Account];
        System.assertEquals(0, accounts.size(), 'No account should exist');
    }
       
    @isTest
    static void undeleteAccountShouldWork() {
        
        String accountName = 'Account Name Test';
        Account acc = new Account(
            Name = accountName
        );
        Database.insert(acc);
        Database.delete(acc);

        Test.startTest();

        Database.undelete(acc);
        
        Test.stopTest();

        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = :accountName];
        System.assertNotEquals(0, accounts.size(), 'An account named ' + accountName + ' should exist');
    }
    
}
