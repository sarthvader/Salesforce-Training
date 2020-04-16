public class OppWizardController {
    
    Account account;
    Contact contact;
    Opportunity opportunity; 
    
    public Account getAccount() { 
        
        if(account == null){

            account = new Account(); 
        }
    
      return account;
   }
    
    public Contact getContact(){

        if(contact == null){

            contact = new Contact(); 
        }
        
        return contact;
    }
    
    public Opportunity getOpportunity(){

        if(opportunity == null){

            opportunity = new Opportunity(); 
        }
        
        return opportunity;
    }
    
    public PageReference toPage1(){
        
        return Page.OppWizard1;
    }
    
    public PageReference toPage2(){

        return Page.OppWizard2;
    }
    
    public PageReference toPage3(){

        return Page.OppWizard3;
    }

    public PageReference cancel(){
        PageReference pgRef = new PageReference('/lightning/page/home'); 
        pgRef.setRedirect(true); 

        return pgRef; 
    }

    public PageReference save(){

        PageReference pgRef; 

        insert account;
        insert contact; 

        opportunity.AccountId = account.Id; 
        opportunity.ContactId__c = contact.Id; 

        Database.SaveResult sr = Database.Insert(opportunity, false);
        if(sr.isSuccess()){
            pgRef = new PageReference('https://sarthak-akidev2-dev-ed.lightning.force.com/lightning/r/Opportunity/'+opportunity.Id+'/view'); 
            pgRef.setRedirect(true);             
        }
        return pgRef; 
    }
}