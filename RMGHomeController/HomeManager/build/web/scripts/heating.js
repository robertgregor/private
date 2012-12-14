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
        function selectH(comp) {
            if (mouseDown==1) {
                var time = comp.title.split('C');
                var list = document.getElementById("tempOpt");
                var tempValue = list.options[list.selectedIndex].value;
                var temp = tempValue.split(" ");
                comp.className=list.options[list.selectedIndex].className;
                comp.title = temp[0]+String.fromCharCode(176)+"C"+time[1];
            }
        }
        function selectNoButtCheckH(comp) {
            var time = comp.title.split('C');
            var list = document.getElementById("tempOpt");
                var tempValue = list.options[list.selectedIndex].value;
                var temp = tempValue.split(" ");
                comp.className=list.options[list.selectedIndex].className;
                comp.title = temp[0]+String.fromCharCode(176)+"C"+time[1];
        }
	function showHideHeatingStatus(id) {
		var component = 'expanderheatingstatus'+id;
		var row = document.getElementById(component);
		if (row.style.display == '')  {
			row.style.display = 'none'; 
		} else {
                        //OK, load the schedule and show schedule table
			row.style.display = '';
                        executeRequestH('HS',id);
		}
                component = 'expanderheatingconfig'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
                component = 'expanderheatingchart'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
                
	}
	function showHideHeatingConfig(id) {
            if (id==0) {
                alert('Cannot assign program to heating control unit.');
                return;
            }
		var component = 'expanderheatingconfig'+id;
		var row = document.getElementById(component);
		if (row.style.display == '')  {
			row.style.display = 'none'; 
		} else {
                        //OK, load the programs and show temperature table
			row.style.display = '';
                        executeRequestH('ha',id);
		}
                component = 'expanderheatingstatus'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
                component = 'expanderheatingchart'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
                
	}
	function showHideHeatingChart(id) {
		var component = 'expanderheatingchart'+id;
		var row = document.getElementById(component);
		if (row.style.display == '')  {
			row.style.display = 'none'; 
		} else {
                        //OK, load the programs and show temperature table
			row.style.display = '';
                        loadConfigChart(id);
		}
                component = 'expanderheatingstatus'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
                component = 'expanderheatingconfig'+id;
                row = document.getElementById(component);
                row.style.display = 'none';
                
	}
        function loadConfigChart(id) {
            showWaitingFrame();
            var type = document.getElementById("chartType"+id).options[document.getElementById("chartType"+id).selectedIndex].value;
            var component = 'expanderchartspan'+id;            
            var statusData = "";
            if (id==13) {
                statusData += "<img src=\"../servlet?action=hch&id=1&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/><br/>";
                statusData += "<img src=\"../servlet?action=hch&id=2&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/><br/>";
                statusData += "<img src=\"../servlet?action=hch&id=3&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/><br/>";
                statusData += "<img src=\"../servlet?action=hch&id=4&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/><br/>";                
            } else if (id==14) {
                for (var i=1; i<13; i++)
                    statusData += "<img src=\"../servlet?action=hch&id="+i+"&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/><br/>";
                    statusData += "<img src=\"../servlet?action=hch&id=0&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/><br/>";
            } else {
                statusData += "<img src=\"../servlet?action=hch&id="+id+"&type="+type+"&z="+(new Date()).getTime()+"\"></img><br/>";
            }
            document.getElementById(component).innerHTML = statusData;
            hideWaitingFrame();
        }
        function convertToHex(number, padding) {
            var retString = number.toString(16).toUpperCase();
            while (retString.length < padding) retString = "0"+retString;
            return retString;
        }
        function getTemperatureFromTitle(title) {
            var ts = title.split(",");
                var td = ts[0]*2;
                try { 
                    if (ts[1].toString(10) == "5") ++td; 
                } catch(e) {}
            return td.toString(16).toUpperCase();
        }
        function getClassForTemperature(temp) {
            var className = "";
            if (temp == "14") className = "schtdsblack"; //10
            if (temp == "1E") className = "schtdswhite"; //15
            if (temp == "22") className = "schtdslightblue"; //17
            if (temp == "24") className = "schtdsblue"; //18
            if (temp == "26") className = "schtdsdarkblue"; //19
            if (temp == "28") className = "schtdslightgreen"; //20
            if (temp == "29") className = "schtdsgreen"; //20,5
            if (temp == "2A") className = "schtdsdarkgreen"; //21
            if (temp == "2B") className = "schtdslightyellow"; //21,5
            if (temp == "2C") className = "schtdsyellow"; //22
            if (temp == "2D") className = "schtdsdarkyellow"; //22,5
            if (temp == "2E") className = "schtdslightpink"; //23
            if (temp == "2F") className = "schtdspink"; //23,5
            if (temp == "30") className = "schtdsdarkpink"; //24
            if (temp == "31") className = "schtdsorange"; //24,5
            if (temp == "32") className = "schtdslightred"; //25
            if (temp == "34") className = "schtdsred"; //26
            if (temp == "38") className = "schtdsdarkred"; //28
            if (temp == "3C") className = "schtdsorangered"; //30
            return className;
        }
        function getTemperatureByClassName(className) {
            if (className == "schtdsblack") return "10";
            if (className == "schtdswhite") return "15";
            if (className == "schtdslightblue") return "17";
            if (className == "schtdsblue") return "18";
            if (className == "schtdsdarkblue") return "19";
            if (className == "schtdslightgreen") return "20";
            if (className == "schtdsgreen") return "20,5";
            if (className == "schtdsdarkgreen") return "21";
            if (className == "schtdslightyellow") return "21,5";
            if (className == "schtdsyellow") return "22";
            if (className == "schtdsdarkyellow") return "22,5";
            if (className == "schtdslightpink") return "23";
            if (className == "schtdspink") return "23,5";
            if (className == "schtdsdarkpink") return "24";
            if (className == "schtdsorange") return "24,5";
            if (className == "schtdslightred") return "25";
            if (className == "schtdsred") return "26";
            if (className == "schtdsdarkred") return "28";
            if (className == "schtdsorangered") return "30";
            return className;            
        }
        function loadProgram(data, id) {
            var temperatureOld = data.substring(data.length-2);
            for (var j = 0; j<7; j++) { //days
                var timeChangeOld = 0;
                for (var i=0; i<6; i++) { //timechanges
                    var position = (j*24) + (i*4);
                    var temperatureNew = data.substring(position+2, position+4);
                    var timeChangeNew = data.substring(position, position+2);
                    if (temperatureNew == temperatureOld) {
                        populatePosition(j.toString(10), timeChangeOld, "C0", temperatureOld, id);                        
                    } else {
                        if (i!=5) {
                            populatePosition(j.toString(10), timeChangeOld, timeChangeNew, temperatureOld, id);
                        } else {
                            populatePosition(j.toString(10), timeChangeOld, timeChangeNew, temperatureOld, id);
                            populatePosition(j.toString(10), timeChangeNew, "C0", temperatureNew, id);                            
                        }
                    }
                    temperatureOld = temperatureNew;
                    timeChangeOld = timeChangeNew;
                }
            }            
        }
        function populatePosition(day, oldPosition, newPosition, temperature, id) {
            for (var i=computeValidPosition(oldPosition); i<computeValidPosition(newPosition); i++) {
                var hour = ((i - (i % 2)) / 2).toString(10);
                if (hour.length == 1) hour = "0" + hour;
                var min = ((i % 2) + 1).toString(10);
                var t = document.getElementById("ha"+id+day+hour+min);
                t.className = getClassForTemperature(temperature);
                var time = (t.title).split('C');
                t.title = getTemperatureByClassName(t.className)+String.fromCharCode(176)+"C"+time[1];
            }            
        }
        function computeValidPosition(hexTimeValue) {
            var h = parseInt(hexTimeValue, 16);
            var min = h % 8;
            var hour = (h-min) / 8;
            if (min > 0) min = 1;
            return (hour*2) + min;
        }
        function computeDaySchedule(id) {            
            var retstring = "";
            var told = document.getElementById("ha"+id+"6232").title;
            told = told.substring(0,told.indexOf(String.fromCharCode(176)));
            for (var j = 0; j<7; j++) {
                var retPiece = "";
                for (var i=0; i<24; i++) {
                    var hour = i.toString(10);
                    if (hour.length == 1) hour = "0" + hour;
                    for (var k=0; k<2; k++) {
                        var t = document.getElementById("ha"+id+j.toString(10)+hour+((k+1).toString(10)));
                        var tit = t.title.substring(0,t.title.indexOf(String.fromCharCode(176)));
                        if (told != tit) {
                            var hourHex = (((hour*8) + (k*3)).toString(16)).toUpperCase();
                            if ((hourHex).length == 1) hourHex = "0" + hourHex;
                            retPiece+=hourHex+getTemperatureFromTitle(tit);
                            told = tit;
                        }
                    }                    
                }
                if (retPiece.length == 0) {
                    retPiece = "00" + getTemperatureFromTitle(told);
                }
                if (retPiece.length > 24) {
                    alert("Schedule cannot contain more than 6 temperature changes per day. Please fix the issue.");
                    return "";
                }
                var lastfour = retPiece.substring(retPiece.length - 4);
                while (retPiece.length < 24) {
                    retPiece = retPiece + lastfour;                   
                }
                retstring += retPiece;
            }
            return retstring;
        }
        function loadConfigHeating(data, id) {
            var statusData = "";
            statusData += "<TABLE class=\"schtable\"><caption class=\"schtd\"><span><table><tr><td style=\"width: 30%;\">";
            statusData += "Temperature selection:</td><td style=\"width: 70%;\"><select style=\"width: 100%;\" id=\"tempOpt\">";
            statusData += "<option class=\"schtdsblack\">10 deg. celsius</option>";
            statusData += "<option class=\"schtdswhite\">15 deg. celsius</option>";
            statusData += "<option class=\"schtdslightblue\">17 deg. celsius</option>";
            statusData += "<option class=\"schtdsblue\">18 deg. celsius</option>";
            statusData += "<option class=\"schtdsdarkblue\">19 deg. celsius</option>";
            statusData += "<option class=\"schtdslightgreen\">20 deg. celsius</option>";
            statusData += "<option class=\"schtdsgreen\" selected=\"selected\">20,5 deg. celsius</option>";
            statusData += "<option class=\"schtdsdarkgreen\">21 deg. celsius</option>";
            statusData += "<option class=\"schtdslightyellow\">21,5 deg. celsius</option>";
            statusData += "<option class=\"schtdsyellow\">22 deg. celsius</option>";
            statusData += "<option class=\"schtdsdarkyellow\">22,5 deg. celsius</option>";
            statusData += "<option class=\"schtdslightpink\">23 deg. celsius</option>";
            statusData += "<option class=\"schtdspink\">23,5 deg. celsius</option>";
            statusData += "<option class=\"schtdsdarkpink\">24 deg. celsius</option>";
            statusData += "<option class=\"schtdsorange\">24,5 deg. celsius</option>";
            statusData += "<option class=\"schtdslightred\">25 deg. celsius</option>";
            statusData += "<option class=\"schtdsred\">26 deg. celsius</option>";
            statusData += "<option class=\"schtdsdarkred\">28 deg. celsius</option>";
            statusData += "<option class=\"schtdsorangered\">30 deg. celsius</option></select></td></tr>";
            statusData += "<tr><td>Heating program:</td><td style=\"width: 70%;\"><select onChange=\"executeRequestH('hp','"+id+"');\" id=\"programSelect"+id+"\" style=\"width: 100%;\"></select></td></tr>";
            statusData += "<tr><td>Create new program:</td><td style=\"width: 100%;\"><input id=\"newProgram"+id+"\" style=\"width: 98%;\" type=\"text\"></td></tr>";
            statusData += "<tr><td>Program management:</td><td style=\"width: 100%;\"><input class=\"lightsbutton\" type=\"button\" value=\"Assign program\" onClick=\"executeRequestH('hpas','"+id+"');\" >&nbsp;&nbsp;<input class=\"lightsbutton\" onClick=\"executeRequestH('hpd','"+id+"');\" type=\"button\" value=\"Delete program\">&nbsp;&nbsp;<input class=\"lightsbutton\" onClick=\"executeRequestH('hps','"+id+"');\" type=\"button\" value=\"Save program\"></td></tr>";
            statusData += "</table>";
            statusData += "</span></caption><thead><TR><th class=\"schtd\">&nbsp;</th>";
            for (var i=0; i<24; i++) {
		var hour = i;
		if (hour.length == 1) hour = "0" + hour;
                statusData += "<th class=\"schtd\" colspan=\"2\" width=\"20px\">"+hour+"</th>";
            }
            statusData += "</TR></thead><TBODY><TR><td class=\"schtd\">Monday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (var j=1; j<3; j++) {
                    var min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Monday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"0"+hour+j+"\" id=\"ha"+id+"0"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR><TR><td class=\"schtd\">Tuesday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (j=1; j<3; j++) {
                    min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Tuesday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"1"+hour+j+"\" id=\"ha"+id+"1"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR><TR><td class=\"schtd\">Wednesday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (j=1; j<3; j++) {
                    min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Wednesday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"2"+hour+j+"\" id=\"ha"+id+"2"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR><TR><td class=\"schtd\">Thursday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (j=1; j<3; j++) {
                    min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Thursday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"3"+hour+j+"\" id=\"ha"+id+"3"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR><TR><td class=\"schtd\">Friday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (j=1; j<3; j++) {
                    min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Friday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"4"+hour+j+"\" id=\"ha"+id+"4"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR><TR><td class=\"schtd\">Saturday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (j=1; j<3; j++) {
                    min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Saturday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"5"+hour+j+"\" id=\"ha"+id+"5"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR><TR><td class=\"schtd\">Sunday</TD>";
            for (i=0; i<24; i++) {
		hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
		for (j=1; j<3; j++) {
                    min = ((j-1)*30).toString(10);
                    if (min.length == 1) min = "0" + min;
                    statusData += "<td title=\"20,5&#176;C "+hour+":"+min+" Sunday\" class=\"schtdns\" onmouseOver=\"selectH(this);\" onmousedown=\"selectNoButtCheckH(this);\" name=\"ha"+id+"6"+hour+j+"\" id=\"ha"+id+"6"+hour+j+"\"><\/td>";
                }
            }
            statusData += "</TR></tbody></table>";

            var compId = "expanderheatingconfigspan"+id;
            document.getElementById(compId).innerHTML = statusData;
            //update program list
            setProgramList("programSelect"+id, data);
            //load the assigned program
            var select = document.getElementById("programSelect"+id);
            var currProg = data.split("|")[0];
            for (i=0; i<select.options.length; i++) {
                if (select.options[i].text == currProg) {
                    select.selectedIndex=i;
                    break;
                }
            }
            executeRequestH('hp',id);
        }        
        function setProgramList(selectName, data) {
            var select = document.getElementById(selectName);
            select.options.length = 0;
            var items = data.split("|");
            for (var i=1; i<items.length; i++) {
                select.options[i-1] = new Option(items[i],i-1);
            }
        }
        function loadStatusPk(data, id) {
                var statusData = "<table class=\"alarmConfigTable\"><tr class=\"alarmTrDark\"><td width=\"40%\">Name:</td><td width=\"60%\">Heating control unit</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Status:</td><td>"+data+"</td></tr></table>";
                var compId = "expanderheatingstatusspan"+id;
                document.getElementById(compId).innerHTML = statusData;            
        }
        function loadStatusHeating(data, id) {
                if ((id == 13) || (id == 14)) {
                    loadAllStatusHeating(data, id);
                    return;
                }
                if (id == 0) {
                    loadStatusPk(data, id);
                    return;
                }
                var pieces = data.split("|");
                var statusData = "<table class=\"alarmConfigTable\"><tr class=\"alarmTrDark\"><td width=\"40%\">Room name:</td><td width=\"60%\">"+pieces[0]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Component ID:</td><td>"+pieces[1]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Program ID:</td><td>"+pieces[2]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Program name:</td><td>"+pieces[3]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Current state:</td><td>"+pieces[4]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Current temperature:</td><td>"+pieces[5]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Expected temperature:</td><td>"+pieces[6]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Open angle:</td><td>"+pieces[7]+"</td></tr>";
                statusData += "<tr class=\"alarmTrDark\"><td>Battery condition:</td><td>"+pieces[8]+"</td></tr>";
                statusData += "<tr class=\"alarmTr\"><td>Last update time:</td><td>"+pieces[9]+"</td></tr></table>";
                var compId = "expanderheatingstatusspan"+id;
                document.getElementById(compId).innerHTML = statusData;
        }
        function loadAllStatusHeating(data, id) {
                var comps = data.split(";");
                var statusData = "<table class=\"alarmConfigTable\"><tr class=\"alarmTrDark\">";
                statusData += "<td width=\"23%\">Room name:</td>";
                statusData += "<td>Component ID:</td>";
                statusData += "<td>Program ID:</td>";
                statusData += "<td>Program Name:</td>";
                statusData += "<td>Current state:</td>";
                statusData += "<td>Current temperature:</td>";
                statusData += "<td>Expected temperature:</td>";
                statusData += "<td>Open angle:</td>";
                statusData += "<td>Battery condition:</td>";
                statusData += "<td>Last update time:</td></tr>";            
                for (var i=0; i<comps.length; i++) {
                    var pieces = comps[i].split("|");
                    if ((i % 2) == 0) {
                        statusData += "<tr class=\"alarmTr\">";
                    } else {
                        statusData += "<tr class=\"alarmTrDark\">";                        
                    }
                    statusData += "<td>"+pieces[0]+"</td><td>"+pieces[1]+"</td><td>"+pieces[2]+"</td><td>"+pieces[3]+"</td><td>"+pieces[4]+"</td><td>"+pieces[5]+"</td><td>"+pieces[6]+"</td><td>"+pieces[7]+"</td><td>"+pieces[8]+"</td><td>"+pieces[9]+"</td></tr>";
                }
                statusData += "</table>";
                var compId = "expanderheatingstatusspan"+id;
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
        function executeRequestH(action, id) {
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
                              if (action == "HS") {
                                   loadStatusHeating(xhr.responseText, id);
                              }
                              if (action == "ha") {
                                   loadConfigHeating(xhr.responseText, id);
                              }
                              if (action == "hp") {
                                  loadProgram(xhr.responseText, id);
                              }
                              if (action == "hps") {
                                  showHideHeatingConfig(id);
                              }
                              if (action == "hpd") {
                                  if (xhr.responseText != "") {
                                      alert('Cannot delete program, it is already assigned to the device '+xhr.responseText);
                                  } else {
                                      showHideHeatingConfig(id);
                                  }
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
                  
                  if (action == "HS") {
                        //heating status
                        urlToSend+="&id="+id;
                  } else if (action == "ha") {
                        //alarm programs
                        urlToSend+="&id="+id;
                  } else if (action == "hpas") {
                        //assign program
                        if (id==0) {
                            alert('Cannot assign program to heating control unit.');
                            return;
                        }
                        var p = document.getElementById("programSelect"+id).options[document.getElementById("programSelect"+id).selectedIndex].text;
                        urlToSend+="&id="+id+"&progid="+p;
                  } else if (action == "hp") {
                        //load program
                        urlToSend+="&id="+escape(document.getElementById("programSelect"+id).options[document.getElementById("programSelect"+id).selectedIndex].text);
                  } else if (action == "hps") {
                        //save/create program
                        var sch = computeDaySchedule(id);
                        if (sch == "") {
                            hideWaitingFrame();
                            return;
                        }
                        p = "";
                        if (document.getElementById("newProgram"+id).value != "") {
                            p=document.getElementById("newProgram"+id).value;
                        } else {
                            p=document.getElementById("programSelect"+id).options[document.getElementById("programSelect"+id).selectedIndex].text;
                        }
                        urlToSend+="&sch="+escape(sch)+"&id="+escape(p);
                  } else if (action == "hpd") {
                        //delete program
                        p = document.getElementById("programSelect"+id).options[document.getElementById("programSelect"+id).selectedIndex].text;
                        urlToSend+="&id="+escape(p);
                  } else if (action == "hct") {
                        //set manually heating
                        p = document.getElementById("tempMan"+id).options[document.getElementById("tempMan"+id).selectedIndex].value;
                        urlToSend+="&id="+id+"&temp="+p;
                  } else if (action == "hcn") {
                        //normal heating
                        urlToSend+="&id="+id+"&type=hcn";                      
                  } else if (action == "hcs") {
                        //summer heating
                        urlToSend+="&id="+id+"&type=hcs";                      
                  } else if (action == "hcf") {
                        //normal heating
                        urlToSend+="&id="+id+"&type=hcf";                      
                  } else if (action == "asi") {
                        //simulate alarm
                        urlToSend+="&id="+id;                      
                  }
                  xhr.open("GET", urlToSend+"&z="+(new Date()).getTime(), true);
                  xhr.send(null);
        }
        function writeHeatingTable(id) {
		document.write("<table width=\"100%\" cellspacing=\"0\">");
		document.write("<tr><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
                if (id!=0) {
                    document.write("<table align=\"center\"><tr><th colspan=2 class=\"lightsth\">Heating manual operation</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>");
                    document.write("<tr><td><select id=\"tempMan"+id+"\">");
                    document.write("<option class=\"schtdsblack\" value=\"20\">10 deg. celsius</option>");
                    document.write("<option class=\"schtdswhite\" value=\"30\">15 deg. celsius</option>");
                    document.write("<option class=\"schtdslightblue\" value=\"34\">17 deg. celsius</option>");
                    document.write("<option class=\"schtdsblue\" value=\"36\">18 deg. celsius</option>");
                    document.write("<option class=\"schtdsdarkblue\" value=\"38\">19 deg. celsius</option>");
                    document.write("<option class=\"schtdslightgreen\" value=\"40\">20 deg. celsius</option>");
                    document.write("<option class=\"schtdsgreen\" value=\"41\">20,5 deg. celsius</option>");
                    document.write("<option class=\"schtdsdarkgreen\" value=\"42\">21 deg. celsius</option>");
                    document.write("<option class=\"schtdslightyellow\" value=\"43\">21,5 deg. celsius</option>");
                    document.write("<option class=\"schtdsyellow\" value=\"44\">22 deg. celsius</option>");
                    document.write("<option class=\"schtdsdarkyellow\" value=\"45\" selected=\"selected\">22,5 deg. celsius</option>");
                    document.write("<option class=\"schtdslightpink\" value=\"46\">23 deg. celsius</option>");
                    document.write("<option class=\"schtdspink\" value=\"47\">23,5 deg. celsius</option>");
                    document.write("<option class=\"schtdsdarkpink\" value=\"48\">24 deg. celsius</option>");
                    document.write("<option class=\"schtdsorange\" value=\"49\">24,5 deg. celsius</option>");
                    document.write("<option class=\"schtdslightred\" value=\"50\">25 deg. celsius</option>");
                    document.write("<option class=\"schtdsred\" value=\"52\">26 deg. celsius</option>");
                    document.write("<option class=\"schtdsdarkred\" value=\"56\">28 deg. celsius</option>");
                    document.write("<option class=\"schtdsorangered\" value=\"60\">30 deg. celsius</option></select></td>");                
                    document.write("<td><input class=\"lightsbutton\" type=\"button\" value=\"Set\" onClick=\"executeRequestH('hct','"+id+"');\"/></td></tr>");
                    document.write("</table>");
                } else {
                    document.write("&nbsp;");
                }
		document.write("</td><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\">");
		document.write("<table align=\"center\"><tr><th colspan=3 class=\"lightsth\">Heating control</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
		document.write("<tr><td><input class=\"lightsbutton\" type=\"button\" value=\"Normal\" onClick=\"executeRequestH('hcn','"+id+"');\"/></td>");
		document.write("<td><input class=\"lightsbutton\" type=\"button\" value=\"Summer\" onClick=\"executeRequestH('hcs','"+id+"');\"/></td>");
		document.write("<td><input class=\"lightsbutton\" type=\"button\" value=\"Full\" onClick=\"executeRequestH('hcf','"+id+"');\"/>");
		document.write("</td></tr>");
		document.write("</table>");
		document.write("</td><td class=\"lightstd\" onmouseover=\"this.style.backgroundColor='green';\" onmouseout=\"this.style.backgroundColor='darkgreen';\"><table align=\"center\"><tr><th class=\"lightsth\">Temperature charts</th></tr><tr><td>&nbsp;</td></tr>");
                document.write("<tr><td><select class=\"lightsbutton\" onChange=\"loadConfigChart('"+id+"');\" id=\"chartType"+id+"\"><option value=\"1\">Last hour</option><option value=\"2\">Last day</option><option value=\"3\">Last week</option><option value=\"4\">Last two weeks</option>");
                document.write("<option value=\"5\">Last month</option><option value=\"6\">Last three month</option><option value=\"7\">Last year</option></select></td></tr>");
                document.write("</table></td></tr><tr>");
		document.write("<td class=\"linktd\" onClick=\"showHideHeatingStatus('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide heating status</td>");
		document.write("<td class=\"linktd\" onClick=\"showHideHeatingConfig('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide heating programs</td>");
		document.write("<td class=\"linktd\" onClick=\"showHideHeatingChart('"+id+"');\" onmouseover=\"this.style.backgroundColor='green';document.body.style.cursor='pointer';\" onmouseout=\"this.style.backgroundColor='darkgreen';document.body.style.cursor='auto';\">Show/Hide heating chart</td>");
		document.write("</tr><tr style=\"display:none;\" id=\"expanderheatingstatus"+id+"\"><td colspan=\"3\"><span id=\"expanderheatingstatusspan"+id+"\">Status is not available</span>");
		document.write("</td></tr><tr style=\"display:none;\" id=\"expanderheatingconfig"+id+"\"><td colspan=\"3\"><span id=\"expanderheatingconfigspan"+id+"\">Config is not available</span>");
		document.write("</td></tr><tr style=\"display:none;\" id=\"expanderheatingchart"+id+"\"><td colspan=\"3\"><span id=\"expanderchartspan"+id+"\">Chart is not available</span>");
                document.write("</td></tr>");
                document.write("</table>");
        }
