<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
<TITLE>Parts Per Million (PPM) By Part</TITLE>
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_print_stylesheet.css">
<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript1.2"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/setSelection.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/misc_Listbox_functions.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/padField.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/selectionXfer.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/misc_Listbox_functions.js" language="JavaScript"></SCRIPT>
<SCRIPT language=javascript>
function BlurDefault(form)                           
{                                                    
   window.defaultStatus=" " ;                                
}                                                           
                                                            
function displayAlert() {                                   
   alert("Please select a row before transferring.");       
   return;                                                  
} // displayAlert                                           
                                                            
var dates;                                                  
var passurl;                                                
var iplant;                                                 
var iplar;                                                  
                                                            
/* set the document's href to the new page with the data. */
/*    alert("gotoloc = " + gotoloc);   */                   
function XferToTKT(tplant, tpart)                           
{                                                           
   with (document.forms[0]) {                                
                                                            
      ipart  = tpart;                                       
      iplant = tplant;                                                    
      var gotoloc = buildURL(passurl);                                    
      location.href = gotoloc;                                            
                                                                          
   }                                                                      
}                                                                         
                                                                          
function buildURL(passurl)                                                
{                                                                         
   with (document.forms[0]) {                                              
                                                                          
      passurl  = "/cgi-bin/db2www/restricted/mfg/nct/nctptkt.d2w/nctptkt";
      passurl += "?&prm_cmdty=" + escape(cmdty.value);                    
      passurl += "&prm_suplr="  + escape(suplr.value);                    
      passurl += "&prm_suff="   + escape(suff.value);                     
      passurl += "&prm_myear="  + escape(myear.value);                    
      passurl += "&prm_plant="  + escape(iplant);                         
      passurl += "&prm_part="   + escape(ipart);                          
      passurl += "&prm_beg=" + escape(monthDates(dates).substring(10,20));
      passurl += "&prm_end=" + escape(monthDates(dates).substring(0,10)); 
      passurl += "&prm_from=nctpm3c";       
      return passurl;                       
                                            
   }                                        
}                                           
                                            
function monthDates(dates)                  
{                                           
   with (document.forms[0]) {                
                                            
      var now        = new Date();         
      var moncur     = now.getMonth() + 1;  
      var monprv     = now.getMonth();      
      var year       = now.getFullYear();   
                                            
      if (moncur == 2) {                    
         lasday      = daysInFebruary(year);
      }                                     
      else {                                
         lasday      = daysInMonth[moncur];        
      }                                            
                                                   
      if (moncur < 10) {                           
         moncur1 = '0'+ String(moncur);            
      }                                            
      else {                                       
         moncur1 = String(moncur);                 
      }                                            
                                                   
      if (monprv < 10) {                           
         monprv1 = '0'+ String(monprv);            
      }                                            
      else {                                       
         monprv1 = String(monprv);                 
      }                                            
                                                   
      year   = String(year);                       
      dates  = year + '-' + moncur1 + '-' + lasday;
      dates += year + '-' + monprv1 + '-' + '01';  
      return dates;                           
                                              
   } // end with                              
}                                             
                                              
/* Close the window */                        
function closeWindow() {                      
                                              
   window.close();                            
                                              
} // close function    
                                                                                
                                               
</SCRIPT> 
</HEAD>

<BODY onload="init()">                                                     
<form name="NcTktActivityForm"  action="/SubmitNctInq.nct">             
<nct:testSystemDisplay subSystem="<%= new Integer(NavigationConstants.SUBSYSTEM_NCT)%>" />                                                              
<H1>Parts With Year-To-Date NC Ticket Activity</H1>                                    
<INPUT TYPE="hidden" NAME="prmCmdty" VALUE="<bean:write name='NcTktActivityForm' property='prmCmdty' scope='request'/>">                      
<INPUT TYPE="hidden" NAME="prmSplr" VALUE="<bean:write name='NcTktActivityForm' property='prmSplr' scope='request'/>">                      
<INPUT TYPE="hidden" NAME="prmSuff"  VALUE="<bean:write name='NcTktActivityForm' property='prmSuff' scope='request'/>">                       
<INPUT TYPE="hidden" NAME="cyear" VALUE="<bean:write name='NcTktActivityForm' property='cyear' scope='request'/>">  
<logic:equal name="NcTktActivityForm" property="msg" value="Y" scope="request">
 <p ID="ErrorText">                                               
     An error occurred in the Security routine: <br>                
    <bean:write name="NcTktActivityForm" property="secRtnCode" scope="request"/> <br>                                            
 </p>   

</logic:equal>
<logic:equal name="NcTktActivityForm" property="isSupplier" value="Y" scope="request">
 <hr>                                                      
     <table border=0 width=100%>                               
       <tr>                                                    
         <td class="TagnameReturn"><font color="#285280">      
            Supplier:                                          
         </font></td>                                          
         <td class="HeaderDataReturn"><font color="#285280">   
            <bean:write name="NcTktActivityForm" property="prmSplr" scope="request"/>                                       
         </font></td>                                          
         <td class="HeaderDataReturn"><font color="#285280">   
            <bean:write name="NcTktActivityForm" property="suplrName" scope="request"/>                           
         </font></td>                                          
       </tr>                                                   
     </table>                                                  
     <hr>                                                                    
     <br>  
      <p ID="ErrorText">                                                        
    You are not authorized to view information for this plant.             
    Use the button below or the browser's BACK button to make a new selection. <br>
 </p>                                                                      
 <center>                                                                  
       <INPUT TYPE="BUTTON" NAME="BackButton" VALUE="Back" onclick="history.go(-1);">
 </center>     
