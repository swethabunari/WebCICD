<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ErrorMessageText"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<jsp:useBean id="ILCCarrierForm"
	class="com.dcx.mfg.nct.web.core.forms.summary.ILCCarrierForm"
	scope="request" />
<html:html>
<%@ include file="/jspf/processing.jspf"%>
<HEAD>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM Software Development Platform">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="/NCTWeb/theme/nct_default_stylesheet.css" rel="stylesheet"
	type="text/css">
<LINK href="/NCTWeb/theme/nct_report_stylesheet.css" rel="stylesheet"
	type="text/css">
<TITLE>Carrier/Consolidator Disputed Ticket Summary</TITLE>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/misc_radio_functions.js"
	language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/processingGif.js" language="JavaScript"></SCRIPT>
	
<SCRIPT SRC="/NCTWeb/scripts/NCTBase.js" language="JavaScript">

</SCRIPT>



<script type="text/javascript">baseRefURL = '<%=com.dcx.mfg.nct.core.NCTURLResourceHelper.getHostName()%>';</script>
<SCRIPT language="JavaScript">

function returnObjectValue(formObj)
{
/*  This function searches the radio button to get the        */
/*  selected data.                                            */
  var i=0;
  var SelectedRecord = " ";
  if (formObj.length == null) {
     if (formObj.value != null && formObj.value !="") {
        SelectedRecord = formObj.value;
     } // if
  }
  else {
     for (i=0; i < formObj.length; i++) {
        if (formObj.value[i] != null && formObj.value[i] !="") {
           SelectedRecord = formObj[i].value;
        } // if
     } // for
  }  // length else

  return(SelectedRecord);
}




</SCRIPT>
<%@ include file="/jspf/core/navigationButtonFunction.jspf"%>
</HEAD>

