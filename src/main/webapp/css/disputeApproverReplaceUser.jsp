<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<TITLE>Dispute Approver Copy/Replace</TITLE>
<LINK rel=STYLESHEET type=text/css href="/NCTWeb/theme/nct_report_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_detail_stylesheet.css">
<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/selectionXfer.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/validateTicketNum.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/processingGif.js" language="JavaScript"></SCRIPT>
<script>
function init()
{
/* This is the initialization section.                        */
   window.defaultStatus="Dispute Approver Copy/Replace";

/* Set the cursor on the Supplier code initially         */
   with (document.DisputePlantEntryForm) {
      //originatingPlantCode.focus();
   } // with
   showProcessingMessage('hide');
   
   var plants = document.getElementById("formData").value;
   if(plants!=""){
		var plantsArr = plants.split(",");
		var plantForm = document.DisputePlantEntryForm;
		var rowscount = 0;
		for (x=0;x<plantForm.replaceUser.length;x++)
		{
			for (y=0;y<plantsArr.length;y++)
			{
				if(plantForm.replaceUser[x].value == plantsArr[y]){
					rowscount++;
					plantForm.replaceUser[x].checked = true;
				}
			}
				
		}
		if((plantsArr.length-rowscount) > 0){
			document.getElementById("ErrorText").innerHTML = (plantsArr.length-rowscount) + " row(s) were successfully replaced.<br/>";
		}
   }
   
   
}
function showHidden(value)   
{   
    //var value=document.getElementById("inptPlant").value;   
        if(value == 'plant'){   
            document.getElementById("planttbl").style.display = 'block';   
            document.getElementById("usertbl").style.display ='none';   
        }else if(value == 'user'){   
            document.getElementById("usertbl").style.display = 'block';   
            document.getElementById("planttbl").style.display = 'none';   
        }   
       
} 
function submitSelection(){
	if (document.forms[0].noData.value=="true") {
		alert("No data to process");
		return false;
	}
	if(document.getElementsByName("desnUserId")[0].value == ""){
		alert("Please enter New User ID");
		document.getElementsByName("desnUserId")[0].focus();
		return false;
	}
	var userid = document.getElementsByName("desnUserId")[0].value;
	if(userid.substring(0,1).toUpperCase() != "T"){
		alert("Only TIDs should be entered.");
		document.getElementsByName("desnUserId")[0].focus();
		return false;
	}
					
	if(userid.length < 7) {
		alert ("User ID must be 7 characters");
		document.getElementsByName("desnUserId")[0].focus();
		return false;
	}
	document.getElementsByName("desnUserId")[0].value = document.getElementsByName("desnUserId")[0].value.toUpperCase();
	
	var ru = document.getElementsByName("replaceUser");
	var pc = document.getElementsByName("plantcode");
	var at = document.getElementsByName("aprtype");
	var st = document.getElementsByName("supplrTyp");
	var dal = document.getElementsByName("disApvlLvl");
	var strValue= "";
	var modStrValue= "";
	var SelBranchVal = "";
	var selectFlag = false;
	for (e=0;e<ru.length;e++) {
		
		if (ru[e].checked==true) {
			selectFlag = true;
			strValue = strValue + "C" + pc[e].value + document.getElementsByName("desnUserId")[0].value + at[e].value + st[e].value + dal[e].value + "E" + document.getElementsByName("logonId")[0].value ;
			modStrValue = modStrValue + "D" + pc[e].value + document.getElementsByName("sourceUserId")[0].value + at[e].value + st[e].value + dal[e].value + "E" + document.getElementsByName("logonId")[0].value ;
			SelBranchVal = SelBranchVal + "," + ru[e].value;
		}
	}
	
	if(!selectFlag){
		alert("Please select at least one row.");
		return false;
	}
	if(SelBranchVal.length > 0) SelBranchVal = SelBranchVal.substring(1);
	document.getElementsByName("formData")[0].value = SelBranchVal;
	document.getElementsByName("passdata")[0].value=strValue;
	document.getElementsByName("modpassdata")[0].value=modStrValue;
	showProcessingMessage('show');
	document.DisputePlantEntryForm.<%=NavigationConstants.PARAMETER_GO%>.value = '<%=ApplicationConstants.UPDATE_DISPUTE_COPY_REPLACE%>';
	document.DisputePlantEntryForm.submit();
	

}
function clearFields(){
document.getElementById("inptPlant").checked = false;
document.getElementById("inptUser").checked = false;
 document.getElementById("planttbl").style.display = 'none';
 document.getElementById("usertbl").style.display ='none';
}
</script>
</HEAD>
<BODY onLoad="init()">
<html:form action="/disputeCpyRplceEntry.nct" method="POST">
	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<H1>Dispute Approver Copy/Replace</H1>
	<br>
	
	<html:hidden property="<%=NavigationConstants.PARAMETER_GO%>"
		name="DisputePlantEntryForm" /></>
  <TABLE  class=ReportTableInputDataDefault border=1 width="70%" align="center">
    <TBODY>
      <TR>
        <TD class=ReportTagnameReturn>Original User </TD>
        <TD class=ReportTableInputDataVariableLeft width=80%><bean:write property="sourceUserId" name="DisputePlantEntryForm"/>&nbsp;&nbsp;&nbsp;<bean:write property="sourceUserName" name="DisputePlantEntryForm"/></TD>
        <html:hidden property="sourceUserId" name="DisputePlantEntryForm"/>
      </TR>
    </TBODY>
  </TABLE>
  <BR>
  <TABLE  class=ReportTableInputDataDefault border=1 width="70%" align="center">
    <TBODY>
      <TR>
        <TD class=ReportTagnameReturn>New User <A HREF="#"    onClick=                                              
		            "window.userSearch = document.getElementsByName('desnUserId')[0];                
		            user_id = window.open                                             
		           ('/NCTWeb/jsp/userSearchEntry.jsp', 
		           'user','WIDTH=450,HEIGHT=450,SCROLLBARS=yes,RESIZEABLE=yes');return false;">     
		           <img src="/NCTWeb/images/search_button.gif"          
		           border=0 alt="Use the search engine to select a Userid"></a></TD>
        <TD class=ReportTableInputDataVariableLeft width=80%><INPUT maxLength=7 size=7  name="desnUserId" value="<bean:write property='desnUserId' name='DisputePlantEntryForm'/>"></TD>
        <html:hidden property="desnUserId" name="DisputePlantEntryForm"/>
      </TR>
    </TBODY>
  </TABLE>
     
  <p>The original user will be replaced by the new user in all checked roles. </p>
  <TABLE  class=ReportDataReturnDataDefault border=1 width="100%">
    <TBODY>
      <tr>
        <TH class=ReportHeadingNames colSpan=7> Current Dispute Roles for <bean:write property="sourceUserId" name="DisputePlantEntryForm"/></TH>
      </tr>
      <TR>
        <TH class=ReportHeadingNames rowSpan=2><A class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','Action');">Replace User</A> </TH>
        <TH class=ReportHeadingNames rowSpan=2><A class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','Action');">Plant</A> </TH>
        <TH class=ReportHeadingNames rowSpan=2><A class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','Role');">Dispute Level</A> </TH>
        <TH class=ReportHeadingNames colSpan=1 rowspan="2" scope=col><A 
      class=ReportTagnameHelp>Supplier Type</A> </TH>
        <TH class=ReportHeadingNames colSpan=2 scope=col><A 
      class=ReportTagnameHelp>Listed as </A> </TH>
        <TH class=ReportHeadingNames rowSpan=2><A class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','Last  Updated By');">Last Updated 
          By/Date</A> </TH>
      </TR>
     <TR>
        <TH rowSpan=1 class=ReportHeadingNames><A class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','User');">Primary</A> </TH>
        <TH class=ReportHeadingNames colSpan=1 scope=col><A 
      class=ReportTagnameHelp>Backup</A></TH>
      </TR>
    <logic:iterate id="data"  property="approvalList" name="DisputePlantEntryForm" type="com.dcx.mfg.nct.databean.core.dispute.DisputeCopyReplaceBean">
      <TR>
        <TD class=ReportTableDataReturnFixed><input name="replaceUser" type="checkbox" id="replaceUser" value="<bean:write name='data' property='plantCode'/><bean:write name='data' property='disApvlLvl'/><bean:write name='data' property='supplrTyp'/>"></TD>
        <TD class=ReportTableDataReturnVariableLeft><bean:write property="plantDescrn" name="data"/></TD>
        <logic:equal name="data" property="disApvlLvl" value="E1"><TD class=ReportTableDataReturnFixed>Dispute</TD></logic:equal>
      	<logic:equal name="data" property="disApvlLvl" value="E2"><TD class=ReportTableDataReturnFixed>Escalated Dispute</TD></logic:equal>
      	<logic:equal name="data" property="disApvlLvl" value="E3"><TD class=ReportTableDataReturnFixed>Executive Review</TD></logic:equal>
      	<logic:equal name="data" property="supplrTyp" value="I"><TD class=ReportTableDataReturnFixed>Internal</TD></logic:equal>
      	<logic:equal name="data" property="supplrTyp" value="E"><TD class=ReportTableDataReturnFixed>External</TD></logic:equal>
          <logic:equal name="data" property="ilogonPrmyAprvr" value="N/A"><TD class=ReportTableDataReturnFixed> &nbsp; </TD></logic:equal>
           <logic:notEqual name="data" property="ilogonPrmyAprvr" value="N/A"><TD class=ReportTableDataReturnFixed> XXX </TD></logic:notEqual>
           
		<logic:equal name="data" property="ilogonBkpAprvr" value="N/A"><TD class=ReportTableDataReturnFixed> &nbsp; </TD></logic:equal>    
		<logic:notEqual name="data" property="ilogonBkpAprvr" value="N/A"><TD class=ReportTableDataReturnFixed> XXX </TD></logic:notEqual>
        <TD class=ReportTableDataReturnVariableLeft><bean:write property="iupd" name="data"/> <bean:write property="date" name="data"/></TD>
        
        <input type="hidden" name="plantcode" value="<bean:write name='data' property='plantCode'/>"/>
        <input type="hidden" name="aprtype" value="<bean:write name='data' property='logonType'/>"/>
        <input type="hidden" name="supplrTyp" value="<bean:write name='data' property='supplrTyp'/>"/>
        <input type="hidden" name="disApvlLvl" value="<bean:write name='data' property='disApvlLvl'/>"/>
        
      </TR>
 
    </logic:iterate>
    </TBODY>
  </TABLE>
  <html:hidden name="DisputePlantEntryForm" property="logonId" />
  <br>
  <html:errors />
  <input type="hidden" name="noData" value="false">
  <logic:empty property="approvalList" name="DisputePlantEntryForm">
  	<div id="ErrorText">No data found.</div>
  	<script>
  		document.forms[0].noData.value="true";
  	</script>
  </logic:empty>
  <br>
  <CENTER>
    <INPUT name=Process type="button" onclick="submitSelection()" value="<%= ApplicationConstants.BUTTON_PROCESS%>" class="button">
    &nbsp; &nbsp;&nbsp; &nbsp;
    <INPUT value="<%= ApplicationConstants.BUTTON_CLEAR%>" type=reset name=clearx class=button>
  </CENTER>
  <input type="hidden" name="passdata" id="passdata" value=""/>
  <input type="hidden" name="modpassdata" id="modpassdata" value=""/>
  <html:hidden name="DisputePlantEntryForm" property="formData"/>
</html:form>

<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</HTML>
