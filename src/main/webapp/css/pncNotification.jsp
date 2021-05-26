<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ include file="/jspf/processing.jspf"%>

<html>
<HEAD>
<title>PNC Notification</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<LINK rel=STYLESHEET type=text/css href="/NCTWeb/theme/nct_report_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_detail_stylesheet.css">
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/processingGif.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/processingGif.js" language="JavaScript"></SCRIPT>
<SCRIPT language="Javascript" src="/NCTWeb/scripts/padField.js"></SCRIPT>
<META name=GENERATOR content="MSHTML 8.00.6001.19258">

<script type="text/javascript">

function trim(inString) {
	return inString.replace(/^\s+|\s+$/g,'');
}

function checkEntries(){
	var action_stat = document.forms[0].action_stat;
	var activ_stat =  document.forms[0].activ_stat;
	
	for(var i=0; i < action_stat.length; i++) {
		var prev_days = document.forms[0].days[i].value;
		var new_days = document.forms[0].lev_days[i].value;
		var prev_state = document.forms[0].state[i].value;
		
		/*alert("Action " + i + " : "+ action_stat[i].value);
		alert("Days  old:new --> " + prev_days + " : " + new_days);
		alert("Status  old:new --> " + prev_state + " : " + activ_stat[i].value);
		*/
		if(prev_days != new_days){		
			if(!isNaN(new_days)){
				if(action_stat[i].value == "U") {				
					var j=0;
					while(j < 4){
						var otherLev_days = parseInt(document.forms[0].lev_days[j].value);						
						if(j < i){
							//alert("i : j = " + i + " : " + j + " Parsed days compared: " + otherLev_days + " > " + new_days );
							if( activ_stat[j].value == "A" && otherLev_days > parseInt(new_days)){
								alert(" Higher levels' timeframes must be greater than the lower levels. Please correct and retry");
								document.forms[0].lev_days[i].focus();
								return false;								
							}
						}
						if(j > i) {
							//alert("i : j = " + i + " : " + j + " Parsed days compared: " + otherLev_days + " < " + parseInt(new_days));
							if( activ_stat[j].value == "A" && otherLev_days < parseInt(new_days)){
								alert("Lower levels' timeframes must be less than the higher levels. Please correct and retry");
								document.forms[0].lev_days[i].focus();
								return false;
							}
						}	
						j++;
					}
				}else {
					alert("Please choose an action to update Timeframe");
					document.forms[0].action_stat[i].focus();
					return false;	
				}		
			}
			else {
				alert("Timing must be numeric. Please correct and retry");
				document.forms[0].lev_days[i].focus();
				return false;
			}
		}else if(prev_state != activ_stat[i].value && action_stat[i].value != "U") {
			alert("Please choose an action to update the state");
			document.forms[0].action_stat[i].focus();	
			return false;
		}else if(prev_state == "I" && activ_stat[i].value == "A" && action_stat[i].value == "U") {
			var k = 0;
			while(k < 4) {
				var other_timeframe = parseInt(document.forms[0].lev_days[k].value);
				if(k < i){
					if(activ_stat[k].value == "A" && other_timeframe > parseInt(prev_days)) {
						alert("The state cannot be activated since its lower level's time frame is high.");
						document.forms[0].lev_days[k].focus();	
						return false;
					}
				}
				if(k> i){
					if(activ_stat[k].value == "A" && other_timeframe < parseInt(prev_days)) {
						alert("The state cannot be activated since its higher level's time frame is low.");
						document.forms[0].lev_days[k].focus();	
						return false;
					}
				}
				k++;
			}
		}else if((prev_state == activ_stat[i].value && prev_days == new_days) && action_stat[i].value == "U") {
			action_stat[i].value = "";			
			return false;
		}			
	}
	showProcessingMessage('show');	
	document.forms[0].submit();
	return true;
}

function init()
{
   showProcessingMessage('hide');
}

function clearEntries(){
	var action_stat = document.forms[0].action_stat;
	
	for(var i=0; i<action_stat.length; i++) {
		var state = trim(document.forms[0].state[i].value);
		document.forms[0].action_stat[i].value = "";
		document.forms[0].activ_stat[i].value = state;
		document.forms[0].lev_days = document.forms[0].days[i].value;
		document.forms[0].go.value="";
	}
}
</script>

</head>