<BODY onload="showProcessingMessage('hide');">
<html:form action="/carrierDisputedSummary.nct">
	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />

	<H1><A class="overview"
		HREF="javascript:termsPopup('QNC5161T','webovervw');">
	Carrier/Consolidator Disputed Ticket Summary </A></H1>

	<hr>
	<html:hidden property="actionMode" name="ILCCarrierForm"
		value="<%= NavigationConstants.ACTION_MODE_INQUIRE%>" />

	<table border=0 width=100%>
		<tr>
			<logic:equal property="responsibilityCode" name="ILCCarrierForm"
				value="C">
				<td class="ReportTagnameReturn">Carrier:</td>
			</logic:equal>
			<logic:equal property="responsibilityCode" name="ILCCarrierForm"
				value="L">
				<td class="ReportTagnameReturn">Consolidator:</td>
			</logic:equal>
			<td class="ReportHeaderDataReturn" colspan="3"><bean:write
				property="carrierConsolidatorCode" name="ILCCarrierForm" /><html:hidden
				property="carrierConsolidatorCode" name="ILCCarrierForm" />&nbsp;<bean:write
				property="carrierConsolidatorName" name="ILCCarrierForm" /><html:hidden
				property="carrierConsolidatorName" name="ILCCarrierForm" /></td>
		</tr>
		<tr>
			<td class="ReportTagnameReturn">Responsibility:</td>
			<td class="ReportHeaderDataReturn" colspan="3"><bean:write
				property="responsibilityCodeDescription" name="ILCCarrierForm" /><html:hidden
				property="responsibilityCodeDescription" name="ILCCarrierForm" /><html:hidden
				property="responsibilityCode" name="ILCCarrierForm" /></td>
		</tr>
		<tr>
			<td class="ReportTagnameReturn">Part Number:</td>
			<td class="ReportHeaderDataReturn" colspan="3"><bean:write
				property="partNumber" name="ILCCarrierForm" /><html:hidden
				property="partNumber" name="ILCCarrierForm" />&nbsp;<bean:write
				property="partNumberDescription" name="ILCCarrierForm" /><html:hidden
				property="partNumberDescription" name="ILCCarrierForm" /></td>
		</tr>
		<tr>
			<td class="ReportTagnameReturn">Plant Code:</td>
			<td class="ReportHeaderDataReturn" colspan="3"><bean:write
				property="originatingPlantCode" name="ILCCarrierForm" /><html:hidden
				property="originatingPlantCode" name="ILCCarrierForm" />&nbsp;<bean:write
				property="originatingPlantName" name="ILCCarrierForm" /><html:hidden
				property="originatingPlantName" name="ILCCarrierForm" /></td>
		</tr>
		<tr>
			<td class="ReportTagnameReturn">Dispute Status:</td>
			<td class="ReportHeaderDataReturn" colspan="3"><bean:write
				property="statusDescription" name="ILCCarrierForm" /><html:hidden
				property="statusDescription" name="ILCCarrierForm" /><html:hidden
				property="statusCode" name="ILCCarrierForm" /></td>

		</tr>
		<tr>
			<td class="ReportTagnameReturn">From Date:</td>
			<td class="ReportHeaderDataReturn"><nct:DisplayUSNumericDate
				month="<%= ILCCarrierForm.getFromDateMonth()%>"
				day="<%= ILCCarrierForm.getFromDateDay()%>"
				year="<%= ILCCarrierForm.getFromDateYear2()%>" /><html:hidden
				property="fromDateMonth" name="ILCCarrierForm" /><html:hidden
				property="fromDateDay" name="ILCCarrierForm" /><html:hidden
				property="fromDateYear2" name="ILCCarrierForm" /></td>
			<td class="ReportTagnameReturn">To Date:</td>
			<td class="ReportHeaderDataReturn"><nct:DisplayUSNumericDate
				month="<%= ILCCarrierForm.getToDateMonth()%>"
				day="<%= ILCCarrierForm.getToDateDay()%>"
				year="<%= ILCCarrierForm.getToDateYear2()%>" /><html:hidden
				property="toDateMonth" name="ILCCarrierForm" /><html:hidden
				property="toDateDay" name="ILCCarrierForm" /><html:hidden
				property="toDateYear2" name="ILCCarrierForm" /></td>
			<td colspan=2>&nbsp;</td>
		</tr>
	</table>
	<hr>
	<br>
	<nct:CarrierConsolidatorDisputedSummaryDetailDisplay />
	<br>
	<logic:empty name="ILCCarrierForm" property="recordCount">
		<div class="CommentTextStyle"><%=ErrorMessageText.NO_RECORDS_DISPLAY%>
		</div>
	</logic:empty>
	<logic:notEmpty name="ILCCarrierForm" property="recordCount">
		<div class="CommentTextStyle"><%=ErrorMessageText.NUMBER_OF_RECORDS_DISPLAYED%>
		<bean:write property="recordCount" name="ILCCarrierForm" /></div>
	</logic:notEmpty>
	<br>
	<html:errors />

	<div class="button">Choose an Action: <br>
	<logic:notEmpty property="recordCount" name="ILCCarrierForm">
		<logic:equal property="viewExpandedReport" name="ILCCarrierForm"
			value="Y">
			<html:submit
				alt="<%= ApplicationConstants.BUTTON_VIEW_NORMAL_REPORT%>"
				styleClass="button" property="button"
				value="<%= ApplicationConstants.BUTTON_VIEW_NORMAL_REPORT%>"
				onclick="showProcessingMessage('show');" />
		</logic:equal>
		<logic:notEqual property="viewExpandedReport" name="ILCCarrierForm"
			value="Y">
			<html:submit
				alt="<%= ApplicationConstants.BUTTON_VIEW_EXPANDED_REPORT%>"
				styleClass="button" property="button"
				value="<%= ApplicationConstants.BUTTON_VIEW_EXPANDED_REPORT%>"
				onclick="showProcessingMessage('show');" />
		</logic:notEqual>
	</logic:notEmpty> <INPUT class="button" TYPE="BUTTON"
		value="Enter New Search Criteria"
		onclick="window.location='/NCTWeb/core/carrierDisputedSummaryEntry.nct';">
	<INPUT class="button" TYPE="BUTTON" VALUE="Back"
		onclick="history.back();"></div>

	<br>
	<logic:notEmpty property="recordCount" name="ILCCarrierForm">		
		<div class="button">Transfer to Inquiry: <br>
		<html:submit property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_POTENTIAL_NOTIFICATION_2%>"
			styleClass="button"
			value="<%= ApplicationConstants.BUTTON_POTENTIAL_NOTIFICATION_2%>"
			onclick="javascript:setButtonActionMode('I');showProcessingMessage('show');" />
		<html:submit property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_WORKSHEET%>" styleClass="button"
			value="<%= ApplicationConstants.BUTTON_WORKSHEET%>"
			onclick="javascript:setButtonActionMode('I');showProcessingMessage('show');" />
		<html:submit property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_VIEW_DOCUMENT%>"
			styleClass="button"
			value="<%= ApplicationConstants.BUTTON_VIEW_DOCUMENT%>"
			onclick="showProcessingMessage('show');" /><html:submit
			property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_TICKET_HISTORY%>"
			styleClass="button"
			value="<%= ApplicationConstants.BUTTON_TICKET_HISTORY%>"
			onclick="showProcessingMessage('show');" /></div>
		<br>
		<div class="button">Transfer to Update: <br>
		<html:submit property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_POTENTIAL_NOTIFICATION_2%>"
			styleClass="button"
			value="<%= ApplicationConstants.BUTTON_POTENTIAL_NOTIFICATION_2%>"
			onclick="javascript:setButtonActionMode('U');showProcessingMessage('show');" />
		<html:submit property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_WORKSHEET%>" styleClass="button"
			value="<%= ApplicationConstants.BUTTON_WORKSHEET%>"
			onclick="javascript:setButtonActionMode('U');showProcessingMessage('show');" />
		<html:submit property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_TICKET_DISPUTE%>"
			styleClass="button"
			value="<%= ApplicationConstants.BUTTON_TICKET_DISPUTE%>"
			onclick="showProcessingMessage('show');" /> <html:submit
			property="navigationButton"
			alt="<%= ApplicationConstants.BUTTON_ATTACH_DOCUMENT%>"
			styleClass="button"
			value="<%= ApplicationConstants.BUTTON_ATTACH_DOCUMENT%>"
			onclick="showProcessingMessage('show');" /></div>
	</logic:notEmpty>
	<br>


</html:form>
<SCRIPT SRC="/NCTWeb/scripts/NCTSystemFooter.js" language="JavaScript"></SCRIPT>

<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</html:html>
