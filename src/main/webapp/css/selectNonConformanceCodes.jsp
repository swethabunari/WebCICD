<HTML>

<HEAD>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="java.util.Calendar"%>
<jsp:useBean id="PopupNcCodeForm" class="com.dcx.mfg.nct.web.core.forms.selection.PopupNcCodeForm" scope="request"/>

<TITLE>Non-Conformance Codes</TITLE>

<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css"
	HREF="/NCTWeb/theme/nct_detail_stylesheet.css">

<SCRIPT SRC="/NCTWeb/scripts/NCTBase.js" language="JavaScript">

</SCRIPT>


<script type="text/javascript">baseRefURL = '<%=com.dcx.mfg.nct.core.NCTURLResourceHelper.getHostName()%>';</script>
<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/selectionXfer.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/misc_Listbox_functions.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/setSelection.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>

<SCRIPT language="JavaScript">
<!-- start hiding JavaScript code
	codeType = opener.NCDivision;
	NCCode = opener.NCCode;
	NCDesc = opener.NCDesc;

/* define and build code arrays. */
   var AssemblyCode = new Array();
   var AssemblyDesc = new Array();
   var ComponentCode = new Array();
   var ComponentDesc = new Array();
   var PowertrainCode = new Array();
   var PowertrainDesc = new Array();
   var MoparCode = new Array();
   var MoparDesc = new Array();
   var StampingCode = new Array();
   var StampingDesc = new Array();
   var SteelCode = new Array();
   var SteelDesc = new Array();
   var AsmStmpCode = new Array();
   var AsmStmpDesc = new Array();
   var AsmPwrtCode = new Array();
   var AsmPwrtDesc = new Array();

function loadup(){
/* This function will load the Form data 			*/
/* into javascript variables						*/

   var AssemblyCodeStr = document.PopupNcCodeForm.assemblyCodes.value;
   var AssemblyDescStr = document.PopupNcCodeForm.assemblyDesc.value;   
   var ComponentCodeStr = document.PopupNcCodeForm.componentCodes.value;
   var ComponentDescStr = document.PopupNcCodeForm.componentDesc.value;   
   var SteelCodeStr = document.PopupNcCodeForm.steelCodes.value;
   var SteelDescStr = document.PopupNcCodeForm.steelDesc.value;   
   var MoparCodeStr = document.PopupNcCodeForm.moparCodes.value;
   var MoparDescStr = document.PopupNcCodeForm.moparDesc.value;   
   var PowertrainCodeStr = document.PopupNcCodeForm.powertrainCodes.value;
   var PowertrainDescStr = document.PopupNcCodeForm.powertrainDesc.value;   
   var StampingCodeStr = document.PopupNcCodeForm.stampingCodes.value;
   var StampingDescStr = document.PopupNcCodeForm.stampingDesc.value;   
   var AsmStmpCodeStr = document.PopupNcCodeForm.asmStmpCodes.value;
   var AsmStmpDescStr = document.PopupNcCodeForm.asmStmpDesc.value;   
   var AsmPwrtCodeStr = document.PopupNcCodeForm.asmPwrtCodes.value;
   var AsmPwrtDescStr = document.PopupNcCodeForm.asmPwrtDesc.value;   
	
   AssemblyCode = AssemblyCodeStr.split(";");
   AssemblyDesc = AssemblyDescStr.split(";");
   ComponentCode = ComponentCodeStr.split(";");
   ComponentDesc = ComponentDescStr.split(";");
   SteelCode = SteelCodeStr.split(";");
   SteelDesc = SteelDescStr.split(";");
   MoparCode = MoparCodeStr.split(";");
   MoparDesc = MoparDescStr.split(";");
   PowertrainCode = PowertrainCodeStr.split(";");
   PowertrainDesc = PowertrainDescStr.split(";");
   StampingCode = StampingCodeStr.split(";");
   StampingDesc = StampingDescStr.split(";");
   AsmStmpCode = AsmStmpCodeStr.split(";");
   AsmStmpDesc = AsmStmpDescStr.split(";");
   AsmPwrtCode = AsmPwrtCodeStr.split(";");
   AsmPwrtDesc = AsmPwrtDescStr.split(";");
}// end of loadup

