	/*
        var ip;
	var pin="";
	ip = document.location.href;
	if (ip.toLowerCase().match("^http:\/\/")) ip = ip.substring(7);
	if (ip.indexOf(':') != -1) ip = ip.substring(0, ip.indexOf(':')) ;
	if (ip.indexOf('?') != -1) ip = ip.substring(0, ip.indexOf('?')) ;
	if (ip.indexOf('\/') != -1) ip = ip.substring(0, ip.indexOf('\/'));
        if (ip.indexOf('file') != -1) ip = 'localhost';
        function select(comp) {
            if (mouseDown==1) {
                if (comp.className=="schtdns") {
                    comp.className="schtds";
                } else {
                    comp.className="schtdns";
                }
            }
        }
        */
	function showHideAlarmStatus(id) {
		var component = 'expanderstatus'+id;
		var row = document.getElementById(component);
		if (row.style.display == '')  {
			row.style.display = 'none'; 
		} else {
                        //OK, load the schedule and show schedule table
			row.style.display = '';
                        executeRequestA('AS',id);
		}
                component = 'expanderconfig'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
	}
	function showHideAlarmConfig(id) {
		var component = 'expanderconfig'+id;
		var row = document.getElementById(component);
		if (row.style.display == '')  {
			row.style.display = 'none'; 
		} else {
                        //OK, load the schedule and show schedule table
			row.style.display = '';
                        executeRequestA('AC',id);
		}
                component = 'expanderstatus'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
	}
        function loadConfig(data, id) {
            var pieces = data.split("|");
            var statusData = "<table class=\"alarmConfigTable\"><tr class=\"alarmTrDark\"><td width=\"30%\">Name:</td><td width=\"70%\">"+pieces[0]+"</td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>Enter timeout:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_et"+id+"\" value=\""+pieces[1]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>Leave timeout:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_lt"+id+"\" value=\""+pieces[2]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>Alarm timeout:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_at"+id+"\" value=\""+pieces[3]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>Light on movement:</td><td><input class=\"alarmInput\" type=\"checkbox\" value=\"true\" id=\"al_lm"+id+"\" "+pieces[4]+"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>Light on movement timeout:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_lmt"+id+"\" value=\""+pieces[5]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>Alarm action siren:</td><td><input class=\"alarmInput\" type=\"checkbox\" value=\"true\" id=\"al_as"+id+"\" "+pieces[6]+"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>Alarm action email:</td><td><input class=\"alarmInput\" type=\"checkbox\" value=\"true\" id=\"al_ae"+id+"\" "+pieces[7]+"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>SMTP server:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_ss"+id+"\" value=\""+pieces[8]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>SMTP user:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_su"+id+"\" value=\""+pieces[9]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>SMTP password:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_sp"+id+"\" value=\""+pieces[10]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>SMTP from address:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_sf"+id+"\" value=\""+pieces[11]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>SMTP to address:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_st"+id+"\" value=\""+pieces[12]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td>SMTP subject:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_sb"+id+"\" value=\""+pieces[13]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTrDark\"><td>SMTP message:</td><td><input class=\"alarmInput\" type=\"text\" id=\"al_sm"+id+"\" value=\""+pieces[14]+"\"/></td></tr>";
            statusData += "<tr class=\"alarmTr\"><td colspan=\"2\" align=\"right\"><input class=\"lightsbutton\" type=\"button\" value=\"Reset\" onClick=\"executeRequestA('AC','"+id+"');\"/><input class=\"lightsbutton\" type=\"button\" value=\"Save\" onClick=\"executeRequestA('acs','"+id+"');\"/></td></tr>";
            statusData += "</table>";
            var compId = "expanderconfigspan"+id;
            document.getElementById(compId).innerHTML = statusData;
        }
        function loadStatus(data, id) {
            if (id == '9') {
                loadAllStatus(data, id);
            } else {
                var pieces = data.split("|");
                var statusData = "<table class=\"alarmConfigTable\"><tr class=\"alarmTrDark\"><td width=\"40%\">Name:</td><td width=\"60%\">"+pieces[0]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Area monitored:</td><td>"+pieces[1]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Area activated:</td><td>"+pieces[2]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Alarm reported:</td><td>"+pieces[3]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Enter alarm counter:</td><td>"+pieces[4]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Leave alarm counter:</td><td>"+pieces[5]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Alarm counter:</td><td>"+pieces[6]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Enter alarm timeout:</td><td>"+pieces[7]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Leave alarm timeout:</td><td>"+pieces[8]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Alarm timeout:</td><td>"+pieces[9]+"</td></tr></table>";
                var compId = "expanderstatusspan"+id;
                document.getElementById(compId).innerHTML = statusData;
            }
        }
        function loadAllStatus(data, id) {
            var rooms = data.split(",");
            var statusData = "<table class=\"alarmConfigTable\"><tr class=\"alarmTrDark\"><td width=\"23%\">Name</td><td>Area monitored</td><td>Area activated</td><td>Alarm reported</td><td>Enter timeout</td><td>Leave timeout</td><td>Alarm timeout</td><td>Enter counter</td><td>Leave counter</td><td>Alarm counter</td></tr>";
            for (var i=0; i<rooms.length; i++) {
                var pieces = rooms[i].split("|");
                if (i%2 == 0) {
                    statusData += "<tr class=\"alarmTr\">";
                } else {
                    statusData += "<tr class=\"alarmTrDark\">";
                }
                statusData += "<td>"+pieces[0]+"</td>";
                statusData += "<td>"+pieces[1]+"</td>";
                statusData += "<td>"+pieces[2]+"</td>";
                statusData += "<td>"+pieces[3]+"</td>";
                statusData += "<td>"+pieces[4]+"</td>";
                statusData += "<td>"+pieces[5]+"</td>";
                statusData += "<td>"+pieces[6]+"</td>";
                statusData += "<td>"+pieces[7]+"</td>";
                statusData += "<td>"+pieces[8]+"</td>";
                statusData += "<td>"+pieces[9]+"</td></tr>";                
            }
            statusData += "</table>";
            var compId = "expanderstatusspan"+id;
            document.getElementById(compId).innerHTML = statusData;
        }        
	function hideWaitingFrame() {
		document.getElementById("waitingBar").innerHTML="";
	    	document.body.style.cursor='auto';
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			inputs[i].disabled = false;
		}
	}
	function showWaitingFrame() {
        	winWidth = (document.body.offsetWidth/2)-100;
	        winHeight = (document.body.offsetHeight/2)-20;
        	document.getElementById("waitingBar").style.left = winWidth + "px";
	        document.getElementById("waitingBar").style.top = winHeight + "px";
		document.getElementById("waitingBar").style.position = "absolute";
	        document.body.style.cursor='wait';
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			inputs[i].disabled = true;
		}
		document.getElementById("waitingBar").innerHTML="<table class='progressBar' cellpadding='20px'><tr><td><img src='progressbar.gif'\/><\/td><\/tr><\/table>";
	}
        function executeRequestA(action, id) {
            showWaitingFrame();
             var xhr;
                try {
                    xhr = new ActiveXObject('Msxml2.XMLHTTP');
                } catch (e) {
                    try {
                        xhr = new ActiveXObject('Microsoft.XMLHTTP');
                    } catch (e2) {
                        try {
                            xhr = new XMLHttpRequest();
                        } catch (e3) {
                            xhr = false;
                        }
                    }
                }
                xhr.onreadystatechange = function() {
                  if (xhr.readyState  == 4) {
                    if (xhr.status == 500) {
                        hideWaitingFrame();
                                    alert ("The PIN code you have inserted is wrong. Please wait two minutes, then try again.");
                                    pin = "";
                    } else if(xhr.status == 501) {
                        hideWaitingFrame();
                                    alert ("Someone before you inserted wrong PIN code. For the security reason, there is 2 minutes timeout, before you can use again the system.");
                                    pin = "";
                    } else if(xhr.status == 502) {
                        hideWaitingFrame();
                                    alert ("Error in hardware, when tried to execute the command.");
                    } else if (xhr.status == 200) {
                        if (xhr.responseText.indexOf("asaddfetwerryuyklkmgdmfmcxcx") == -1) {
                              if (action == "AS") {
                                   loadStatus(xhr.responseText, id);
                              }
                              if (action == "AC") {
                                   loadConfig(xhr.responseText, id);
                              }
                              hideWaitingFrame();
                        } else {
                              hideWaitingFrame();
                              alert("Session expired. You will be redirected to login page.");
                              top.location="../servlet";                            
                        }
                    } else {
                      hideWaitingFrame();  
                      alert("Error when tried to perform the action: " + xhr.statusText);
                    }
                  }
                };
                  //if (pin == "") {
                  //      pin = prompt("Enter the PIN:","");
                  //}
                  var urlToSend="../servlet"+"?action="+action+"&pin="+pin
                  
                  if (action == "AS") {
                        //alarm status
                        urlToSend+="&id="+id;
                  } else if (action == "AC") {
                        //alarm config
                        urlToSend+="&id="+id;
                  } else if (action == "acs") {
                        //alarm config
                        urlToSend+="&id="+id;
                        urlToSend+="&al_et="+escape(document.getElementById("al_et"+id).value);
                        urlToSend+="&al_lt="+escape(document.getElementById("al_lt"+id).value);
                        urlToSend+="&al_at="+escape(document.getElementById("al_at"+id).value);
                        urlToSend+="&al_lm="+escape(document.getElementById("al_lm"+id).checked);
                        urlToSend+="&al_lmt="+escape(document.getElementById("al_lmt"+id).value);
                        urlToSend+="&al_as="+escape(document.getElementById("al_as"+id).checked);
                        urlToSend+="&al_ae="+escape(document.getElementById("al_ae"+id).checked);
                        urlToSend+="&al_ss="+escape(document.getElementById("al_ss"+id).value);
                        urlToSend+="&al_su="+escape(document.getElementById("al_su"+id).value);
                        urlToSend+="&al_sp="+escape(document.getElementById("al_sp"+id).value);
                        urlToSend+="&al_sf="+escape(document.getElementById("al_sf"+id).value);
                        urlToSend+="&al_st="+escape(document.getElementById("al_st"+id).value);
                        urlToSend+="&al_sb="+escape(document.getElementById("al_sb"+id).value);
                        urlToSend+="&al_sm="+escape(document.getElementById("al_sm"+id).value);
                  } else if (action == "aa") {
                        //activate alarm
                        urlToSend+="&id="+id;                      
                  } else if (action == "ad") {
                        //deactivate alarm
                        urlToSend+="&id="+id;                      
                  } else if (action == "ass") {
                        //stop siren
                        urlToSend+="&id="+id;                      
                  } else if (action == "asi") {
                        //simulate alarm
                        urlToSend+="&id="+id;                      
                  }
                  xhr.open("GET", urlToSend+"&z="+(new Date()).getTime(), true);
                  xhr.send(null);
        }
        function writeAlarmTable(id) {
		document.write("<table width=\"100%\" cellspacing=\"0\">");
		document.write("<tr><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
		document.write("<table align=\"center\"><tr><th colspan=2 class=\"lightsth\">Alarm activation</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>");
		document.write("<tr><td><input class=\"lightsbutton\" type=\"button\" value=\"Activate alarm\" onClick=\"executeRequestA('aa','"+id+"');\"/>");
		document.write("</td><td><input class=\"lightsbutton\" type=\"button\" value=\"Deactivate alarm\" onClick=\"executeRequestA('ad','"+id+"');\"/></td></tr>");
		document.write("</table>");
		document.write("</td><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
		document.write("<table align=\"center\"><tr><th colspan=2 class=\"lightsth\">Alarm control</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>");
		document.write("<tr><td><input class=\"lightsbutton\" type=\"button\" value=\"Stop siren\" onClick=\"executeRequestA('ass','"+id+"');\"/>");
		document.write("</td><td><input class=\"lightsbutton\" type=\"button\" value=\"Simulate alarm\" onClick=\"executeRequestA('asi','"+id+"');\"/>");
		document.write("</td></tr>");
		document.write("</table>");
		document.write("</td></tr><tr>");
		document.write("<td class=\"linktd\" onClick=\"showHideAlarmStatus('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide alarm status</td>");
		document.write("<td class=\"linktd\" onClick=\"showHideAlarmConfig('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide alarm settings</td>");
		document.write("</tr><tr style=\"display:none;\" id=\"expanderstatus"+id+"\"><td colspan=\"2\"><span id=\"expanderstatusspan"+id+"\">Status not available</span>");
                document.write("</td>");
		document.write("</tr><tr style=\"display:none;\" id=\"expanderconfig"+id+"\"><td colspan=\"2\"><span id=\"expanderconfigspan"+id+"\">Config not available</span>");
                document.write("</td></tr>");
                document.write("</table>");
        }
