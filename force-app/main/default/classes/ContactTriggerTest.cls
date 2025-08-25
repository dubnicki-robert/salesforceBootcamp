@isTest
public class ContactTriggerTest {
    public static testMethod void testDefaultLastName() {
    // Preparing record with empty LastName field
    Contact c = new Contact(FirstName='Jan', LastName='');
    Contact c2 = new Contact(FirstName='Albert', LastName='Camus');
    
    Test.startTest();
    insert c;
    insert c2;
    Test.stopTest();
    
    Contact cFromDb = [SELECT LastName From Contact WHERE Id =:c.Id];
    Contact cFromDb2 = [SELECT LastName From Contact WHERE Id =:c2.Id];
    
    // Checking if trigger has launched properly and set LastName or haven't changed one if it was already set
    System.assertEquals('Domyślne Nazwisko', cFromDb.LastName, 'Trigger powinien ustawić LastName jako Domyślne Nazwisko');
    System.assertEquals('Camus', cFromDb2.LastName, 'Trigger nie powinien zmienić nazwiska');
       
    }    
}