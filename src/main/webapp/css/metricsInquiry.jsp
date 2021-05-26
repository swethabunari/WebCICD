<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.dcx.mfg.nct.core.NavigationConstants"%>
<%@ page import="com.dcx.mfg.nct.core.ApplicationConstants"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="nct.tld" prefix="nct"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
<TITLE>N/C Metrics Inquiry</TITLE> 
<LINK REL=STYLESHEET TYPE="text/css" HREF="/NCTWeb/theme/nct_default_stylesheet.css">
<SCRIPT SRC="/NCTWeb/scripts/misc_form_checks.js" language="JavaScript1.2"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/getCurrentMonthBegEnd.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/ncthelpFunction.js" language="JavaScript"></SCRIPT>
<SCRIPT SRC="/NCTWeb/scripts/setSelection.js"                         
        language="JavaScript"></SCRIPT>                                   
<SCRIPT SRC="/NCTWeb/scripts/misc_Checkbox_functions.js"              
        language="JavaScript"></SCRIPT>
<SCRIPT language=javascript>

	function checkdata()                                                      
{                                                                         
/* This function checks for valid 'FROM' and 'TO' dates.      */          
   with (document.forms[0])                                        
   {                                                                      
                                                                               
/* check from date for validity.                              */                
      if (checkDate (IDATEFY, IDATEFM, IDATEFD, "From Date")) {                 
         ;                                                                      
      }                                                                         
      else {                                                                    
         return;                                                                
      }                                                                         
                                                                                
/* check to date for validity.                              */                  
      if (checkDate (IDATETY, IDATETM, IDATETD, "To Date")) {                   
         ;                                                                      
      }                                                                         
      else {                                                                    
         return;                                                                
      }                                                                         
/* check for 'from' date overlapping 'to' date. */                              
      if (dateOverlap (IDATEFY, IDATEFM, IDATEFD, IDATETY, IDATETM, IDATETD)) { 
         ;                                                                      
      }                                                                         
      else {                                                                   
         return;                                                               
      }                                                                        
                                                                               
/* set century and concatonate date for output page. */                        
      var holdCentury;                                                          
      if ((IDATEFY.value > "80")                                               
      &&  (IDATEFY.value <= "99"))                                             
         holdCentury = "19";                                                   
      else                                                                     
         holdCentury = "20";                                                   
      idateFrom.value = IDATEFM.value + "-" + IDATEFD.value + "-" +holdCentury+ IDATEFY.value;
      if ((IDATETY.value > "80")                                               
      &&  (IDATETY.value <= "99"))                                             
         holdCentury = "19";                                                   
      else                                                                     
         holdCentury = "20";                                                   
      idateTo.value   = IDATETM.value + "-" + IDATETD.value + "-" +holdCentury+ IDATETY.value;
                                                                               
                                                                    
/* check for a plant selection   */                                 
      if (plant.selectedIndex == 0) {                             
         alert("Please select a plant or division");                
         plant.focus();                                           
         return false;                                              
      } // plant selected index                                     
                                                                    
/* check for a ticket type selection  */                            
      if (tktType.selectedIndex == 0) {                          
         alert("Please select a ticket type.");                     
         tktType.focus();                                        
         return false;                                              
      } // ticket type selected index                               
                                                                    
/* check if a report has been selected  */                          
      if (countChecked(reportType) < 0) {                           
         alert("Please select a report");                           
         return false;                                              
      } // report selected                                                  
                                                                            
/* if the Quantity/Labor Detail report is selected  */                      
      if (returnSingleSelectCheckboxValue(reportType) == "qtyVsHrs") {      
                                                                            
/* if the 'all' conditions are checked, then don't edit the Quantity        
   and Hours                                                         */     
         if (countChecked(allQuantities) == -1) {                           
/* check for numerics in minimum Quantity          */                       
            if (!isNumeric(minQuantity,"Minimum Quantity"))                 
               return false;                                                
                                                                            
/* check for numerics in maximum Quantity          */                       
            if (!isNumeric(maxQuantity,"Maximum Quanitity"))                
               return false;                                                
         } else {                                                           
            minQuantity.value = "0";                                        
            maxQuantity.value = "0";                                        
         } // All quantity checked                                          
                                                                                
         if (countChecked(allHours) == -1) {                                    
/* check for numerics in minimum Hours             */                           
            if (!isNumeric(minHours,"Minimum Hours"))                           
               return false;                                                    
                                                                                
/* check for numerics in maximum Hours             */                           
            if (!isNumeric(maxHours,"Maximum Hours"))                           
               return false;                                                    
         } else {                                                               
            minHours.value = "0";                                               
            maxHours.value = "0";                                               
         } // All Hours Checked                                                 
                                                                                
         if (countChecked(allQuantities) == -1) {                               
/* check for minimum Quantity < maximum Quantity   */                           
            if (parseInt(minQuantity.value,10) > parseInt(maxQuantity.value,10)) { 
               alert("The minimum Quantity must be less than the maximum Quantity");
               minQuantity.focus();    
               return false;                                                    
            } // minQuantity > maxQuantity                                      
         } // All Quantities checked                                            
                                                                                
         if (countChecked(allHours) == -1) {                                    
/* check for minimum Hours    < maximum Hours      */                           
            if (parseInt(minHours.value,10) > parseInt(maxHours.value,10)) {    
               alert("The minimum Hours must be less than the maximum Hours");  
               minHours.focus();                                                
               return false;                                                    
            } // minHours > maxHours                                            
         } // All Hours checked                                                 
      } // reportType = qtyVsHrs if                                             
                                                                                
/* set action based on reportType selected  */                                  
      if (returnSingleSelectCheckboxValue(reportType) == "qtyVsHrs") {          
         action = "/NCTWeb/core/metricsInquiry.nct?param=Qty";
      } // reportType = qtyVsHrs if                                             
      else {                                                                    
         action = "/NCTWeb/core/metricsInquiry.nct?param=NC";   
      } // default reportType to stats                                         
   }                                                                           
/* if no errors, then submit the form.                        */               
   document.forms[0].flag.value = 'yes';
   document.forms[0].submit();
                                             
   return true;                                                                
} // function checkdata                                                        
                                                                              
