<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-right-width: 0px;border-left-width: 0px;}
</style>

  <head>
    <title>Add Loggers (Alfresco Support)</title>
    <link rel="stylesheet" href="${url.context}/css/main.css" TYPE="text/css">
  </head>
  <body>
   <table>
      <tr>
        <td><img src="${url.context}/images/logo/AlfrescoLogo32.png" alt="Alfresco" /></td>
        <td><nobr><span class="mainTitle">Add Loggers (Alfresco Support)</span></nobr></td>
      </tr>
       	<tr>
       		<td><td>
       		</br></br></br>
	  			<form action="${url.service}" method="POST" enctype="multipart/form-data">
	  			    
	  			    <div id="firstLog">
	    				<div <#if result?? && result?size &gt; 0>style="display:none"</#if>>
	    				<#if result?? && result?size &gt; 0>
	    				<#else>
	    				<b>${msg("label.classPackage")}</b> 
	    				<input name="log" type="text" size="80">
	    				
	    				<b>Level: </b>
	    				<select id="level" name="level" title="level">
  							<option value="ALL">ALL </option>
  							<option value="TRACE">TRACE</option>
						  	<option selected value="DEBUG">DEBUG</option>
						  	<option value="INFO">INFO</option>
						  	<option value="WARN">WARN</option>
						  	<option value="ERROR">ERROR</option>
						  	<option value="FATAL">FATAL</option>
						  	<option value="OFF">OFF</option>
						</select>
						</#if>
						<a href="javascript:new_link()">${msg("label.addLogger")}</a>
						</div>
						
				    
	  			    <#if result?? && result?size &gt; 0>
	  			      <#assign x=0>
	  			    	<#list result?keys as prop>
  			    	     
  			    	    <#assign values= prop?split(",")>
	  			    	<#assign logger= values[0]>
	  			    	<#assign level = values[values?size - 1]>
	  			    	
	  			    	<#if result[prop] == 0>
	  			    	 
	  			    	 <#assign messageColor="green">
	  			    	 <#assign inputColor="">
	  			    	 <#assign message = msg("label.ok")>
	  			    	 
	  			    	 
	  			    	<#elseif result[prop] == 1> 
	  			    	
	  			    	 <#assign messageColor="red">
	  			    	 <#assign inputColor="yellow">
	  			    	 <#assign message = msg("label.newLoggerSet")>
	  			    	
	  			    	<#elseif result[prop] == 2> 
	  			    	
	  			    	 <#assign messageColor="red">
	  			    	 <#assign inputColor="orange">
	  			    	 <#assign message=msg("label.loggerNA")>
	  			    	
	  			    	</#if>
	  			    	
	  			    	
	  			    	<div id="${x}">
	    				<b>${msg("label.classPackage")}</b> <input name="log" type="text" size="80" value="${logger}" style="background-color:${inputColor};">
	    				
	    				<b>Level: </b>
	    				<select id="level" name="level" title="level">
  							<option <#if level == "ALL">selected</#if> value="ALL">ALL</option>
						  	<option <#if level == "TRACE">selected</#if> value="TRACE">TRACE</option>
  							<option <#if level == "DEBUG">selected</#if> value="DEBUG">DEBUG</option>
						  	<option <#if level == "INFO">selected</#if> value="INFO">INFO</option>
						  	<option <#if level == "WARN">selected</#if> value="WARN">WARN</option>
						  	<option <#if level == "ERROR">selected</#if> value="ERROR">ERROR</option>
						  	<option <#if level == "FATAL">selected</#if> value="FATAL">FATAL</option>
						  	<option <#if level == "OFF">selected</#if> value="OFF">OFF</option>
						</select>
						
						<#if x == 0>
						<a href="javascript:new_link()">${msg("label.addLogger")}</a>
						<#else>
						<a href="javascript:delIt('${x}')">${msg("label.removeLogger")}</a>
						</#if>
						
						<b><font color=${messageColor}>${message}</font></b>
						
						</div>
						<#assign x=x+1>
						</#list>
	  			       
					</#if>
					
					
					</div>
						</br></br></br>
						<a href="${url.service}">${msg("link.clearAll")}</a>
						</br></br>
						
						<#if showLogs?? && showLogs=="true">
						   <#assign style="">
							<a id="linkSL" href="javascript:hideLogs()">${msg("link.hideLoggers")}</a>
						   <#else>
							<#assign style="display:none">
							<a id="linkSL" href="javascript:showLogs()">${msg("link.showLoggers")}</a>
						  </#if>
						</br></br></br>
						    <input type="submit" name="${msg("button.submit")}" value="${msg("button.submit")}">
	    				</br>
						</br>
						
						<input type="hidden" name="hiddenShowLogs" id="hiddenShowLogs" value="<#if showLogs??>${showLogs}<#else>false</#if>">
						
	    			</form>	
	    			
  			</td></td>
      	</tr>
   	

    			<div id="newLog" style="display:none">
	    			<b>${msg("label.classPackage")}</b> <input name="log" type="text" size="80">
	    			<b>Level: 
	    			<select id="level" name="level" title="level">
  							<option value="ALL">ALL </option>
  							<option value="TRACE">TRACE</option>
						  	<option selected value="DEBUG">DEBUG</option>
						  	<option value="INFO">INFO</option>
						  	<option value="WARN">WARN</option>
						  	<option value="ERROR">ERROR</option>
						  	<option value="FATAL">FATAL</option>
						  	<option value="OFF">OFF</option>
					</select>
					</div>
				
				
				
	   		<table id="showAllLogs" style="${style};margin-left:40px;" class="tg">
   	 			<#list allLoggers?keys as logs>
   	 			<tr <#if x?? && logger?? && x == 1 && logs == logger>style="background-color:#34ff34;"</#if> id="td_${logs}">
   	 			    <form id="singlePost_${logs}" action="${url.service}#td_${logs}" method="POST" enctype="multipart/form-data">
					<td class="tg-031e"><b>${logs}</b></td>
					<td class="tg-031e">
					<input type="hidden" name="log" id="log" value="${logs}">
					<input type="hidden" name="hiddenShowLogs" id="hiddenShowLogs" value="true">

   	 				<select id="level" name="level" title="level" onchange="document.getElementById('singlePost_${logs}').submit();"">
  							<option <#if allLoggers[logs] == "ALL">selected</#if> value="ALL">ALL</option>
						  	<option <#if allLoggers[logs] == "TRACE">selected</#if> value="TRACE">TRACE</option>
  							<option <#if allLoggers[logs] == "DEBUG">selected</#if> value="DEBUG">DEBUG</option>
						  	<option <#if allLoggers[logs] == "INFO">selected</#if> value="INFO">INFO</option>
						  	<option <#if allLoggers[logs] == "WARN">selected</#if> value="WARN">WARN</option>
						  	<option <#if allLoggers[logs] == "ERROR">selected</#if> value="ERROR">ERROR</option>
						  	<option <#if allLoggers[logs] == "FATAL">selected</#if> value="FATAL">FATAL</option>
						  	<option <#if allLoggers[logs] == "OFF" || !allLoggers[logs]?has_content >selected</#if> value="OFF">OFF</option>
						</select>
   	 				</td>
   	 				</form>
   	 			</tr>
   	 			</#list>
   	 		</table>				
			
	</body>
