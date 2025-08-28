trigger ContactTrigger on Contact (before insert, before update) {
    ContactTriggerHandler handler = new ContactTriggerHandler();
    if (Trigger.isBefore) {
        if(Trigger.isInsert) {
            handler.beforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate) {
            handler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}