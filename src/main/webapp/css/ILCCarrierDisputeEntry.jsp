<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
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
	
<SCRIPT SRC="/NCTWeb/scripts/NCTBase.js" language="JavaScript">

</SCRIPT>



<script type="text/javascript">baseRefURL = '<%=com.dcx.mfg.nct.core.NCTURLResourceHelper.getHostName()%>';</script>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/callCalendar.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/supplierSearchPopup.js"
	language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/plantDeptSearchPopup.js"
	language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/partNbrSearchPopup.js"
	language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/carrierConsolidatorPopup.js"
	language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/processingGif.js" language="JavaScript"></SCRIPT>
<SCRIPT language="JavaScript">




                                                                                    


</SCRIPT>
</HEAD>

<BODY onload="showProcessingMessage('hide');">
<html:form action="/carrierDisputedSummaryEntry.nct">
	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />

	<H1><A class="overview"
		HREF="javascript:termsPopup('QNC1111T','webovervw');">Carrier/Consolidator
	Disputed Ticket Summary</A></H1>


	<html:errors />
	<div align=center>
	<table class="ReportTableInputDataDefault" border=1>
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','Carrier');">Carrier or
			Consolidator</A></td>
			<td colspan="1"><nct:SummaryCarrierConsolidatorCodeDisplay
				formName="ILCCarrierForm"
				responsibilityProperty="responsibilityCode"
				carrierConsolidatorProperty="carrierConsolidatorCode" /></td>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','resp');">Responsibility</A></td>
			<td colspan="1"><html:select property="responsibilityCode"
				name="ILCCarrierForm"
				onfocus="window.status='Select a ticket responsibility to search on.';">
				<html:optionsCollection property="responsibilityList" />
			</html:select></td>
		</tr>
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','part#');">Part Number</A></td>
			<td colspan="3"><html:text property="partNumber" size="10"
				name="ILCCarrierForm" maxlength="10"
				onfocus="this.select();
                    window.status='Enter a Part number to search on.';" />
			<A
				HREF="javascript:partNbrSearchPopup(document.ILCCarrierForm.partNumber,
                                                  document.ILCCarrierForm.originatingPlantCode,
                                                  document.ILCCarrierForm.carrierConsolidatorCode,'');">
			<IMG SRC="/NCTWeb/images/search_button.gif" ALT="Search" BORDER=0></A></td>
		</tr>
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','orig plant code');">Plant
			Code</A></td>
			<td colspan="3"><html:select property="originatingPlantCode"
				name="ILCCarrierForm"
				onfocus="window.status='Select an Originating plant code to search on.';">
				<html:optionsCollection property="originatingPlantList" />
			</html:select></td>

		</tr>
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','NC status');">Dispute Status</A>
			<td colspan="3"><html:select property="statusCode"
				name="ILCCarrierForm"
				onfocus="window.status='Select a Ticket status to search on.';">
				<html:optionsCollection property="statusCodeList" />
			</html:select></td>
		</tr>
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','from date');">From Date</A></td>
			<td colspan="1"><html:text property="fromDateMonth"
				name="ILCCarrierForm" size="2" maxlength="2"
				onfocus="this.select();
                    window.status='Enter the From month to search on.';"
				readonly="true" /> <b> / </b> <html:text property="fromDateDay"
				name="ILCCarrierForm" size="2" maxlength="2"
				onfocus="this.select();
                    window.status='Enter the From day to search on.';"
				readonly="true" /> <b> / </b> <html:text property="fromDateYear2"
				name="ILCCarrierForm" size="2" maxlength="2"
				onfocus="this.select();
                    window.status='Enter the From year to search on.';"
				readonly="true" /> <A
				HREF="javascript:callCalendar_MMDDYY_split(document.ILCCarrierForm.fromDateMonth,
                           document.ILCCarrierForm.fromDateDay,document.ILCCarrierForm.fromDateYear2);">
			<IMG SRC="/NCTWeb/images/Calendar_June.gif" ALT="Calendar" BORDER=1></A></td>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','to date');">To Date</A></td>
			<td><html:text property="toDateMonth" name="ILCCarrierForm" size="2"
				maxlength="2"
				onfocus="this.select();
                    window.status='Enter the To month to search on.';"
				readonly="true" /> <b> / </b> <html:text property="toDateDay"
				name="ILCCarrierForm" size="2" maxlength="2"
				onfocus="this.select();
                    window.status='Enter the To day to search on.';"
				readonly="true" /> <b> / </b> <html:text property="toDateYear2"
				name="ILCCarrierForm" size="2" maxlength="2"
				onfocus="this.select();
                    window.status='Enter the To year to search on.';"
				readonly="true" /> <A
				HREF="javascript:callCalendar_MMDDYY_split(document.ILCCarrierForm.toDateMonth,
                           document.ILCCarrierForm.toDateDay,document.ILCCarrierForm.toDateYear2);">
			<IMG SRC="/NCTWeb/images/Calendar_June.gif" ALT="Calendar" BORDER=1></A></td>
		</tr>
	</TABLE>
	</DIV>

	<br>
	<div align=center>
	<TABLE border=1 width=100% class="ReportTableInputDataDefault" > <!-- SeRV01515775 -->
		<tr>
			<td class="ReportTableDataReturnFixed" colspan="3"><html:checkbox
				property="viewExpandedReport" value="Y">View Expanded Report</html:checkbox></td>
		</tr>
	</TABLE>
	</div>
	<br>
	<div align=center>
	<table border=0 width=100%>
		<tr>
			<td colspan="6">
			<div class="button"><html:submit styleClass="button"
				property="button"
				value="<%= ApplicationConstants.BUTTON_RETRIEVE %>"
				onclick="showProcessingMessage('show');" /> <html:reset
				value="<%= ApplicationConstants.BUTTON_CLEAR %>" styleClass="button" />
			</div>
			</td>
		</tr>
	</table>
	</div>
	<br>


</html:form>
<SCRIPT SRC="/NCTWeb/scripts/NCTSystemFooter.js" language="JavaScript"></SCRIPT>

<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</html:html>
