        /*
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
        */
        function selectNoButtCheckB(comp) {
                if (comp.className=="schtdns") {
                    comp.className="schtds";
                } else {
                    comp.className="schtdns";
                }
        }
	function showHideLoadScheduleB(id) {
		var component = 'expanderB'+id;
                var componentSpan = 'expanderB'+id+'span';
		var row = document.getElementById(component);                
		if (row.style.display == '')  {
			row.style.display = 'none';
                        document.getElementById(componentSpan).innerHTML = '';
		} else {
                        //OK, load the schedule and show schedule table
			row.style.display = '';
                        executeRequestB('E',id);
		}

	}
	function saveScheduleB(id, day) {
            var s="";
            var p="";
            for (var i=0;i<12;i++){
                var hour = i.toString(10);
                if (hour.length == 1) hour = "0" + hour;
                for (var j=1; j<7; j++) {
                    var idElem = 'ba'+id+day.toString(10)+hour+j.toString(10);
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
        function loadScheduleB(sch, id) {
            var componentSpan = 'expanderB'+id+'span';
            document.getElementById(componentSpan).innerHTML = createSchTableB(id);
            var binaryCounter = 2;
            for (var day=0;day<14;day++) {                
                for (var i=0;i<12;i++){
                  var hour = i.toString(10);
                  if (hour.length == 1) hour = "0" + hour;
                  for (var j=1; j<7; j++) {
                    var idElem = 'ba'+id+day.toString(10)+hour+j.toString(10);
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
        /*
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
        */
        function executeRequestB(action, id) {
            var component = 'expanderB'+id;
            var row = document.getElementById(component);
            if ((row.style.display == 'none') && (action == 'e')) {
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
                        if (xhr.responseText.indexOf("asaddfetwerryuyklkmgdmfmcxcx") == -1) {
                              if (action == "E") {
                                   loadScheduleB(xhr.responseText, id);
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
                  
                  if (action == "f") {
                        //blind down
                        urlToSend+="&id="+id;
                  } else if (action == "g") {
                        //stop
                        urlToSend+="&id="+id;
                  } else if (action == "h") {
                        //blind up
                        urlToSend+="&id="+id;
                  } else if (action == "e") {
                          //schedule
                          urlToSend+="&id="+id+"&0="+saveScheduleB(id, 0)+"&1="+saveScheduleB(id, 1)+"&2="+saveScheduleB(id, 2)+"&3="+saveScheduleB(id, 3)+"&4="+saveScheduleB(id, 4)+"&5="+saveScheduleB(id, 5)+"&6="+saveScheduleB(id, 6)+"&7="+saveScheduleB(id, 7)+"&8="+saveScheduleB(id, 8)+"&9="+saveScheduleB(id, 9)+"&10="+saveScheduleB(id, 10)+"&11="+saveScheduleB(id, 11)+"&12="+saveScheduleB(id, 12)+"&13="+saveScheduleB(id, 13);
                  } else if (action == "E") {
                          //load schedule
                          urlToSend+="&id="+id;
                  }
                  xhr.open("GET", urlToSend+"&z="+(new Date()).getTime(), true);
                  xhr.send(null);
        }
        function writeBlindsTable(id) {
            writeTable(id, 'Blinds control');
        }
        function writeWindowsTable(id) {
            writeTable(id, 'Windows control');
        }
        function writeVenetianCropTable(id) {
            writeTable(id, 'Venetian blind crop control');
        }
        function writeVenetianTiltTable(id) {
            writeTable(id, 'Venetian blind tilt control');
        }
        function pB(n,ii,id) {
            var r="<tr><td class=\"schtd\">"+n+"</TD>";
            for (var i=0;i<12;i++) {
		var h=i.toString(10);
		if (h.length==1) h="0"+h;
		for (var j=1;j<7;j++)
                    r+="<td title=\""+i+":"+(j-1)+"0 "+n+"\" class=\"schtdns\" onmouseOver=\"select(this);\" onmousedown=\"selectNoButtCheck(this);\" name=\"ba"+id+ii+h+j+"\" id=\"ba"+id+ii+h+j+"\"></td>";
            }
            return r+"</tr>";
        }
        function createSchTableB(id) {
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
            html += pB("Monday AM","0",id);
            html += pB("Monday PM","1",id);
            html += pB("Tuesday AM","2",id);
            html += pB("Tuesday PM","3",id);
            html += pB("Wednesday AM","4",id);
            html += pB("Wednesday PM","5",id);
            html += pB("Thursday AM","6",id);
            html += pB("Thursday PM","7",id);
            html += pB("Friday AM","8",id);
            html += pB("Friday PM","9",id);
            html += pB("Saturday AM","10",id);
            html += pB("Saturday PM","11",id);
            html += pB("Sunday AM","12",id);
            html += pB("Sunday PM","13",id);
            html += "</TR></tbody></table>";
            return html;
        }
        
        function writeTable(id, title) {
		document.write("<table width=\"100%\" cellspacing=\"0\">");
		document.write("<tr><td colspan=2 class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
		document.write("<table align=\"center\"><tr><th colspan=3 class=\"lightsth\">"+title+"</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>");
		document.write("<tr><td><input class=\"lightsbutton\" type=\"button\" value=\"Down\" onClick=\"executeRequestB('f','"+id+"');\"/>");
		document.write("</td><td><input class=\"lightsbutton\" type=\"button\" value=\"Stop\" onClick=\"executeRequestB('g','"+id+"');\"/></td>");
		document.write("</td><td><input class=\"lightsbutton\" type=\"button\" value=\"Up\" onClick=\"executeRequestB('h','"+id+"');\"/></td></tr>");
		document.write("</table></td></tr>");
		document.write("<tr>");
		document.write("<td class=\"linktd\" onClick=\"showHideLoadScheduleB('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide schedule table</td>");
		document.write("<td class=\"linktd\" onClick=\"executeRequestB('e','"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Save schedule</td>");
		document.write("</tr></td></tr><tr style=\"display:none;\" id=\"expanderB"+id+"\"><td colspan=\"2\"><span id=\"expanderB"+id+"span\">Not available</span>");
                document.write("</td></tr></table>");
        }
