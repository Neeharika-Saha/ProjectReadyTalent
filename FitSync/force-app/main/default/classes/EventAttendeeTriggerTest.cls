@isTest
public class EventAttendeeTriggerTest {
	
    @testSetup
    public static void setupData(){
        
        Event_Organizer__c  org = new Event_Organizer__c (
            Name = 'Neeharika Saha',
            Phone__c = '9932144979',
            Email__c = 'neeharika.saha.21@aot.edu.in'
        );
        insert org;
        
        Event__c event = new Event__c(
            Name__c = 'Fit Sync Campaign#1',
            Event_Organizer__c  = org.Id,
            Event_Type__c = 'In-Person',
            Frequency__c  = 'Weekly',
            Max_Seats__c  = 200,
            Recurring__c = true,
            Live__c = true,
            Start_DateTime__c = System.now()
            End_Date_Time__c  = System.now().addDays(3)
        );
        insert event;
        Attendee__c att = new Attendee__c(
            Name = 'Enakshi Saha',
            Email__c = 'neeharika.javascript.11@gmail.com',
            Phone__c = '9436076423'
        );
        insert att;
        
        Event_Attendee__c evtAtt = new Event_Attendee__c(Event__c = event.Id, Attendee__c = att.Id);
        insert evtAtt;
    }
    
    @isTest
    static void sendEmailTest(){
        Test.startTest();
        try{
            integer i = 10/0;
        }catch(System.Exception ex ){
            
        }
        Test.stopTest();
    }
} 

