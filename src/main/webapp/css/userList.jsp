
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
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
<TITLE>List of NCT Users</TITLE>
<SCRIPT SRC="/NCTWeb/scripts/NCTBase.js" language="JavaScript">

</SCRIPT>


<script type="text/javascript">baseRefURL = '<%=com.dcx.mfg.nct.core.NCTURLResourceHelper.getHostName()%>';</script>
</HEAD>

<BODY>
<html:form action="/userList">
	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<H1><A class="overviewHelp"
		HREF="javascript:termsPopup('QNC0570T','webovervw');"> List of NCT
	Users </A></H1>

	<table border="1" class="ReportTableInputDataDefault">
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('QNC0570T','start id');">Userids
			starting with:</A></td>
			<td class="ReportTagname"><html:text property="userid"
				name="UserListForm" size="7" maxlength="7"
				onfocus="this.select(); window.status='Enter User-Id. Must begin with S or T.';return true;"></html:text>
			</td>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','user location');">Location:</A></td>
			<td><html:text property="location" name="UserListForm" size="5"
				maxlength="5"
				onfocus="this.select();
                     window.status='Enter 4 or 5 numeric characters.';
                     return true;"></html:text>

			</td>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('general','user dept');">Department:</A></td>
			<td><html:text property="department" name="UserListForm" size="4"
				maxlength="4"
				onfocus="this.select();
                     window.status='Enter 4 numeric characters.';
                     return true;"></html:text>
			</td>
		</tr>
		<tr>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('QNC0570T','start name');">User Names
			starting with:</A></td>
			<td class="ReportTagname" colspan="1"><html:text property="userName"
				name="UserListForm" size="12" maxlength="12"
				onfocus="this.select();
                     window.status='Enter as much of the name known.';
                      return true;"></html:text>
			</td>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('QNC0570T','admin');">Administrator:</A>
			</td>
			<td><html:select property="flag" name="UserListForm">
				<html:optionsCollection property="flagList" />
			</html:select></td>
			<td class="ReportTagname"><A class="ReportTagnameHelp"
				HREF="javascript:termsPopup('QNC0570T','pie');">PSQ:</A></td>
			<td><html:select property="pieFlag" name="UserListForm">
				<html:optionsCollection property="pieFlagList" />
			</html:select></td>
		</tr>
	</TABLE>
	<br>
	<logic:notEmpty property="detailList" name="UserListForm">
		<table border="1" class="ReportDataReturnDataDefault">
			<thead>
				<tr>
					<th class="ReportHeadingNames">Userid</th>
					<th class="ReportHeadingNames">Name</th>
					<th class="ReportHeadingNames">PSQ</th>
					<th class="ReportHeadingNames">Privileges</th>
					<th class="ReportHeadingNames">Location</th>
					<th class="ReportHeadingNames">Department</th>
					<th class="ReportHeadingNames">Phone</th>
				</tr>
			</thead>

			<logic:iterate id="element" property="detailList" name="UserListForm"
				type="com.dcx.mfg.nct.databean.UserProfileBean">
				<tr>
					<td class="ReportTableDataReturnFixed"><bean:write name="element"
						property="userLogonId" />&nbsp;</td>
					<td class="ReportTableDataReturnVariableLeft"><bean:write
						name="element" property="userName" />&nbsp;</td>
					<td class="ReportTableDataReturnFixed"><bean:write name="element"
						property="userPIE" />&nbsp;</td>
					<td class="ReportTableDataReturnFixed"><bean:write name="element"
						property="userPrivileges" />&nbsp;</td>
					<td class="ReportTableDataReturnFixed"><bean:write name="element"
						property="userLocation" />&nbsp;</td>
					<td class="ReportTableDataReturnFixed"><bean:write name="element"
						property="userDepartment" />&nbsp;</td>
					<td class="ReportTableDataReturnVariableLeft"><bean:write
						name="element" property="phoneNumber" />&nbsp;</td>
				</tr>
			</logic:iterate>
		</table>
	</logic:notEmpty>
	<br>
	<html:errors />
	<br>
	<div align=center>
	<table border="0">
		<tr>
			<td colspan="6">
			<div class="button"><html:submit styleClass="button"
				property="button"
				value="<%= ApplicationConstants.BUTTON_RETRIEVE %>" /> <html:reset
				value="<%= ApplicationConstants.BUTTON_CLEAR %>" styleClass="button" />
			</div>
			</td>
		</tr>
	</table>
	</div>
</html:form>

<%@ include file="/jspf/copyright.jspf"%>

</BODY>
</html:html>
