@isTest
public class DeleteEventBatchTest {

    @testSetup
    public static void testSetupData(){
        Event_Organizer__c  org = new Event_Organizer__c (
           Name = 'Neeharika Saha',
            Phone__c = '9932144979',
            Email__c = 'neeharika.saha.21@aot.edu.in'
        );
        insert org;
        List<Event__c> eventList = new List<Event__c>();
        for(Integer i=0; i<=200; i++){
            Event__c event = new Event__c(
                Name__c = 'FIT SYNC Campaign #'+i+1,
                Event_Organizer__c  = org.Id,
                Event_Type__c = 'Virtual',
                Frequency__c  = 'Weekly',
                Max_Seats__c  = 199,
                Recurring__c = true,
                Live__c = true,
                Start_DateTime__c = System.now().addMonths(-4),
                End_Date_Time__c  = System.now().addDays(3).addMonths(-4)
            );
            eventList.add(event);
        }
        insert eventList;
    }
    
    @isTest
    static void sendDeletEventTest(){
        Test.startTest();

        String jobId = Database.executeBatch(new DeleteEventBatch(), 250);
        
        Test.stopTest();
        
    }
}
