 * Before triggers are used to update or validate record values before they’re saved to the database.
 * After triggers are used to access field values that are set by the system (such as a record's Id or LastModifiedDate field), and to affect changes in other records. The records that fire the after trigger are read-only.
 * To access the records that caused the trigger to fire, use context variables.


```apex
tigger HelloWorldTrigger on Account (before insert) {
    System.debug('Hello World!');
}
```

```Apex
Account a = new Account(Name='Test Trigger');
insert a;
```

 * To access the records that caused the trigger to fire, use context variables.  

``Trigger.New contains all the records that were inserted in insert or update triggers.``

``Trigger.Old provides the old version of sObjects before they were updated in update triggers, or a list of deletd sObjects in delete triggers.``

```Apex
trigger HelloWorldTrigger on Account (before insert) {
        for(Account a : Trigger.New) {
            a.Description = 'New description';
        }
}
```

````Apex
trigger ContextVariableExampleTrigger on Account (before insert, after insert, after delete) {
        if (Trigger.isInsert) {
                if (Trigger.isBefore) {
                    // Process before insert
                } else if (Trigger.isAfter) {
                    // Process after insert
                }
         } 
         else if (Trigger.isDelete) {
            // Process after delete
         }
 }
````

 * ``Custom transactional logic - logic that occurs over the entire transaction, not just with a single record or object.``