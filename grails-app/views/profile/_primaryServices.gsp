<script type="text/javascript">
	var primaryServiceChildCount = ${primaryServices.size()} + 0;

    function addPrimaryService() {
        console.log("Entering addPrimaryService... ")
		var clone = $("#primaryService_clone").clone()
		var divId = 'primaryService'+primaryServiceChildCount;
		var htmlId = 'primaryServiceList['+primaryServiceChildCount+'].';
		var serviceNameInput = clone.find("input[id$=serviceName]");

		clone.find("input[type=button]")
				.attr('onclick','deleteRow("' + divId + '")')
		clone.find("input[id$=id]")
				.attr('id',htmlId + 'id')
				.attr('name',htmlId + 'id');
		clone.find("input[id$=deleted]")
		        .attr('id',htmlId + 'deleted')
		        .attr('name',htmlId + 'deleted');
		clone.find("input[id$=new]")
		        .attr('id',htmlId + 'new')
		        .attr('name',htmlId + 'new')
		        .attr('value', 'true');
		serviceNameInput.attr('id',htmlId + 'serviceName')
		        .attr('name',htmlId + 'serviceName');
		clone.find("select[id$=serviceDescription]")
		        .attr('id',htmlId + 'serviceDescription')
		        .attr('name',htmlId + 'serviceDescription');
		
		clone.attr('id', 'primaryService'+primaryServiceChildCount);
		$("#primaryServiceChildList").append(clone);
		clone.show();
		serviceNameInput.focus();
		primaryServiceChildCount++;
    }
	
    function deleteRow(parentDiv) {
    	console.log("Entering deleteRow... "+parentDiv)
    	//find the parent div
    	var prnt = $("#"+parentDiv)
        console.log("parent: "+prnt)
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        console.log("delInput: "+delInput)
        var newHidden = prnt.find("input[id$=new]")
        console.log("newHidden: "+newHidden)
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        console.log("newValue: "+newValue)
        //if it is new then i can safely remove from dom
        if (newValue == 'true') {
            console.log("It's true!")
            prnt.remove();
        } else {
            console.log("Marking as delete..")
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
    }
</script>

<ul class="input-wrap">
	<li class="user-input">
		<div id="primaryServiceChildList">
		    <g:each var="service" in="${primaryServices}" status="i">
		        <g:render template='primaryService' model="['service':service,'i':i,'hidden':false]"/>
		    </g:each>
		</div>
		<div class="add-btn-wrap">		
			<input type="button" value="Add Another Service" onclick="addPrimaryService();" />
			<span class="count"><span class="current-count">1</span> of <span class="total-count">5</span> added</span>
		</div>
	</li>
</ul>
