trigger ContactTrigger on Contact (before insert) {
    ContactTriggeerHandler handler = new ContactTriggerHandler();
    if (Trigger.isBefore) {
        if(Trigger.isInsert) {
            handler.beforeInsert(Trigger.New);
        }
        if(Trigger.isUpdate) {
            handler.beforeUpdate(Trigger.New, Trigger.oldMap);
        }
    }
}