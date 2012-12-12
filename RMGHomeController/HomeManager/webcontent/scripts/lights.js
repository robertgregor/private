        var mouseDown = 0;
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
        function selectNoButtCheck(comp) {
                if (comp.className=="schtdns") {
                    comp.className="schtds";
                } else {
                    comp.className="schtdns";
                }
        }
	function showHideLoadSchedule(id) {
		var component = 'expander'+id;
                var componentSpan = 'expander'+id+'span';
		var row = document.getElementById(component);
		if (row.style.display == '')  {
			row.style.display = 'none';
                        document.getElementById(componentSpan).innerHTML = '';
		} else {
                        //OK, load the schedule and show schedule table
			row.style.display = '';
                        executeRequest('D',id);
		}

	}
	function saveSchedule(id, day) {
            var s="";
            var p="";
            for (var i=0;i<12;i++){
                var hour = i.toString(10);
                if (hour.length == 1) hour = "0" + hour;
                for (var j=1; j<7; j++) {
                    var idElem = 'la'+id+day.toString(10)+hour+j.toString(10);
                    if (document.getElementById(idElem).className == "schtds") p+="1"; else p+="0";
                }
                p=parseInt(p,2);
                p=p+"";
                while (p.length<3) p="0"+p;
                s+=p;
                p="";
            }
          return s;
        }
        function pL(n,ii,id) {
            var r="<tr><td class=\"schtd\">"+n+"</TD>";
            for (var i=0;i<12;i++) {
		var h=i.toString(10);
		if (h.length==1) h="0"+h;
		for (var j=1;j<7;j++)
                    r+="<td title=\""+i+":"+(j-1)+"0 "+n+"\" class=\"schtdns\" onmouseOver=\"select(this);\" onmousedown=\"selectNoButtCheck(this);\" name=\"la"+id+ii+h+j+"\" id=\"la"+id+ii+h+j+"\"></td>";
            }
            return r+"</tr>";
        }
        function createSchTable(id) {
            var html = "";
            html += "<TABLE class=\"schtable\">";
	    html += "<thead><TR><th class=\"schtd\">&nbsp</th>";
            for (var i=0; i<12; i++) {
		var hour = i;
		if (hour.length == 1) hour = "0" + hour;
                html += "<th class=\"schtd\" colspan=\"3\">"+hour+":00&nbsp;</th>";
                html += "<th class=\"schtd\" colspan=\"3\">"+hour+":30&nbsp;</th>";
            }
            html += "</TR></thead><tbody>";
            html += pL("Monday AM","0",id);
            html += pL("Monday PM","1",id);
            html += pL("Tuesday AM","2",id);
            html += pL("Tuesday PM","3",id);
            html += pL("Wednesday AM","4",id);
            html += pL("Wednesday PM","5",id);
            html += pL("Thursday AM","6",id);
            html += pL("Thursday PM","7",id);
            html += pL("Friday AM","8",id);
            html += pL("Friday PM","9",id);
            html += pL("Saturday AM","10",id);
            html += pL("Saturday PM","11",id);
            html += pL("Sunday AM","12",id);
            html += pL("Sunday PM","13",id);
            html += "</TR></tbody></table>";
            return html;
        }
        function loadSchedule(sch, id) {
            var componentSpan = 'expander'+id+'span';
            document.getElementById(componentSpan).innerHTML = createSchTable(id);
            var binaryCounter = 2;
            for (var day=0;day<14;day++) {                
                for (var i=0;i<12;i++){
                  var hour = i.toString(10);
                  if (hour.length == 1) hour = "0" + hour;
                  for (var j=1; j<7; j++) {
                    var idElem = 'la'+id+day.toString(10)+hour+j.toString(10);
                    if (sch.substring(binaryCounter,binaryCounter+1)=="1") {
                        document.getElementById(idElem).className = "schtds";
                    } else {
                        document.getElementById(idElem).className = "schtdns";
                    }
                    binaryCounter = binaryCounter + 1;
                }
                binaryCounter = binaryCounter + 2;
                }
            }
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
        function executeRequest(action, id) {
            var component = 'expander'+id;
            var row = document.getElementById(component);
            if ((row.style.display == 'none') && (action == 'd')) {
                alert("Cannot save schedule. Load the schedule table first.");
                return;
            }            
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
                    } else if(xhr.status == 200) {
                              if (action == "D") {
                                   if (xhr.responseText.indexOf("asaddfetwerryuyklkmgdmfmcxcx") == -1) {
                                        loadSchedule(xhr.responseText, id);
                                   } else {
                                       hideWaitingFrame();
                                       alert("Session expired. You will be redirected to login page.");
                                       top.location="../servlet";
                                   }
                              }
                              hideWaitingFrame();
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
                  
                  if (action == "b") {
                        //light on
                        urlToSend+="&id="+id;
                  } else if (action == "c") {
                        //light off
                        urlToSend+="&id="+id;
                  } else if (action == "a") {
                        //light off after period
                        var compId = "tl"+id;
                        urlToSend+="&id="+id+"&period="+document.getElementById(compId).value;
                  } else if (action == "d") {
                          //schedule
                          urlToSend+="&id="+id+"&0="+saveSchedule(id, 0)+"&1="+saveSchedule(id, 1)+"&2="+saveSchedule(id, 2)+"&3="+saveSchedule(id, 3)+"&4="+saveSchedule(id, 4)+"&5="+saveSchedule(id, 5)+"&6="+saveSchedule(id, 6)+"&7="+saveSchedule(id, 7)+"&8="+saveSchedule(id, 8)+"&9="+saveSchedule(id, 9)+"&10="+saveSchedule(id, 10)+"&11="+saveSchedule(id, 11)+"&12="+saveSchedule(id, 12)+"&13="+saveSchedule(id, 13);
                  } else if (action == "D") {
                          //load schedule
                          urlToSend+="&id="+id;
                  }
                  xhr.open("GET", urlToSend+"&z="+(new Date()).getTime(), true);
                  xhr.send(null);
        }
        function writeLightTable(id) {
		document.write("<table width=\"100%\" cellspacing=\"0\">");
		document.write("<tr><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
		document.write("<table align=\"center\"><tr><th colspan=2 class=\"lightsth\">Light control</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>");
		document.write("<tr><td><input class=\"lightsbutton\" type=\"button\" value=\"Light on\" onClick=\"executeRequest('b','"+id+"');\"/>");
		document.write("</td><td><input class=\"lightsbutton\" type=\"button\" value=\"Light off\" onClick=\"executeRequest('c','"+id+"');\"/></td></tr>");
		document.write("</table>");
		document.write("</td><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
		document.write("<table align=\"center\"><tr><th colspan=2 class=\"lightsth\">Light on and then off after period</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>");
		document.write("<tr><td><select class=\"lightsbutton\" name=\"tl"+id+"\" id=\"tl"+id+"\">");
		document.write("<option value=\"5\">5 min</option>");
		document.write("<option value=\"15\">15 min</option>");
		document.write("<option value=\"30\">30 min</option>");
		document.write("<option value=\"60\">1 hour</option>");
		document.write("<option value=\"180\">3 hours</option>");
		document.write("<option value=\"240\">4 hours</option>");
		document.write("</select>");
		document.write("</td><td><input class=\"lightsbutton\" type=\"button\" value=\"Execute\" onClick=\"executeRequest('a','"+id+"');\"/>");
		document.write("</td></tr>");
		document.write("</table>");
		document.write("</td></tr><tr>");
		document.write("<td class=\"linktd\" onClick=\"showHideLoadSchedule('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide schedule table</td>");
		document.write("<td class=\"linktd\" onClick=\"executeRequest('d','"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Save schedule</td>");
		document.write("</tr></td></tr><tr style=\"display:none;\" id=\"expander"+id+"\"><td colspan=\"2\"><span id=\"expander"+id+"span\">Not available</span>");
                document.write("</td></tr></table>");
        }
