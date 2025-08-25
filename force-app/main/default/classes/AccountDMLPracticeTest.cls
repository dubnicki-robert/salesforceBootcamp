@isTest
public class AccountDMLPracticeTest {
    static testMethod void testInsertAccounts() {
        
        List<Account> testAccounts = new List<Account> {
            new Account(Name='Klient 1'),
            new Account(Name='Klient 2'),
            new Account(Name='')
        };
        
        Test.startTest();
        AccountDMLPractice.insertAccounts();
        Test.stopTest();
        
        //Database.SaveResult[] results = Database.insert(testAccounts, false);
        //System.assert(results[0].isSuccess() == true, 'Klient 1 powinien być zapisany');
        //System.assert(results[1].isSuccess() == true, 'Klient 2 powinien być zapisany');
        //System.assert(results[2].isSUccess() == false, 'Rekord z pustym Name nie powinien się zapisać');
        
        List<Account> accountsFromDatabase = [SELECT Name From Account WHERE Name In ('Klient 1', 'Klient 2')];
        System.assertEquals(2, accountsFromDatabase.size(), 'Powinny istnieć tylko dwa konta');
        System.assertEquals('Klient 1', accountsFromDatabase[0].Name, 'Konto powinno nazywać się Klient 1');
        System.assertEquals('Klient 2', accountsFromDatabase[1].Name, 'Konto powinno nazywać się Klient 2');
    }
    
    static testMethod void testCatchBlock() {
        List<Account> badAccounts = new List<Account>{
            new Account(Name=''), // pusty Name wymusi DmlException
            new Account(Name='Test') // poprawny rekord
                };
        
        Test.startTest();
        AccountDMLPractice.insertAccounts(new List<Account> {
            new Account(Name=''),
            new Account(Name='Test')
        }, true);
        Boolean exceptionCaught = false;
        try {
            insert badAccounts; // allOrNone=true -> wyjątek dla pustego Name
        } catch (DmlException e) {
            exceptionCaught = true; // tu zadziała Salesforce i zadziała catch w insertAccounts
            System.debug('Wyjątek złapany w teście: ' + e.getMessage());
        }
        
        Test.stopTest();
        }
}