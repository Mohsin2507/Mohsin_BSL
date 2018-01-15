({
    nxtPrvRcd : function(cmp,next,prev) {
        var ServiceType	 = cmp.find("ServiceTypeInput").get("v.value");
        var pageSize 	 = cmp.get("v.pageSize");
        var currentlistvalue = cmp.find("optionStatusId").get("v.value");
        console.log('INIT cmp    '+cmp);
        console.log('INIT prev     '+prev);
        console.log('INIT next     '+next);
        
        // alert(' before Calling method');
        var action = cmp.get("c.paginationRecords");
        action.setParams({ 
            "ServiceType": ServiceType,
            "listValue" : currentlistvalue,
            "next" : next,
            "prev" : prev,
            "pageSize": cmp.get("v.pageSize"),
            "pageStart": cmp.get("v.pageStart"),
        });
        //alert(' after Calling method');
        action.setCallback(this,function(res){
            var state = res.getState();            
            if(state=="SUCCESS"){
                //alert('inside success');
                var result = res.getReturnValue();
                cmp.set('v.pageStart',result.offst); 
                cmp.set('v.flowers',result.acc);
                cmp.set('v.next',result.hasnext);
                cmp.set('v.prev',result.hasprev);
            }
        });        
        $A.enqueueAction(action);
    },
})