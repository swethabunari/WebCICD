<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="java.util.ArrayList"%>  
<%@ page import="com.dcx.mfg.nct.web.core.forms.selection.CalendarSelectForm" %>
<%@ page import="com.dcx.mfg.nct.web.core.actions.selection.CalendarSelectAction" %>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants" %>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<%
CalendarSelectForm calendarForm = (CalendarSelectForm)request.getAttribute(CalendarSelectAction.CALENDAR_FORM);
Boolean output = (Boolean) request.getAttribute(CalendarSelectAction.OUTPUT_CALENDAR);
String defaultYear = (String) request.getAttribute(CalendarSelectAction.INPUT_MONTH);

ArrayList countryList = null;
ArrayList monthList = null;
ArrayList yearList = new ArrayList();
ArrayList countriesYearList = calendarForm.getCountriesYrsList(); 
String country = calendarForm.getCountryName(calendarForm.getCountry());

if(calendarForm.getCountryList() == null)
   countryList = calendarForm.buildCountryList();
else
   countryList = calendarForm.getCountryList();
   
if(calendarForm.getMonthList() == null)
   monthList = calendarForm.buildMonthList();
else
   monthList = calendarForm.getMonthList(); 

if(calendarForm.getYearList() != null)
    yearList = calendarForm.getYearList();

boolean buttonDisabled = (yearList.size() > 0) ? false : true ;

if(yearList.size() > 0 && defaultYear == null)
{
	Calendar cal = Calendar.getInstance();		
	defaultYear = "" + cal.get(Calendar.YEAR);	
}
 
%>
<html:html>
<HEAD>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM Software Development Platform">
<TITLE>Business Days Calendar</TITLE>
<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_detail_stylesheet.css">
<SCRIPT SRC="/NCTWeb/scripts/NCTBase.js" language="JavaScript">

</SCRIPT>
<script type="text/javascript">baseRefURL = '<%=com.dcx.mfg.nct.core.NCTURLResourceHelper.getHostName()%>';</script>
</HEAD>

<BODY> 
<nct:testSystemDisplay
	subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />

<H1><A class="overviewHelp"
	href="javascript:termsPopup
    ('QNC8100T','webovervw upd');" >Business Days Calendar</A></H1> 
<html:form action="/CalendarSelect.nct">
<table align="Center">
	<tr>
		<td>Country </td><td><html:select property="country"  
		onchange="document.CalendarSelectForm.submit();" 
		onfocus="window.status='Select a Country to search on.'; return true;"> 
	
			<html:optionsCollection property="countryList" /> </html:select>
			</td> <td></td><td></td> <td>Year</td> <td> <html:select property="year" value="<%=defaultYear%>"  onfocus="window.status='Select a Year to search on.'; return true;"> 
			<%if(yearList.size() > 0){%><html:optionsCollection property="yearList" /> <%} %> </html:select>			
		</td>
		<td></td><td></td> 
		<td>Month</td> <td> <html:select property="month" onfocus="window.status='Select a month to search on.'; return true;"> 
			<html:optionsCollection property="monthList" /> </html:select>			
		</td><td></td><td></td>
</table>		
<br>
	<br>
<%if(yearList.size() == 0){%>
<div id="ErrorText">
No data for <%=country %>
</div>
	<br>	 
<%} %>	
	<div align=center>
	<table border="0">
		<tr> 
			<td colspan="6">
			<div class="button">
			<html:submit alt="Retrieve"  styleClass="button" property="button" value="<%=ApplicationConstants.BUTTON_RETRIEVE%>" disabled="<%=buttonDisabled%>"/>
			</div>
			</td>
		</tr>
	</table>
	</div>
<br>		
		
			
		
	

</html:form>

<% if(output != null) {%><div align="center"><nct:CalendarSelectDetail /></div> <%} %>

<SCRIPT SRC="/NCTWeb/scripts/NCTSystemFooter.js" language="JavaScript"></SCRIPT>

<%@ include file="/jspf/copyright.jspf"%>

</BODY>
</html:html>
