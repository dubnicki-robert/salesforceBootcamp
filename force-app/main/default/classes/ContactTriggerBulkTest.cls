@isTest
public class ContactTriggerBulkTest {
    // Test dla kilku rekordów na raz
    static testMethod void testBulkContacts() {
    // Przygotowanie listy kontaktów    
        List<Contact> contactsToInsert = new List<Contact>{
            new Contact(FirstName='Angus', LastName=''),
            new Contact(FirstName='Jaume', LastName='Cabre'),
            new Contact(FirstName='Derrick', LastName='Green'),
            new Contact(FirstName='Mia', LastName='')
        };
            
        Test.startTest();
        insert contactsToInsert;
        Test.stopTest();
        
        List<Contact> result = [SELECT FirstName, LastName, Id FROM Contact];
        Map<String, Contact> contactMap = new Map<String, Contact>();
        for (Contact c : result) {
            contactMap.put(c.FirstName, c);
        }
        
        System.assertEquals('Domyślne Nazwisko', contactMap.get('Angus').LastName, 'Powinno ustawić Domyślne Nazwisko');
        System.assertEquals('Cabre', contactMap.get('Jaume').LastName, 'Powinno nie zmieniać nazwiska');
        System.assertEquals('Green', contactMap.get('Derrick').LastName, 'Powinno nie zmieniać nazwiska');
        System.assertEquals('Domyślne Nazwisko', contactMap.get('Mia').LastName, 'Powinno ustawić Domyślne Nazwisko');
        
    }
	
    // Test bulk dla 200 rekordów
    static testMethod void testTriggerBulkInsert() {
        
   	// Przygotowanie listy kontaktów z dwustoma rekordami
        List<Contact> bulkContacts = new List<Contact>();
        
        for(Integer i = 1; i <= 200; i++) {
            String lastName;
            if (Math.mod(i, 2) == 0) {
             lastName = 'Nazwisko' + i;   
            } else {
                lastName = '';
            }
            bulkContacts.add(new Contact(FirstName='Imie' + i, LastName=lastName));
        }
    
        
        Test.startTest();
        insert bulkContacts;
        Test.stopTest();
        
		List<Contact> insertedContacts = [SELECT FirstName, LastName 
                                  			FROM Contact 
                                  			WHERE FirstName IN ('Imie1','Imie2','Imie3','Imie4')];

		System.assertEquals('Domyślne Nazwisko', insertedContacts[0].LastName, 'Imie1 powinno mieć ustawione domyślne nazwisko');
		System.assertEquals('Nazwisko2', insertedContacts[1].LastName, 'Imie2 nie powinno zmienić nazwiska');
		System.assertEquals('Domyślne Nazwisko', insertedContacts[2].LastName, 'Imie3 powinno mieć ustawione domyślne nazwisko');
		System.assertEquals('Nazwisko4', insertedContacts[3].LastName, 'Imie4 nie powinno zmienić nazwiska');
    }
}