</logic:equal>
<logic:equal name="NcTktActivityForm" property="isSupplier" value="N" scope="request">
 <table border=0 width=100%>                                               
   <tr>                                                                      
   <td class="TagnameReturn"><font color="#285280">Supplier Code:</font></td>
   <td class="HeaderDataReturn"><font color="#285280"><bean:write name="NcTktActivityForm" property="prmSplr" scope="request"/>
<bean:write name="NcTktActivityForm" property="prmSuff" scope="request"/>   
   - <bean:write name="NcTktActivityForm" property="suplrName" scope="request"/>   </font></td>                                   
   <td class="TagnameReturn"><font color="#285280">Commodity:</font></td>    
   <td class="HeaderDataReturn"><font color="#285280"><bean:write name="NcTktActivityForm" property="prmCmdty" scope="request"/>              
   - <bean:write name="NcTktActivityForm" property="commName" scope="request"/>   </font></td>                                
   </tr>                                                                     
   </table>                                                                  
   <br>         
</logic:equal>
<logic:notEqual name="count" value="0" scope="request">
 <table class="DataReturnDataDefault" bordercolorlight="#31659C" bordercolordark="#31659C" border=1 width=100%>
     <thead>                                                                    
       <tr>                                                                     
         <th class="HeadingNames" colspan=2 bgcolor="#CDCDCD">&nbsp</th>        
         <th class="HeadingNames" colspan=2 bgcolor="#E6E8FA">YTD PPM Scores</th>
         <th class="HeadingNames" colspan=2 bgcolor="#E6E8FA">YTD Tickets Closed</th>
         <th class="HeadingNames" colspan=2 bgcolor="#E6E8FA">YTD NC Qty</th>   
         <th class="HeadingNames" colspan=2 bgcolor="#E6E8FA">YTD Receipts</th> 
         <th class="HeadingNames" colspan=2 bgcolor="#D9D9F3">Month PPM Scores</th>
         <th class="HeadingNames" colspan=2 bgcolor="#D9D9F3">Month Tickets Closed</th>
         <th class="HeadingNames" colspan=2 bgcolor="#D9D9F3">Month NC Qty</th> 
         <th class="HeadingNames" colspan=2 bgcolor="#D9D9F3">Month Receipts</th>
       </tr>                                                                    
       <tr>                                                                     
         <th class="HeadingNames" bgcolor="#CDCDCD">Part Number and Description</th>
         <th class="HeadingNames" bgcolor="#CDCDCD">Plant Code and Name</th>    
         <th class="HeadingNames" bgcolor="#E6E8FA">Current Month</th>          
         <th class="HeadingNames" bgcolor="#E6E8FA">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#E6E8FA">Current Month</th>          
         <th class="HeadingNames" bgcolor="#E6E8FA">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#E6E8FA">Current Month</th>          
         <th class="HeadingNames" bgcolor="#E6E8FA">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#E6E8FA">Current Month</th>          
         <th class="HeadingNames" bgcolor="#E6E8FA">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#D9D9F3">Current Month</th>          
         <th class="HeadingNames" bgcolor="#D9D9F3">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#D9D9F3">Current Month</th>          
         <th class="HeadingNames" bgcolor="#D9D9F3">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#D9D9F3">Current Month</th>          
         <th class="HeadingNames" bgcolor="#D9D9F3">Prior Month</th>            
         <th class="HeadingNames" bgcolor="#D9D9F3">Current Month</th>          
         <th class="HeadingNames" bgcolor="#D9D9F3">Prior Month</th>            
       </tr>
			<logic:iterate name="partList" id="partId"
				type="com.dcx.mfg.nct.databean.core.NcTktActivityBean"
				scope="request">
				<tr>
					<td class="TableDataReturnFixed" bgcolor="#CDCDCD"><A
						class="overview"
						HREF="javascript:XferToTKT('<bean:write name='partId' property='temp_Plant'/>','<bean:write name='partId' property='temp_part'/>');">
					<bean:write name="partId" property="temp_part" /></A><br>
					<bean:write name="partId" property="partName" /></td>
					<td class="TableDataReturnFixed" bgcolor="CDCDCD"><bean:write
						name="partId" property="temp_Plant" /><br>
					<bean:write name="partId" property="plantName" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_ppm_ytd_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_ppm_ytd_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_tkts_ytd_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_tkts_ytd_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_ncqty_ytd_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_ncqty_ytd_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_rcpt_ytd_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_rcpt_ytd_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#E6E8FA">
					<bean:write name="partId" property="temp_ppm_mo_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_ppm_mo_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_tkts_mo_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_tkts_mo_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_ncqty_mo_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_ncqty_mo_prev" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_rcpt_mo_curr" /></td>
					<td class="TableDataReturnFixed" bgcolor="#D9D9F3">
					<bean:write name="partId" property="temp_rcpt_mo_prev" /></td>
				</tr>
			</logic:iterate>

	</thead>
	</table>
			</logic:notEqual>

<logic:equal name="count" value="0" scope="request">
<H2>No data was found</H2>
</logic:equal>
<br>                                             
<table border=0 width=100%>                      
<tr>                                             
  <th>                                           
    <INPUT TYPE="BUTTON" VALUE="Close"           
      onclick="closeWindow();">                  
  </th>                                          
</tr>                                            
</table>                                                             
<br>                                                           
</form>
<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</html:html>

