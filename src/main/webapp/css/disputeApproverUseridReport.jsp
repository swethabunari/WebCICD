<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<TITLE>Dispute Approver List - By UserId</TITLE>
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_detail_stylesheet.css">
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
   window.defaultStatus="Dispute Approver List - By UserId"

/* Set the cursor on the Supplier code initially         */
   with (document.DisputePlantEntryForm) {
   } // with
   showProcessingMessage('hide');
}
</script>
</HEAD>
<BODY onLoad="init()">
<html:form action="/disputeCpyRplceEntry.nct" method="POST">
	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<H1>Dispute Approver List</H1>
		<H2>By Userid </H2>
		<html:errors />
	<html:hidden property="<%=NavigationConstants.PARAMETER_GO%>"
		name="DisputePlantEntryForm" />
  <TABLE class=ReportTableInputDataDefault border=1 width="70%" align="center">
    <TBODY>
      <TR>
        <TD class=ReportTagnameReturn>Userid</TD>
        <TD class=ReportTableInputDataVariableLeft width=80%>
        	<bean:write property="sourceUserId" name="DisputePlantEntryForm"/>&nbsp;
        	<bean:write property="sourceUserName" name="DisputePlantEntryForm"/>&nbsp;
        	<logic:equal property="ilogonAprvrTyp" name="DisputePlantEntryForm" value="P">as Primary only</logic:equal>
        	<logic:equal property="ilogonAprvrTyp" name="DisputePlantEntryForm" value="B">as Backup only</logic:equal>
        	<logic:equal property="ilogonAprvrTyp" name="DisputePlantEntryForm" value="PB">as Primary or Backup</logic:equal>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
  <br>
  	<logic:notEmpty property="approvalList" name="DisputePlantEntryForm"> 
  <table class=ReportDataReturnDataDefault border=1 width="100%">
      <tr>
        <th rowspan=1 class=ReportHeadingNames><a class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','Role');">Plant</a> </th>
        <th  rowspan=1 class=ReportHeadingNames colspan="1"><a class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','User');">Dispute Level</a> </th>
        <th  rowspan=1 class=ReportHeadingNames>Supplier Type </th>
        <th  rowspan=1 class=ReportHeadingNames><a class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','User');">Role</a> </th>
        <th rowspan=1 class=ReportHeadingNames><a class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','User');">Notification Type </a> </th>
        <th rowspan=1 class=ReportHeadingNames><a class=ReportTagnameHelp 
      href="javascript:termsPopup('scapitem','Last  Updated By');">Last Updated 
          By/Date</a> </th>
      </tr>
      
      <logic:iterate scope="request" id="info"  property="divisionApprovals" name="DisputePlantEntryForm">
      <bean:define id="applist" name="info" property="value"></bean:define>
      <bean:define id="items" name="applist" property="bean"></bean:define>
      <% int counter = 0; %>
      <logic:iterate id="items" name="applist" property="bean">
      <% counter ++; %>
      <tr>
      <% if(counter == 1) { %>
      <td class=ReportTableDataReturnVariableLeft rowspan="<bean:write property="levelCount" name="applist"/>">
			<logic:equal name="showDivisionAdmin" scope="session" value="true">
        		<a href="disputePlantEntry.nct?go=<%=ApplicationConstants.LIST_DISPUTE_ROLES%>&plantCode=<bean:write property="plantCode" name="items"/>&plantDescrn=<bean:write property="plantDescrn" name="items"/>" style="text-decoration: none"><bean:write name="applist" property="plantName"/> </a>
			</logic:equal>
			<logic:notEqual name="showDivisionAdmin" scope="session" value="true">
        		<a href="disputeReportEntry.nct?go=<%=ApplicationConstants.GO_REPORT_BY_PLANT%>&plantCode=<bean:write property="plantCode" name="items"/>&originatingPlantCode=<bean:write property="plantCode" name="items"/>&plantDescrn=<bean:write property="plantDescrn" name="items"/>" style="text-decoration: none"><bean:write name="applist" property="plantName"/> </a>
			</logic:notEqual>
        </td>
        <% } %> 
       
        <logic:equal name="items" property="disApvlLvl" value="E1"><TD class=ReportTableDataReturnFixed>Dispute</TD></logic:equal>
        <logic:equal name="items" property="disApvlLvl" value="E2"><TD class=ReportTableDataReturnFixed>Escalated Dispute</TD></logic:equal>
        <logic:equal name="items" property="disApvlLvl" value="E3"><TD class=ReportTableDataReturnFixed>Executive Review</TD></logic:equal>
        <logic:equal name="items" property="supplrTyp" value="I"><TD class=ReportTableDataReturnFixed>Internal</TD></logic:equal>
        <logic:equal name="items" property="supplrTyp" value="E"><TD class=ReportTableDataReturnFixed>External</TD></logic:equal>
        <logic:equal name="items" property="ilogonAprvrTyp" value="P"><TD class=ReportTableDataReturnFixed>Primary</TD></logic:equal>
        <logic:equal name="items" property="ilogonAprvrTyp" value="B"><TD class=ReportTableDataReturnFixed>Backup</TD></logic:equal>
        <logic:equal name="items" property="notfcnTypPrmy" value="E"><TD class=ReportTableDataReturnFixed>eMail</TD></logic:equal>
        <logic:equal name="items" property="notfcnTypPrmy" value="P"><TD class=ReportTableDataReturnFixed>Pager</TD></logic:equal>
        <logic:equal name="items" property="notfcnTypPrmy" value="M"><TD class=ReportTableDataReturnFixed>Mobile-Phone</TD></logic:equal>
        <logic:equal name="items" property="notfcnTypBkp" value="E"><TD class=ReportTableDataReturnFixed>eMail</TD></logic:equal>
        <logic:equal name="items" property="notfcnTypBkp" value="P"><TD class=ReportTableDataReturnFixed>Pager</TD></logic:equal>
        <logic:equal name="items" property="notfcnTypBkp" value="M"><TD class=ReportTableDataReturnFixed>Mobile-Phone</TD></logic:equal>
        <TD class=ReportTableDataReturnVariableLeft><bean:write property="iupd" name="items"/> <bean:write property="date" name="items"/></TD>
      </tr>
      </logic:iterate>  
      </logic:iterate>
  </table>
  </logic:notEmpty>  
	<logic:empty property="approvalList" name="DisputePlantEntryForm">
		<div id="ErrorText">No data found</div>
	</logic:empty>
  <br>
	<logic:notEmpty property="approvalList" name="DisputePlantEntryForm">
		Data displayed.
	</logic:notEmpty>
  <br>
  <center>
    &nbsp; &nbsp;
    <INPUT name=Newlist type=button onClick="location.href ='/NCTWeb/core/disputeReportEntry.nct?go=disputeReportEntry&from=userid'" value="Select New Userid" class=button>
    &nbsp; &nbsp;
  </center>
 </html:form>
<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</HTML>
