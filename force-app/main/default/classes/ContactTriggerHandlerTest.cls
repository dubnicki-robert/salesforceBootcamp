@isTest
private class ContactTriggerHandlerTest {
    @isTest
    static void testInsertWithBlankLastName() {
        Contact c = new Contact(FirstName='Abigail', LastName='');
        insert c;
        Contact insertedContact = [SELECT LastName FROM Contact WHERE Id =:c.Id];
        System.assertEquals('Domyślne Nazwisko', insertedContact.LastName);
    }

    @isTest
    static void testUpdateWithBlankPhoneNumber() {
        Contact c = new Contact(FirstName='Maria', LastName='De Medeiros');
        insert c;
        c.Phone = null;
        Test.startTest();
        update c;
        Test.stopTest();
        Contact updatedContact = [SELECT Phone FROM Contact WHERE Id =:c.Id];
        System.assertEquals('666-666-666', updatedContact.Phone);
    }
}