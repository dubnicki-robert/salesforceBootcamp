public class AccountDMLPractice {
    public static void insertAccounts(List<Account> accountsList, Boolean allOrNone) {
        
        if(accountsList == null) {
       		accountsList = new List<Account>{
        	new Account(Name='Klient 1'),
        	new Account(Name='Klient 2'),
        	new Account (Name='') // w celach ćwiczeniowych name puste, by wywołać DmlException
    		};    
        }

      try {
        Database.insert(accountsList, allOrNone);
      } catch (DmlException e) {
        System.debug('Wystąpił błąd podczas insertu kont: ' + e.getMessage());
    	}
    }
        
        public static void insertAccounts() {
            insertAccounts(null, false);
        }
 	}