function setCheckboxSelection(formObj,formValue) {
/*  This function receives a value and a checkbox list. */
/*  If the value is listed in the checkbox list, then   */
/*  it is markec as checked.                            */
   if ( formValue == null)
      ;
   else {
      for (var x = 0; x < formObj.length; x++)
        if (formObj[x].value == formValue)
            formObj[x].checked = true;
   } // formValue null else

} // end setCheckboxSelection function


function closeAndReturn() {
/* This function passes the data back to the         */
/* opening window and closes this window.            */

   var ListBoxValues = new Array;
   var ListBoxText   = new Array;
   codeType = " ";
   NCCode.value = " ";
   NCDesc.value = " ";

   selectedListboxValues(document.PopupNcCodeForm.ncCodeSelected, ListBoxValues, ListBoxText);
   for (var x = 0; x < ListBoxValues.length; x++) {
      if (x == 0) {
         NCCode.value = ListBoxValues[x];
         NCDesc.value = ListBoxText[x];
      }
      else {
         ;
      }
   } // for statement

   window.close();

} // closeAndReturn function

function buildSelectStatement(formObj,codeArray,descArray) {
/* This function builds the select statement that    */
/* the user will use to select the Non-Conformance   */
/* Code.                                             */
   formObj.length = 1;
   for (var x=0;x < codeArray.length;x++) {
      formObj.length = formObj.length + 1;
      formObj.options[x+1].value = codeArray[x];
      formObj.options[x+1].text  = descArray[x];
   } // for
} // buildSelectStatement

function changeSelectStatement() {
/* This function searches the radio buttons and      */
/* builds the select statement for the selected      */
/* button.                                           */

   if (codeType.value == 'G') {
         document.PopupNcCodeForm.headingText.value = "Assembly to Stamping  ";
         buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,AsmStmpCode,AsmStmpDesc);
   }
   else
      {
      if (codeType.value == 'H') {
            document.PopupNcCodeForm.headingText.value = "Assembly to Powertrain";
            buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,AsmPwrtCode,AsmPwrtDesc);
      }
      else
         {
         var NCDivisionSelected = "";
          for (var y=0;y<document.PopupNcCodeForm.codeType.length;y++) {
            if (document.PopupNcCodeForm.codeType[y].checked)
               NCDivisionSelected = document.PopupNcCodeForm.codeType[y].value;
           }//for radio loop
         switch  (NCDivisionSelected) {
            case "A":
               document.PopupNcCodeForm.headingText.value = "         Assembly         ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,AssemblyCode,AssemblyDesc);
               break;
            case "B":
               document.PopupNcCodeForm.headingText.value = "        Components        ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,ComponentCode,ComponentDesc);
               break;
            case "C":
               document.PopupNcCodeForm.headingText.value = "          Mopar           ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,MoparCode,MoparDesc);
               break;
            case "D":
               document.PopupNcCodeForm.headingText.value = "        Powertrain        ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,PowertrainCode,PowertrainDesc);
               break;
            case "E":
               document.PopupNcCodeForm.headingText.value = "        Stamping          ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,StampingCode,StampingDesc);
               break;
            case "F":
               document.PopupNcCodeForm.headingText.value = "         Steel            ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,SteelCode,SteelDesc);
               break;
            case "G":
               document.PopupNcCodeForm.headingText.value = "  Assembly to Stamping    ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,AsmStmpCode,AsmStmpDesc);
               break;
            case "H":
               document.PopupNcCodeForm.headingText.value = "  Assembly to Powertrain  ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,AsmPwrtCode,AsmPwrtDesc);
               break;
            default:
               document.PopupNcCodeForm.headingText.value = "         Assembly         ";
               buildSelectStatement(document.PopupNcCodeForm.ncCodeSelected,AssemblyCode,AssemblyDesc);
               document.PopupNcCodeForm.codeType.checked = true;
               break;
         } // switch
      }
   }

   if (NCCode.value != "") {
      clearListbox(document.PopupNcCodeForm.ncCodeSelected);
      setDropdownSelection(document.PopupNcCodeForm.ncCodeSelected,NCCode.value);
   } // set NCCode

} // changeSelectStatement

