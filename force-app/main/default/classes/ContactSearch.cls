public class ContactSearch {
    public static List<Contact> searchForContacts (String lastName,String postalCode) {
        List<Contact> returnedContacts = [SELECT Id, Name FROM Contact WHERE LastName =:lastName AND MailingPostalCode =:postalCode];
        return returnedContacts;
    }
}