function init()                                                                
{                                                                              
/* This is the initialization section.                        */               
   window.defaultStatus="Worksheet Inquiry";                                   
                                                                               
   with (document.forms[0]) {                                           
/* Set the cursor on the Supplier code initially         */                    
      if  ((IDATETM.value == " ") || (IDATEFM.value == " ")                    
      ||  (IDATETD.value == " ") || (IDATEFD.value == " ")                     
      ||  (IDATETY.value == " ") || (IDATEFY.value == " ")                     
      ||  (IDATETM.value == "")  || (IDATEFM.value == "")                      
      ||  (IDATETD.value == "")  || (IDATEFD.value == "")                       
      ||  (IDATETY.value == "")  || (IDATEFY.value == "")) {                    
         getCurrentMonthBegEnd();                                               
         IDATEFM.value = firstMonth;                                            
         IDATEFD.value = firstDay;                                              
         IDATEFY.value = firstYear;                                             
         IDATETM.value = lastMonth;                                             
         IDATETD.value = lastDay;                                               
         IDATETY.value = lastYear;                                              
      } // date                                                                 
      if (plant == ""){
		// @check_sec(IUSERID,"       ","        ",SEC_RTNCODE,SEC_OUTUSRPLNT,SEC__OUTSECFLAGS,SEC_OUTFILLER2); 
         var SEC_TEST_FLAG = "N";                                         
         var plant = SEC_OUTUSRPLNT;  
      }
      if ("<bean:write name='MetricsInquiryForm' property='plant'/>" != "") {                           
          setDropdownSelection(plant,'<bean:write name="MetricsInquiryForm" property="plant"/>');     
      }                                                   
   } // with                                              
}    
                                 
</SCRIPT>                                                 
</HEAD>  

