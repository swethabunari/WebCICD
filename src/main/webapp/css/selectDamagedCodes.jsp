<HTML>

<HEAD>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="java.util.Calendar"%>
<jsp:useBean id="PopupNcCodeForm"
	class="com.dcx.mfg.nct.web.core.forms.selection.PopupNcCodeForm"
	scope="request" />

<TITLE>DRDR Damage Codes</TITLE>

<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_detail_stylesheet.css">

<SCRIPT SRC="/NCTWeb/scripts/NCTBase.js" language="JavaScript">

</SCRIPT>


<script type="text/javascript">baseRefURL = '<%=com.dcx.mfg.nct.core.NCTURLResourceHelper.getHostName()%>';</script>
<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/selectionXfer.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/setSelection.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/misc_Listbox_functions.js"
	language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>

<!-- This if allows parms to be sent in different ways.
-->
<SCRIPT language="JavaScript">
<!-- start hiding JavaScript code
DMCodeTypeValue = opener.DMCodeType;
DMCode1 = opener.DMCode1;
DMCode2 = opener.DMCode2;
DMCode3 = opener.DMCode3;
DMCode4 = opener.DMCode4;
DMCode5 = opener.DMCode5;
DMDesc1 = opener.DMDesc1;
DMDesc2 = opener.DMDesc2;
DMDesc3 = opener.DMDesc3;
DMDesc4 = opener.DMDesc4;
DMDesc5 = opener.DMDesc5;

function closeAndReturn() {
/* This function passes the data back to the         */
/* opening window and closes this window.            */

   var ListBoxValues = new Array;
   var ListBoxText   = new Array;
   DMCode1.value = " ";
   DMCode2.value = " ";
   DMCode3.value = " ";
   DMCode4.value = " ";
   DMCode5.value = " ";
   DMDesc1.value = " ";
   DMDesc2.value = " ";
   DMDesc3.value = " ";
   DMDesc4.value = " ";
   DMDesc5.value = " ";

   selectedListboxValues(document.PopupNcCodeForm.ncCodeSelected, ListBoxValues, ListBoxText);
   for (var x = 0; x < ListBoxValues.length; x++) {
      if (x == 0) {
         DMCode1.value = ListBoxValues[x];
         DMDesc1.value = ListBoxText[x];
      }
      else if (x == 1) {
         DMCode2.value = ListBoxValues[x];
         DMDesc2.value = ListBoxText[x];
      }
      else if (x == 2) {
         DMCode3.value = ListBoxValues[x];
         DMDesc3.value = ListBoxText[x];
      }
      else if (x == 3) {
         DMCode4.value = ListBoxValues[x];
         DMDesc4.value = ListBoxText[x];
      }
      else if (x == 4) {
         DMCode5.value = ListBoxValues[x];
         DMDesc5.value = ListBoxText[x];
      }
      else {
         ;
      }
   } // for statement

   DMCode1.focus();
   window.opener.focus();
   window.close();

} // closeAndReturn function
// End hiding of JavaScript -->
</SCRIPT>
</HEAD>
<BODY class="popup">
<html:form action="/selectNcCode.nct" method="post">

	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<H1><logic:equal property="codeType" value="M" name="PopupNcCodeForm">
		<A class="overviewHelp" HREF="#"
			onClick="termsPopup('qnc2050t','webovervw inq');">DRDR Damage Part
		Codes</A>
	</logic:equal> <logic:notEqual property="codeType" value="M"
		name="PopupNcCodeForm">
		<A class="overviewHelp" HREF="#"
			onClick="termsPopup('qnc2060t','webovervw inq');">DRDR Damage Rack
		Codes</A>
	</logic:notEqual></H1>
	<A class="NoLine" HREF="#"
		onClick="helpPopup('QNCWEB','nctdamagecode search');"> </A>
	<DIV align="center">
	<hr>
	<p>Select up to 5 Damage Codes. To select more than one, hold down the
	&lt;cntl&gt; key and use the mouse to select another code.</p>
	<table border=0>
		<tr>
			<td><html:select property="ncCodeSelected" multiple="10" size="10"
				onchange="checkForMaxSelected(document.PopupNcCodeForm.ncCodeSelected,'5');">
				<html:optionsCollection property="ncCodeList" label="value"
					value="code" />
			</html:select></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><html:button property="button" onclick="closeAndReturn();"
				value="Return" /><BR>
			<html:button property="button"
				onclick="clearListbox(document.PopupNcCodeForm.ncCodeSelected);"
				value="Clear" /></td>
		</tr>
	</table>
	<SCRIPT language="JavaScript1.2">
		prefillArray = new Array;
		prefillArray[0] = DMCode1.value;
		prefillArray[1] = DMCode2.value;
		prefillArray[2] = DMCode3.value;
		prefillArray[3] = DMCode4.value;
		prefillArray[4] = DMCode5.value;
		setListBoxSelection(document.PopupNcCodeForm.ncCodeSelected, prefillArray);
	</SCRIPT></DIV>
</html:form>

<%@ include file="/jspf/copyright.jspf"%>

</BODY>
</HTML>
