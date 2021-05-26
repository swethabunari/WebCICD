<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<%@ include file="/jspf/processing.jspf"%>
<HEAD>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<TITLE>Dispute Approver List Entry</TITLE>
<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_detail_stylesheet.css">
<LINK rel=STYLESHEET type=text/css href="/NCTWeb/theme/nct_report_stylesheet.css">

<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/selectionXfer.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/validateTicketNum.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/processingGif.js" language="JavaScript"></SCRIPT>
<script>
function init()
{
/* This is the initialization section.                        */
   window.defaultStatus="Dispute Approval List"

/* Set the cursor on the Supplier code initially         */
   with (document.DisputePlantEntryForm) {
      //originatingPlantCode.focus();
   } // with
   showProcessingMessage('hide');
}
function showHidden(value)   
{   
    //var value=document.getElementById("inptPlant").value;   
	//alert(value);
        if(value == 'plant'){   
            document.getElementById("planttbl").style.display = 'block';   
            document.getElementById("usertbl").style.display ='none';  
            document.getElementById("divisiontbl").style.display = 'none'; 
            document.getElementById("inptPlant").checked = true;
        }else if(value == 'user'){   
            document.getElementById("usertbl").style.display = 'block';   
            document.getElementById("planttbl").style.display = 'none';
            document.getElementById("divisiontbl").style.display = 'none';
            document.getElementById("inptUser").checked = true;   
        }else if(value == 'division'){   
            document.getElementById("divisiontbl").style.display = 'block';   
            document.getElementById("usertbl").style.display = 'none';   
            document.getElementById("planttbl").style.display = 'none';
            document.getElementById("inptDvn").checked = true;
        }   
       
} 
function submitSelection(){
if (!(document.getElementById("inptPlant").checked)  && !(document.getElementById("inptUser").checked) &&   !(document.getElementById("inptDvn").checked)){
	alert("Please select an option.");
}else{
	if(document.getElementById("inptPlant").checked){
			var plantCode = document.DisputePlantEntryForm.originatingPlantCode.value;
			//var y=document.getElementById("originatingPlantCode").selectedIndex;
			//var x=document.getElementById("originatingPlantCode");	
			//SeRV01515775
			var y=document.DisputePlantEntryForm.originatingPlantCode.selectedIndex;
			var x=document.DisputePlantEntryForm.originatingPlantCode;		
			//SeRV01515775
			if(plantCode == null || plantCode == " "){
			  alert("Please select Plant.");
			  document.DisputePlantEntryForm.originatingPlantCode.focus();
			}else{
			
			 document.DisputePlantEntryForm.plantDescrn.value  = x.options[y].text;
				/* if no errors, then submit the form.                        */
				   showProcessingMessage('show');
				   document.DisputePlantEntryForm.<%=NavigationConstants.PARAMETER_GO%>.value = '<%=ApplicationConstants.GO_REPORT_BY_PLANT%>';
				   document.DisputePlantEntryForm.submit();
			}
	
   }else if(document.getElementById("inptUser").checked){
   	var userid = document.DisputePlantEntryForm.sourceUserId.value;
   	//alert("userid->"+userid+"13");
   		if(userid == null || userid == ""){
			  alert("Please enter Userid.");
			  document.DisputePlantEntryForm.sourceUserId.focus();
			}else{
					if(userid.substring(0,1).toUpperCase() != "T"){
						alert("Only TIDs should be entered.");
						document.DisputePlantEntryForm.sourceUserId.focus();
						return false;
					}
				
					if(userid.length < 7) {
	 					alert ("User ID must be 7 characters");
						return false;
					}
	 				
	 				document.DisputePlantEntryForm.sourceUserId.value = document.DisputePlantEntryForm.sourceUserId.value.toUpperCase();
					if(document.getElementById("bothPriBkp").checked){
					//alert("Option-1->"+document.getElementById("bothPriBkp").value);
					document.DisputePlantEntryForm.ilogonAprvrTyp.value = document.getElementById("bothPriBkp").value; 
					}else if(document.getElementById("priOnly").checked){
					//alert("Option-2->"+document.getElementById("priOnly").value);
					document.DisputePlantEntryForm.ilogonAprvrTyp.value = document.getElementById("priOnly").value;					
					}else if(document.getElementById("bkpOnly").checked){
					//alert("Option-3->"+document.getElementById("bkpOnly").value);
					document.DisputePlantEntryForm.ilogonAprvrTyp.value = document.getElementById("bkpOnly").value;					
					}
				/* if no errors, then submit the form.                        */
				   showProcessingMessage('show');
				   document.DisputePlantEntryForm.<%=NavigationConstants.PARAMETER_GO%>.value = '<%=ApplicationConstants.GO_REPORT_BY_USER%>';
				   document.DisputePlantEntryForm.submit();
			}
   }else if (document.getElementById("inptDvn").checked){
			var divisionCode = document.DisputePlantEntryForm.divisionId.value;
			//alert("divisionCode->"+divisionCode+"12");
			if(divisionCode == null || divisionCode == " " ||  divisionCode == ""){
			  alert("Please select Division.");
			  document.DisputePlantEntryForm.divisionId.focus();
			}else{
				/* if no errors, then submit the form.                        */
				   showProcessingMessage('show');
				   document.DisputePlantEntryForm.<%=NavigationConstants.PARAMETER_GO%>.value = '<%=ApplicationConstants.GO_REPORT_BY_DIVISION%>';
				  document.DisputePlantEntryForm.submit();
			}   
   }
}
}
function clearFields(){
document.getElementById("inptPlant").checked = false;
document.getElementById("inptUser").checked = false;
document.getElementById("inptDvn").checked = false;
 document.getElementById("planttbl").style.display = 'none';
 document.getElementById("usertbl").style.display ='none';
 document.getElementById("divisiontbl").style.display ='none';
}
</script>
</HEAD>
<BODY onLoad="init()">
<html:form action="/disputeReportEntry.nct" method="POST">
	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<H1>Dispute Approver List</H1>
	<br>
	<html:errors />
	<html:hidden property="<%=NavigationConstants.PARAMETER_GO%>"
		name="DisputePlantEntryForm" /></>
  <BR>
  <TABLE class=ReportTableInputDataDefault border=1 width="80%">
    <tbody>
      <tr>
        <td class=ReportTagname> Select one of the following criteria for the report. </td>
      </tr>
    </tbody>
  </TABLE>
  <br>
  <TABLE class=ReportTableInputDataDefault border=1 width="80%">
    <TBODY>
      <tr>
        <TD class=ReportTagname width="10%" >Plant</TD>
        <TD class=ReportTagname width="5%"><input id="inptPlant" name="copyType" type="radio" value="plant" onclick="showHidden('plant')"></TD>
        <TD class=ReportTagname  width="10%">Userid</TD>
        <TD class=ReportTagname width="5%" ><input id="inptUser" name="copyType" type="radio" value="user" onclick="showHidden('user')"></TD>
        <TD class=ReportTagname  width="10%">Division</TD>
        <TD class=ReportTagname  width="5%"><input id="inptDvn" name="copyType" type="radio" value="division" onclick="showHidden('division')"></TD>
        <TD class=ReportTagname>&nbsp;</TD>
      </tr>
    </TBODY>
  </TABLE>
  <br>
  <TABLE id="planttbl" class=TableInputDataDefault border=1 width="70%"  style="display: none;">
    <TBODY>
 		<tr>
			<td class="Tagname" width="40%"><A class="TagnameHelp"
				href="javascript:termsPopup('general','orig plant code');">Plant</A></td>
			<td width="40%">
			<html:select property="originatingPlantCode"
				onfocus="window.status='Select an Originating plant code to search on.';
                 return true;">
				<html:optionsCollection property="originatingPlantList"
					label="label" value="value" />
			</html:select></td><input type="hidden" name="plantDescrn" value="">
		</tr>
     </TBODY>
  </TABLE>
  <TABLE id="divisiontbl" class=TableInputDataDefault border=1 width="70%"  style="display: none;">
    <TBODY>
 		<tr>
			<td class="Tagname" width="40%"><A class="TagnameHelp"
				href="javascript:termsPopup('general','orig plant code');">Division</A></td>
				<td width="40%"><html:select property="divisionId"
				onfocus="window.status='Select an Originating plant code to search on.';
                 return true;">
                 <OPTION VALUE="">Select Division Code</OPTION>
				<OPTION VALUE="AC">Assembly Canada</OPTION>                 
                <OPTION VALUE="AE">Assembly Eurostar</OPTION>               
                <OPTION VALUE="AM">Assembly Mexico</OPTION>                 
                <OPTION VALUE="AU">Assembly US</OPTION>                     
                <OPTION VALUE="CC">Component Operation Canada</OPTION> 
 				<OPTION VALUE="CU">Component Operation US</OPTION>          
                <OPTION VALUE="IA">International Argentina</OPTION>         
                <OPTION VALUE="IB">International Brazil</OPTION>            
                <OPTION VALUE="IV">International Venezuela</OPTION>         
                <OPTION VALUE="LU">Logistics US</OPTION>                    
                <OPTION VALUE="M3">Mopar 3rd Party</OPTION>                 
                <OPTION VALUE="MC">Mopar Canada</OPTION>                    
                <OPTION VALUE="MS">Modular Strategy</OPTION>                
                <OPTION VALUE="MU">Mopar US</OPTION>                        
                <OPTION VALUE="OU">Outside Stamper</OPTION>                 
                <OPTION VALUE="PC">Powertrain Canada</OPTION>               
                <OPTION VALUE="PM">Powertrain Mexico</OPTION>               
                <OPTION VALUE="PU">Powertrain US</OPTION>                   
                <OPTION VALUE="SC">Stamping Canada</OPTION>                 
                <OPTION VALUE="SM">Stamping Mexico</OPTION>                 
                <OPTION VALUE="SU">Stamping US</OPTION>                     
                <OPTION VALUE="XX">Not Active</OPTION>
			</html:select></td>
		</tr>
     </TBODY>
  </TABLE>  
   <TABLE id="usertbl" class=TableInputDataDefault border=1 width="70%"  style="display: none;">
    <TBODY>
      <TR>
        <TD class=ReportTagname>Userid<br></TD>
        <TD class=ReportTagname><p>
            <input name="sourceUserId" type="text" id="sourceUserId" size="7" maxlength="7">
           <A HREF="#"    onClick=                                              
		            "window.userSearch = document.forms[0].sourceUserId;                
		            user_id = window.open                                             
		           ('/NCTWeb/jsp/userSearchEntry.jsp', 
		           'user','WIDTH=450,HEIGHT=450,SCROLLBARS=yes,RESIZEABLE=yes')">     
		           <img src="/NCTWeb/images/search_button.gif"          
		           border=0 alt="Use the search engine to select a Userid"></a> <br>
            <input id="bothPriBkp" name="primaryBackup" type="radio" value="PB" checked>
            Primary or Backup<br>
            <input id="priOnly" name="primaryBackup" type="radio" value="P">
            Primary Only<br>
            <input id="bkpOnly" name="primaryBackup" type="radio" value="B">
            Backup Only </TD><input type="hidden" name="ilogonAprvrTyp" value="">
      </TR>
    </TBODY>
  </TABLE>  
   
  <% if(request.getParameter("from")!=null && request.getParameter("from").toString().equals("plant")){%>
		<script language="javascript">
			showHidden('plant');
		</script>
	<% } %>
	<% if(request.getParameter("from")!=null && request.getParameter("from").toString().equals("userid")){%>
		<script language="javascript">
			showHidden('user');
		</script>
	<% } %>
	<% if(request.getParameter("from")!=null && request.getParameter("from").toString().equals("division")){%>
		<script language="javascript">
			showHidden('division');
		</script>
	<% } %>
	
  <CENTER>
    <INPUT name=Process type=button onclick="submitSelection();" value="<%= ApplicationConstants.BUTTON_RETRIEVE%>" class=button>
    &nbsp; &nbsp;&nbsp; &nbsp;
    <INPUT value="<%= ApplicationConstants.BUTTON_CLEAR%>" type=button name=clearx class=button onclick="clearFields();">
  </CENTER>
</html:form>

<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</HTML>
