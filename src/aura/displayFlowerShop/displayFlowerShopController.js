({
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.flowers", a.getReturnValue());
        });
        $A.enqueueAction(action);
        
        
        
        /***************
        var obj = 'Flower__c';
        var str = 'Color__c';
        var docTypeLOV = component.get("v.statusLOv");
        var actionpicklist =component.get("c.getPickListValues");
        
        actionpicklist.setParams({
            "obj":obj,
            "str":str,
        });
        actionpicklist.setCallback(this, function(response) {
            if(response.getState() === "SUCCESS") {
                docTypeLOV = response.getReturnValue();
                
                component.set("v.statusLOv",docTypeLOV);
                alert('@@'+component.get("v.statusLOv"));
                
            }
        });
        $A.enqueueAction(actionpicklist);
        ***************/
    },
    
    
    searchKeyChangeAll: function(component, event, helper) {   
        var ServiceType	 = component.find("ServiceTypeInput").get("v.value");
        var pageSize 	 = component.get("v.pageSize");
        var currentlistvalue = component.find("optionStatusId").get("v.value");
        var sliderValue = component.find("sliderID").get("v.value");
        
        var actionTitle = component.get("c.findBySearch");
        actionTitle.setParams({
            "ServiceType": ServiceType,
            "pSize" : pageSize,
            "listValue" : currentlistvalue,
            "slideValue":sliderValue
        });
        
        actionTitle.setCallback(this, function(a) {
            component.set("v.flowers", a.getReturnValue());
            //helper.hideSpinnerIcon(component,searchRecord);
        });
        
        $A.enqueueAction(actionTitle);
        
    },
    Next:function(cmp,event,helper){
        var next = true;
        var prev = false;         
        console.log('^^^^next'+next);
        console.log('prev'+prev);
        var start = cmp.get("v.pageStart");
        var size = cmp.get("v.pageSize");
        cmp.set("v.pageStart", start + size); 
        helper.nxtPrvRcd(cmp,next,prev); 
    },
    Previous:function(cmp,event,helper){
        var next = false;
        var prev = true;
        var offset = cmp.get("v.offset");
        var start = cmp.get("v.pageStart");
        var size = cmp.get("v.pageSize");
        cmp.set("v.pageStart", start - size ); 
        helper.nxtPrvRcd(cmp,next,prev); 
    },
    
    itemSelected:function(component, event, helper){
        var selectedId = event.getSource().get("v.name");
        var event = $A.get("e.c:FlowerSelected");
        event.setParams({"account":selectedId});
        event.fire();
    },
})