<BODY onload="init()">                                    
<form name="MetricsInquiryForm" METHOD="POST" action="/NCTWeb/core/metricsInquiry.nct" >       
<H1>                                                      
N/C Metrics Inquiry                                       
</H1>                                                     
<INPUT TYPE="HIDDEN" NAME="prm_from" VALUE="forms[0]">                   
<INPUT TYPE="HIDDEN" NAME="idateFrom" VALUE="">                                 
<INPUT TYPE="HIDDEN" NAME="idateTo"  VALUE="">                                  
<div align=center>                                                              
<table class="TableInputDataDefault" border=1 width=100%>                       
                                                                                
  <tr>                                                                          
    <td class="Tagname">                                                        
    Originating Plant:                                                          
    </td>                                                                       
    <td colspan="1">                                                            
    <html:select property="plant" name="MetricsInquiryForm">
    <OPTION VALUE="     ">Select a Plant Code </OPTION>                         
    <OPTION VALUE="ASM">All Assembly</OPTION>                                   
    <OPTION VALUE="STP">All Stamping</OPTION>                                   
    <OPTION VALUE="PWR">All Powertrain</OPTION>                                 
    <OPTION VALUE="CO">All Component Operations</OPTION>                        
    <OPTION VALUE="MOPAR">All Mopar</OPTION>                        
    <OPTION VALUE="ALS">ALS</OPTION>                                
    <OPTION VALUE="INT">All Internal International</OPTION>    
	<html:optionsCollection property="plantList" name="MetricsInquiryForm"/>
	</html:select>                                          
                                                          
    </td>                                                           
    <td class="Tagname">                                            
    Ticket Type:                                                    
    </td>                                                           
    <td colspan="1">                                                
    <SELECT  NAME="tktType"                                      
        onfocus="window.status='Select a Ticket Type to search on.';
                 return true;">                                     
       <OPTION VALUE="     ">Select a Ticket Type</OPTION>          
       <OPTION VALUE="">All Ticket Types</OPTION>                   
       <OPTION VALUE="R">Regular N/C</OPTION>                       
       <OPTION VALUE="ST">Steel</OPTION>                            
       <OPTION VALUE="DR">Damaged Rack</OPTION>                          
       <OPTION VALUE="DP">Damaged Part</OPTION>                          
    </SELECT>                                                            
    </td>                                                                
  </tr>                                                                  
  <tr>                                                                   
  <td  class="Tagname">                                                  
      From Date:                                                         
  </td>                                                                  
  <td>                                                                   
   <INPUT TYPE="TEXT" NAME="IDATEFM" SIZE="2" MAXLENGTH="2"            
          onfocus="document.forms[0].IDATEFM.select();          
                   window.status='Enter the From month to search on.'; 
                   return true;">                                      
   <b> / </b>                                                          
   <INPUT TYPE="TEXT" NAME="IDATEFD" SIZE="2" MAXLENGTH="2"            
          onfocus="document.forms[0].IDATEFD.select();          
                   window.status='Enter the From day to search on.';   
                   return true;">                                      
   <b> / </b>                                                                   
   <INPUT TYPE="TEXT" NAME="IDATEFY" SIZE="2" MAXLENGTH="2" VALUE=""            
          onfocus="document.forms[0].IDATEFY.select();                   
                   window.status='Enter the From year to search on.';           
                   return true;">                                               
     <A HREF="#" onClick="window.dateFieldMM = document.forms[0].IDATEFM;
                          window.dateFieldDD = document.forms[0].IDATEFD;
                          window.dateFieldYY = document.forms[0].IDATEFY;
                         calendar =                                             
                             window.open('/NCTWeb/html/calendar_MMDDYY_split.html','cal','WIDTH=200,HEIGHT=250')">
                         <IMG SRC="/NCTWeb/images/Calendar_June.gif" ALT="Calendar" BORDER=1 ></A>
</td>                                                                           
<td class="Tagname">                                                            
    To Date:                                                                    
</td>                                                                           
<td>                                                                            
   <INPUT TYPE="TEXT" NAME="IDATETM" SIZE="2" MAXLENGTH="2"                     
          onfocus="document.forms[0].IDATETM.select();                   
                   window.status='Enter the From month to search on.';   
                   return true;">                                               
   <b> / </b>                                                                   
   <INPUT TYPE="TEXT" NAME="IDATETD" SIZE="2" MAXLENGTH="2"                     
          onfocus="document.forms[0].IDATETD.select();                   
                   window.status='Enter the From day to search on.';            
                   return true;">                                               
   <b> / </b>                                                                   
   <INPUT TYPE="TEXT" NAME="IDATETY" SIZE="2" MAXLENGTH="2" VALUE=""            
          onfocus="document.forms[0].IDATETY.select();                   
                   window.status='Enter the From year to search on.';           
                   return true;">                                               
     <A HREF="#" onClick="window.dateFieldMM = document.forms[0].IDATETM;
                          window.dateFieldDD = document.forms[0].IDATETD;
                          window.dateFieldYY = document.forms[0].IDATETY;
                         calendar =                                             
                             window.open('/NCTWeb/html/calendar_MMDDYY_split.html','cal','WIDTH=200,HEIGHT=250')">
                         <IMG SRC="/NCTWeb/images/Calendar_June.gif" ALT="Calendar" BORDER=1 ></A>  
