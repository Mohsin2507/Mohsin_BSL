({
    flowerSelected: function(component, event, helper) { 
        var account = event.getParam("account");
        var action = component.get("c.findById");
        
        action.setParams({
            "contactId":account,
        });
        action.setCallback(this, function(a) {
            component.set("v.flower", a.getReturnValue());
        });
        $A.enqueueAction(action);
        
    }
})