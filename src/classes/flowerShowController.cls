public class flowerShowController {
    @AuraEnabled
    public list<Flower__c> talenCycletList;
    
    @AuraEnabled
    public integer offst;
    
    @AuraEnabled
    public integer total;
    
    @AuraEnabled
    public boolean hasprev; 
    
    @AuraEnabled
    public boolean hasnext;
    
    private static integer pagesize = 9;
    private static integer offset;
    
    
    @AuraEnabled
    public static List<Flower__c> findAll() {
        return [SELECT Id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c FROM Flower__c where Price__c < 30 LIMIT 9];
    }
    
    @AuraEnabled
    public static List<Flower__c> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c FROM Flower__c WHERE name LIKE :name LIMIT 50];
    }
    
    @AuraEnabled 
    public static Flower__c findById(String contactId) {
        system.debug('contactId '+contactId);
        return [SELECT id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c FROM Flower__c WHERE Id = :contactId];
    }
    
    
    @AuraEnabled
    public static CableDealPagination paginationRecords(String ServiceType, String listValue, boolean next,boolean prev, Integer pageSize, Integer pageStart, String slideValue){
        
        list<Flower__c> li = new list<Flower__c>();
        integer listlength = [Select count() from Flower__c];
        if(!schema.sobjecttype.Flower__c.isaccessible()){
            system.debug('Inside if');
            li = new list<Flower__c>();
        }else{
            if(next==false && prev==false){
                if(listValue == '--None--'){
                    
                    String query = 'SELECT id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c FROM Flower__c WHERE LastModifiedDate!=null ' ;      
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    
                    query += ' LIMIT ' + pageSize;
                    
                    li = Database.query(query);  
                    system.debug('li ::'+li);       
                    
                }
                else if(listValue == 'Blue'){
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c = 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Blue' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    
                    
                }
                else if(listValue == 'Purple'){
                    //li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c = 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Purple' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                }
                
                else if(listValue == 'Red'){
                    //li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Red' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                }
                else if(listValue == 'Pink'){
                    //li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c = 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Pink' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                }
                else if(listValue == 'White'){
                    //li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c = 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'White' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                }
                else if(listValue == 'Orange'){
                    //li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c = 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Orange' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                }
                else if(listValue == 'Yellow'){
                    //li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    if(slideValue == '10'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 10 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                    }
                    
                    else if(slideValue == '20'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 20 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '0'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c = 0 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '30'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 30 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '40'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 40 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '50'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 50 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '60'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 60 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '70'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 70 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '80'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 80 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    
                    else if(slideValue == '90'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 90 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                    else if(slideValue == '100'){
                        li = [Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c from Flower__c  where Color__c = 'Yellow' AND Price__c <= 100 LIMIT :Integer.valueOf(pageSize) OFFSET :offset];
                        
                    }
                }
                
            }else if(next==true){
                System.debug('@@@');
                
                if(listValue == '--None--'){
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 20';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                    
                }
                
                else if(listValue == 'Blue'){
                    String unassign = 'Blue'; 
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: unassign ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                    
                    
                    
                }
                else if(listValue == 'Purple'){
                    String unassign = 'Purple'; 
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c WHERE LastModifiedDate!=null ';
                    query += ' Where Color__c =: unassign ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);
                    
                }
                else if(listValue == 'Red'){
                    String active = 'Red';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: active ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                else if(listValue == 'Pink'){
                    String close = 'Pink';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: close ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                else if(listValue == 'White'){
                    String trmExp = 'White';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: trmExp ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                else if(listValue == 'Orange'){
                    String cancl = 'Orange';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: cancl ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Yellow'){
                    String Exp = 'Yellow';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: Exp ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
            }
            else if(prev==true){
                
                System.debug('@@@');
                //offset=offset+pagesizes;
                //System.debug('offset for Next ===>'+offset);
                
                if(listValue == '--None--'){ 
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Blue'){
                    String unassign = 'Blue'; 
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: unassign ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Purple'){
                    String active = 'Purple';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c=: active ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Red'){
                    system.debug('@@@');
                    String close = 'Red';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c=: close ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Pink'){
                    String cancl = 'Pink';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c=: cancl ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                else if(listValue == 'White'){
                    String exp = 'White';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c=: exp ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Orange'){
                    String trmExp = 'Orange';    
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c=: trmExp ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);    
                }
                
                else if(listValue == 'Yellow'){
                    String abandon = 'Yellow';   
                    String query = 'Select id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c ';
                    query += 'From Flower__c';
                    query += ' Where Color__c =: abandon ';
                    
                    if(ServiceType != '' &&  ServiceType != NULL){
                        query += ' AND service__c LIKE \'%' + ServiceType + '%\'';
                    }
                    
                    if(slideValue == '10'){
                        query += ' AND Price__c <= 10';
                    }
                    
                    else if(slideValue == '20'){
                        query += ' AND Price__c <= 20';
                    }
                    
                    else if(slideValue == '0'){
                        query += ' AND Price__c = 0';
                    }
                    
                    else if(slideValue == '30'){
                        query += ' AND Price__c <= 30';
                    }
                    
                    else if(slideValue == '40'){
                        query += ' AND Price__c <= 40';
                    }
                    
                    else if(slideValue == '50'){
                        query += ' AND Price__c <= 50';
                    }
                    
                    else if(slideValue == '60'){
                        query += ' AND Price__c <= 60';
                    }
                    
                    else if(slideValue == '70'){
                        query += ' AND Price__c <= 70';
                    }
                    
                    else if(slideValue == '80'){
                        query += ' AND Price__c <= 80';
                    }
                    
                    else if(slideValue == '90'){
                        query += ' AND Price__c <= 90';
                    }
                    else if(slideValue == '100'){
                        query += ' AND Price__c <= 100';
                    }
                    
                    
                    // set record limit to query 
                    query += ' LIMIT '+pageSize;
                    
                    query += ' OFFSET ' + pageStart;
                    system.debug('next button query ::>> '+query);
                    li = Database.query(query);
                    system.debug('list in next : :'+li);
                }
            }
        }
        
        CableDealPagination pg = new CableDealPagination();
        pg.acc = li;
        pg.offst = pageStart;
        
        //pg.hasprev = hasprev(pageStart);   
        //pg.hasnext = hasnxt(pageStart,listlength,pagesize);
        
        system.debug('pg  '+pg);
        return pg;
        
    }
    
    @TestVisible
    private static boolean hasprev(integer off){
        if(off>0)
            return false;
        return true; 
    }
    @TestVisible
    private static boolean hasnxt(integer off,integer li,integer ps){
        if(off+ps<li)
            return false;
        return true;
    }
    
    
    
    @AuraEnabled
    public static List<Flower__c> findBySearch(String ServiceType, Integer pSize, String listValue, String slideValue) {
        // public static List<Flower__c> findBySearch(String ServiceType, Integer pSize, String listValue) {
        //	 String slideValue = '11';
        system.debug('listValue '+listValue);
        system.debug('ServiceType ::'+ServiceType);
        
        system.debug('slideValue '+slideValue);
        
        String query = 'SELECT id, name, Color__c, Description__c, Image_Name__c, Price__c, Quantity__c FROM Flower__c WHERE LastModifiedDate!=null ' ;      
        
        
        String blue = 'Blue';
        if(listValue == 'Blue'){
            query += ' AND Color__c LIKE \'%' + blue + '%\'';
        }
        
        String Purple = 'Purple';
        if(listValue == 'Purple'){
            query += ' AND Color__c LIKE \'%' + Purple + '%\'';
        }
        
        String Red = 'Red';
        if(listValue == 'Red'){
            query += ' AND Color__c LIKE \'%' + Red + '%\'';
        }
        
        String Pink = 'Pink';
        if(listValue == 'Pink'){
            query += ' AND Color__c LIKE \'%' + Pink + '%\'';
        }
        String White = 'White';
        if(listValue == 'White'){
            query += ' AND Color__c LIKE \'%' + White + '%\'';
        }
        
        String Orange = 'Orange';
        if(listValue == 'Orange'){
            query += ' AND Color__c LIKE \'%' + Orange + '%\'';
        }
        
        
        String Yellow = 'Yellow';
        if(listValue == 'Yellow'){
            query += ' AND Color__c LIKE \'%' + Yellow + '%\'';
        }
        system.debug('slideValue '+slideValue);
        //query += ' AND Price__c <= 100';
        
        if(slideValue == '10'){
            query += ' AND Price__c <= 10';
        }
        
        else if(slideValue == '20'){
            query += ' AND Price__c <= 20';
        }
        
        else if(slideValue == '0'){
            query += ' AND Price__c = 0';
        }
        
        else if(slideValue == '30'){
            query += ' AND Price__c <= 30';
        }
        
        else if(slideValue == '40'){
            query += ' AND Price__c <= 40';
        }
        
        else if(slideValue == '50'){
            query += ' AND Price__c <= 50';
        }
        
        else if(slideValue == '60'){
            query += ' AND Price__c <= 60';
        }
        
        else if(slideValue == '70'){
            query += ' AND Price__c <= 70';
        }
        
        else if(slideValue == '80'){
            query += ' AND Price__c <= 80';
        }
        
        else if(slideValue == '90'){
            query += ' AND Price__c <= 90';
        }
        else if(slideValue == '100'){
            query += ' AND Price__c <= 100';
        }
        
        if(ServiceType != '' &&  ServiceType != NULL){
            query += ' AND name LIKE \'%' + ServiceType + '%\'';
        }
        
        
        //query += ' NULLS LAST';
        
        query += ' LIMIT ' + pSize;
        system.debug('query final ::>> ' + query); 
        
        List<Flower__c> lstfinal = Database.query(query);
        system.debug('lstfinal :'+lstfinal);
        return lstfinal;
        
    }
    
    @AuraEnabled
    public static List<String> getPickListValues(String obj, String str) {
        
        List<String> options = new List<String>(); 
        
        Schema.DescribeFieldResult plistvalues = Schema.getGlobalDescribe().get(obj).getDescribe().fields.getMap().get(str).getDescribe();
        for(PicklistEntry ent:plistvalues.getpicklistvalues())     {
            options.add(ent.getLabel());
        }
        return options;
    }
    
    
}