</td>                                                                           
</tr>       
<tr>                                                                            
  <td class="Tagname">                                                          
     Sort by:                                                                   
  </td>                                                                         
  <td>                                                                          
     <SELECT NAME="supplier">                                                   
        <OPTION VALUE="Plt">Plant</OPTION>                                      
        <OPTION VALUE="Splr">Supplier</OPTION>                                  
     </SELECT>                                                                  
  </td>                                                                         
  <td class="Tagname" colspan="2">                                              
     &nbsp;                                                                     
  </td>                                                                         
</tr>                                                                           
</table>                                                                          
<h3>   Additional Parameters for Detail N/C Quantity vs. Labor Hours Report </h3> 
<table class="TableInputDataDefault" border=1 width=100%>                         
<tr>                                                                            
  <th colspan="4">                                                              
    Quantity to Display                                                         
  </th>                                                                         
  <th colspan="4">                                                              
    Hours to Display                                                            
  </th>                                                                         
</tr>                                                                           
<tr>                                                                            
  <td colspan="1" class="Tagname">                                              
     Minimum                                                                    
  </td>                                                                         
  <td colspan="1">                                                              
     <INPUT TYPE="TEXT" NAME="minQuantity" SIZE="8" MAXLENGTH="8" VALUE="1">    
  </td>                                                                         
  <td colspan="1" class="Tagname">                                              
     Maximum                                                                    
  </td>                                                                         
  <td colspan="1">                                                              
     <INPUT TYPE="TEXT" NAME="maxQuantity" SIZE="8" MAXLENGTH="8" VALUE="100">  
  </td>                                                                         
  <td colspan="1" class="Tagname">                                          
     Minimum                                                                
  </td>                                                                     
  <td colspan="1">                                                          
     <INPUT TYPE="TEXT" NAME="minHours" SIZE="8" MAXLENGTH="8" VALUE="2">   
  </td>                                                                     
  <td colspan="1" class="Tagname">                                          
     Maximum                                                                
  </td>                                                                     
  <td colspan="1">                                                          
     <INPUT TYPE="TEXT" NAME="maxHours" SIZE="8" MAXLENGTH="8" VALUE="2">   
  </td>                                                                     
</tr>                                                                       
<tr>                                                                        
  <td class="Tagname" colspan="4">                                          
     or click to display all Quantities                                     
     <INPUT TYPE="CHECKBOX" NAME="allQuantities" VALUE="all">               
  </td>                                                                     
  <td class="Tagname" colspan="4">                                          
     or click to display all Hours                                              
     <INPUT TYPE="CHECKBOX" NAME="allHours" VALUE="all">                        
  </td>                                                                         
</tr>                                                                           
                                                                                
</table></DIV> 
<br/>   
<table class="TableInputDataDefault" border=1 width=100%>                         
 <tr>                                                                           
    <th class="Tagname">                                                        
       Report Type                                                              
    </th>                                                                       
 </tr>                                                                          
 <tr>                                                                           
    <td><div align="center">                                                    
       <INPUT TYPE="RADIO" NAME="reportType" VALUE="stats">N/C Statistics       
       <INPUT TYPE="RADIO" NAME="reportType" VALUE="qtyVsHrs">Ticket Quantity vs. Hours 
    </div></td>                                                                 
 </tr>                        
</table>                                                             
                                                                     
<br>                                                                 
<br>                                                                 
                                                                     
<div align=center>                                                   
<table border=0 width=100%>                                          
  <tr>                                                               
    <td colspan=6>                                                   
    <div align=center>                                               
    <INPUT TYPE="BUTTON" VALUE="Retrieve" onclick="checkdata()">     
    <INPUT TYPE="RESET" VALUE=" Clear  ">        
    <input type="hidden" name="flag" value="<bean:write name='MetricsInquiryForm' property='flag' />">                   
    </div>                                                           
    </td>                                                            
  </tr>                                                              
</table></div>                                                       
</form>                                                              
        
<%@ include file="/jspf/copyright.jspf"%>
</BODY>
</html:html>