function setInitialSelect() {
/* This function sets the select to an initial       */
/* value.                                            */
	loadup();
   if (codeType != "") {
      setCheckboxSelection(document.PopupNcCodeForm.codeType,codeType);
   } 
   changeSelectStatement();

} // setInitialSelect
// End hiding of JavaScript -->
</SCRIPT>

</HEAD>
<BODY class="popup" >
<html:form action="/selectNonConformanceCode.nct" method="post" > 
<html:hidden property="assemblyCodes" name="PopupNcCodeForm"/>
<html:hidden property="assemblyDesc" name="PopupNcCodeForm"/>
<html:hidden property="componentCodes" name="PopupNcCodeForm"/>
<html:hidden property="componentDesc" name="PopupNcCodeForm"/>
<html:hidden property="steelCodes" name="PopupNcCodeForm"/>
<html:hidden property="steelDesc" name="PopupNcCodeForm"/>
<html:hidden property="moparCodes" name="PopupNcCodeForm"/>
<html:hidden property="moparDesc" name="PopupNcCodeForm"/>
<html:hidden property="stampingCodes" name="PopupNcCodeForm"/>
<html:hidden property="stampingDesc" name="PopupNcCodeForm"/>
<html:hidden property="powertrainCodes" name="PopupNcCodeForm"/>
<html:hidden property="powertrainDesc" name="PopupNcCodeForm"/>
<html:hidden property="asmStmpCodes" name="PopupNcCodeForm"/>
<html:hidden property="asmStmpDesc" name="PopupNcCodeForm"/>
<html:hidden property="asmPwrtCodes" name="PopupNcCodeForm"/>
<html:hidden property="asmPwrtDesc" name="PopupNcCodeForm"/>

	<nct:testSystemDisplay
		subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />
	<H1>
		<A class="overviewHelp" HREF="#"
		onClick="termsPopup('qnc2000t','webovervw inq');">Non-Conformance Codes for</A><BR>
		<INPUT NAME="headingText" TYPE="text" SIZE="26" VALUE="         Assembly         " onFocus="blur();">
	</H1>
	<A class="NoLine" HREF="#" onClick="helpPopup('QNCWEB','nctNonConformanceCode search');">
</A>
<DIV align="center">
	<hr>
		<p>
		Select 1 Non-Conformance Code. To select from a different list of 
		Non-Conformance Codes, click on the appropriate button to display the desired list
		</p>
		<table border=0>
			<tr>
				<td rowspan="8">
				<SELECT NAME="ncCodeSelected" MULTIPLE SIZE="15"
    onfocus="window.status='Select type of Nonconformance.';
                return true;"
    onchange="checkForMaxSelected(document.PopupNcCodeForm.ncCodeSelected,'1');
                return true;">
   <OPTION VALUE=" " selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              &lt;----- none -----&gt;
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   </OPTION>
</SELECT>
				</td>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="A" onclick="javascript:changeSelectStatement();">Assembly	
				</td>
				<td rowspan="8">
				   &nbsp;
				</td>
				<td rowspan="8">
				   <html:button property="button" onclick="closeAndReturn();" value="Return" /><BR> 
				   <html:button property="button" onclick="clearListbox(document.PopupNcCodeForm.ncCodeSelected);" value="Clear"/>
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="B" onclick="javascript:changeSelectStatement();">Components
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="C" onclick="javascript:changeSelectStatement();">Mopar
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="D" onclick="javascript:changeSelectStatement();">Powertrain
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="E" onclick="javascript:changeSelectStatement();">Stamping
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="F" onclick="javascript:changeSelectStatement();">Steel
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="G" onclick="javascript:changeSelectStatement();">Assembly to Stamping
				</td>
			</tr>
			<tr>
				<td>
				   	<INPUT TYPE="Radio" NAME="codeType" value="H" onclick="javascript:changeSelectStatement();">Assembly to PowerTrain	   	
				</td>
			</tr>				   	
			<tr>
				<SCRIPT language="JavaScript1.2">
					setInitialSelect();
				</SCRIPT>
			</tr>
		</table>
</DIV>
</html:form>

<%@ include file="/jspf/copyright.jspf"%>

</BODY>
</HTML>
