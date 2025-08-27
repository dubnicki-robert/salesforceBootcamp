@isTest
private class ContactTriggerHandlerTest {
    @isTest
    static void testInsertWithBlankLastName() {
        Contact c = new Contact(FirstName='Abigail', LastName='null');
        insert c;

        Contact insertedContact = [SELECT LastName FROM Contact WHERE Id =:c.Id];
        System.assertEquals('Domyślne Nazwisko', insertedContact.LastName);
    }

    @isTest
    static void testUpdateWithBlankLastName() {
        Contact c = new Contact(FirstName='Maria', LastName='De Medeiros');
        insert c;

        c.LastName = 'null';
        update c;

        Contact updatedContact = [SELECT LastName FROM Contact WHERE Id =:c.Id];
        System.assertEquals('Domyślne Nazwisko', updatedContact.LastName);
    }
}