</html>


<script>

var ct = 1;
function new_link()
{
	ct++;
	var div1 = document.createElement('div');
	div1.id = ct;
	var delLink = '<a href="javascript:delIt('+ ct +')">${msg("label.removeLogger")}</a>';
	div1.innerHTML = document.getElementById('newLog').innerHTML + delLink;
	document.getElementById('firstLog').appendChild(div1);
}

function delIt(eleId)
{
	d = document;
	var ele = d.getElementById(eleId);
	var parentEle = d.getElementById('firstLog');
	parentEle.removeChild(ele);
}
function showLogs()
{
	var ele = document.getElementById("showAllLogs");
	ele.style.display="";
	
	var linkSL = document.getElementById("linkSL");
	linkSL.href = "javascript:hideLogs()";
	linkSL.innerHTML= "${msg("link.hideLoggers")}";
	
	var hiddenShowLogs = document.getElementById("hiddenShowLogs");
	hiddenShowLogs.value="true";
	
}

function hideLogs()
{
	var ele = document.getElementById("showAllLogs");
	ele.style.display="none";
	
	var linkSL = document.getElementById("linkSL");
	linkSL.href = "javascript:showLogs()";
	linkSL.innerHTML= "${msg("link.showLoggers")}";
	
	var hiddenShowLogs = document.getElementById("hiddenShowLogs");
	hiddenShowLogs.value="false";
}
</script>