<body onLoad="init()">
<html:form action="/pnc.nct" method="POST" >
	<nct:testSystemDisplay subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<h1>PNC Notification Timing View</h1>
	<hr>
	
	<table class="ReportDataReturnDataDefault" border=1 width="100%">
    <tbody>
    	<tr>
    		<logic:equal name="showDivisionAdmin" scope="session" value="true"> 
    		<th class="ReportHeadingNames" colspan=1 rowspan="1" scope=col><p>Action</p></th> 
    		</logic:equal>    		  				
    		<th class="ReportHeadingNames" colspan=1 rowspan="1" scope=col><p>Notification Level</p></th>
    		<th class="ReportHeadingNames" colspan=1 rowspan="1" scope=col><p>TimeFrame (Days)</p></th>
    		<th class="ReportHeadingNames" colspan=1 rowspan="1" scope=col><p>Active</p></th>
    		<th class="ReportHeadingNames" colspan=1 rowspan="1" scope=col><p>Last Updated By/Date</p></th>
    	</tr>
    	
    	<logic:iterate id="pncId" name="PNCForm" property="pncNTFList" type="com.dcx.mfg.nct.databean.core.PNCNotificationBean" >
    	<tr>    	
    		<!-- Action -->	
        	<logic:equal name="showDivisionAdmin" scope="session" value="true">        	      	     	
        	<td class="ReportTableDataReturnFixed">
        		<html:select name="PNCForm" property="action_stat" value="">
					<html:optionsCollection name="PNCForm" property="updateList" />
				</html:select>
			</td>			
			</logic:equal>
			
			<!-- Notification Level -->
			<td class="ReportTableDataReturnVariableLeft">
				<logic:equal name="pncId" property="pncLevel" value='1'>Level 1 - Originator PNC Notification</logic:equal>
				<logic:equal name="pncId" property="pncLevel" value='2'>Level 2 - Manager PNC Notification</logic:equal>
				<logic:equal name="pncId" property="pncLevel" value='3'>Level 3 - Senior Manager PNC Notification</logic:equal>
				<logic:equal name="pncId" property="pncLevel" value='4'>Level 4 - Overdue PNC Notification</logic:equal>
				<html:hidden property="lev_change" value='<%=pncId.getPncLevel() %>' />
			</td>
			
			<!-- Timeframe in Days -->
			<logic:equal name="showDivisionAdmin" scope="session" value="true">  
			<td class="ReportTableDataReturnFixed">
				<logic:equal name="pncId" property="levActive" value="A">
					<input type="text" name="lev_days" value="<bean:write name='pncId' property='no_of_Days'/>"/>
				</logic:equal>
				<logic:equal name="pncId" property="levActive" value="I">
					<bean:write name='pncId' property='no_of_Days'/>
					<html:hidden property = "lev_days" value="<%= pncId.getNo_of_Days()%>" />
				</logic:equal>
				<html:hidden property="days" value="<%= pncId.getNo_of_Days()%>"/>
			</td>
			</logic:equal>
			
			<logic:notEqual name="showDivisionAdmin" scope="session" value="true">			 
			<td class="ReportTableDataReturnFixed">
				<bean:write name="pncId" property="no_of_Days" />
			</td>
			</logic:notEqual>	
				
			<!-- State -->
			<logic:equal name="showDivisionAdmin" scope="session" value="true">				
			<td class="ReportTableDataReturnFixed">        	
        		<html:select name="PNCForm" property="activ_stat" value="<%=pncId.getLevActive()%>">
					<html:optionsCollection name="PNCForm" property="stateList" />
				</html:select>
				<html:hidden property="state" value="<%=pncId.getLevActive()%>" />
			</td>
			</logic:equal>
			
			<logic:notEqual name="showDivisionAdmin" scope="session" value="true">
			<td class="ReportTableDataReturnFixed">  
				<logic:equal name="pncId" property="levActive" value="A">Yes</logic:equal>
				<logic:equal name="pncId" property="levActive" value="I">No</logic:equal>				
			</td>
			</logic:notEqual>  
		
			<!-- Who updated -->
			<td class="ReportTableDataReturnVariableLeft"><bean:write name="pncId" property="levUpd_User_On"/></td>			
    	</tr>
    	</logic:iterate>    	
    </tbody>
	</table>
    <br>
    <br>
	<html:errors property="msg" />
	<br>	
  	<br>  
  	<logic:equal name="showDivisionAdmin" scope="session" value="true">
  	<CENTER>
   		<INPUT onclick="return checkEntries()" value="Process Entries" type='submit' name='Process' class='button' />
   		<html:hidden name="PNCForm" property="go" value = "Update"/>
   		&nbsp; &nbsp;
		<INPUT onclick="clearEntries();" value="Clear Entries" type='reset' name='clearx' class='button'  />
  	</CENTER>
  	</logic:equal>  	
  	<br>
  	<br>  	
  	<p>Note: Timeframes are calculated based on the US Business Days Calendar</p>
  	<br>
  	<br>
</html:form>  	
</body>
<%@ include file="/jspf/copyright.jspf"%>
</html>