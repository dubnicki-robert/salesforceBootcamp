public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads (String name) {
        // Kwerenda SOSL wyszuka Contacty i Leady a następnie utworzy listę złożoną z dwóch list
        List<List<sObject>> resultsList = [FIND :name IN NAME FIELDS RETURNING Contact(Id, FirstName, LastName), Lead (Id, FirstName, LastName)];
        return resultsList;
    }
}