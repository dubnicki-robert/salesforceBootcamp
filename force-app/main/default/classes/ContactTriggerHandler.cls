public with sharing class ContactTriggerHandler {
    
    public void beforeInsert(List<Contact> newContacts) {
        for (Contact con : newContacts) {
            if (String.isBlank(con.LastName)) {
                    con.LastName = 'Domyślne Nazwisko';
            }
        }
    }

    public void beforeUpdate(List<Contact> newContacts, Map<Id, Contact> oldContactMap) {
        for (Contact con : newContacts) {
            if (String.isBlank(con.LastName)) {
                con.LastName = 'Domyślne Nazwisko';
            }
        }

    }
}