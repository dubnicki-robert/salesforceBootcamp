trigger ContactTrigger on Contact (before insert) {
    for (Contact con : Trigger.new) {
        if (String.isBlank(con.LastName)) {
            con.LastName = 'Domyślne Nazwisko';
        }
    }
}