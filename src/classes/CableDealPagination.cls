public with sharing class CableDealPagination {
     @AuraEnabled
     public list<Flower__c> acc;
      
     @AuraEnabled
     public integer offst;
      
     @AuraEnabled
     public integer total;
      
     @AuraEnabled
     public boolean hasprev;
      
     @AuraEnabled
     public boolean hasnext;
 
     private static integer pagesize=9;
     private static integer offset;
      
     @AuraEnabled
     public static CableDealPagination getacc(boolean next,boolean prev,decimal off){
        //offset = (integer)off;
		offset = 9;
         list<Flower__c> li = new list<Flower__c>();
        integer listlength = [Select count() from Flower__c where name!=null];
        if(!schema.sobjecttype.Flower__c.isaccessible()){
            li = new list<Flower__c>();
        }else{
         if(next==false && prev==false){
         li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c LIMIT :pagesize OFFSET :offset];
         }else if(next==true && (offset+pagesize)<=listlength){
              offset=offset+pagesize;
          li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c LIMIT :pagesize OFFSET :offset];
         }else if(prev==true && offset>0){
          offset=offset-pagesize;
          li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c LIMIT :pagesize OFFSET :offset];
         }
         }
        CableDealPagination pg = new CableDealPagination();
        pg.acc = li;
        pg.offst = offset;
        pg.hasprev = hasprev(offset);   
            pg.hasnext = hasnxt(offset,listlength,pagesize);
             
            return pg;
         }
          
         private static boolean hasprev(integer off){
            if(off>0)
                return false;
            return true; 
        }
        private static boolean hasnxt(integer off,integer li,integer ps){
        if(off+ps<li)
            return false;
        return true;
    }      
}