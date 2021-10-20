trigger CustClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Opportunity> oppo = Trigger.new;
    List<Task> taskList = new List<Task>();
    for (Opportunity item : oppo) {
        if (item.StageName == 'Closed Won') {
            taskList.add(new Task(Subject = 'Follow Up Test Task',
                                  WhatId = item.Id));
        }
    }
    if (taskList.size() > 0) {
    	insert taskList;
    }
}