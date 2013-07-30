        function saveSchedule(id, day) {
            var s="";
            var p="";
            for (var i=0;i<12;i++){
                var hour = i.toString(10);
                if (hour.length == 1) hour = "0" + hour;
                for (var j=1; j<7; j++) {
                    var idElem = id+day.toString(10)+hour+j.toString(10);
                    if (document.getElementById(idElem).style.backgroundColor == 'orange') p+="1"; else p+="0";
                }
                p=parseInt(p,2);
                p=p+"";
                while (p.length<3) p="0"+p;
                s+=p;
                p="";
            }
            return s;
        }
        function saveTempSchedule(id, day) {
            var s="";
            var p="";
            for (var i=0;i<12;i++){
                var hour = i.toString(10);
                if (hour.length == 1) hour = "0" + hour;
                for (var j=1; j<5; j++) {
                    var idElem = id+day.toString(10)+hour+j.toString(10);
                    var element = document.getElementById(idElem);
                    s+=getTemperatureFromTitle(element.title.split(String.fromCharCode(176))[0]);
                }
            }
            return s;
        }
        function savePercentSchedule(id, day) {
            var s="";
            var p="";
            for (var i=0;i<12;i++){
                var hour = i.toString(10);
                if (hour.length == 1) hour = "0" + hour;
                for (var j=1; j<7; j++) {
                    var idElem = id+day.toString(10)+hour+j.toString(10);
                    var element = document.getElementById(idElem);
                    s+=getPercentFromTitle(element.title);
                }
            }
            return s;
        }
        function getPercentFromTitle(title) {
            var ts = title.split("%");
            var hxVal = (ts[0]*1).toString(16);
            if (hxVal.length == 1) hxVal = "0" + hxVal;
            return hxVal.toUpperCase();
        }        
        function getTemperatureFromTitle(title) {
            var ts = title.split(",");
                var td = ts[0]*2;
                try { 
                    if (ts[1].toString(10) == "5") ++td; 
                } catch(e) {}
            return td.toString(16).toUpperCase();
        }        
        function pL(n,ii,id) {
            var r="<tr><td class=\"schtd\"><span>"+n+"</span></TD>";
            for (var i=0;i<12;i++) {
		var h=i.toString(10);
		if (h.length==1) h="0"+h;
		for (var j=1;j<7;j++)
                    r+="<td title=\""+i+":"+(j-1)+"0 "+n+"\" class=\"schtd\" name=\""+id+ii+h+j+"\" id=\""+id+ii+h+j+"\" onMouseOver=\"manageSchTableMouseOver(this);\" onMouseDown=\"manageSchTableMouseDown(this);\"></td>";
            }
            return r+"</tr>";
        }
        function pLpercent(n,ii,id) {
            var r="<tr><td class=\"schtd\"><span>"+n+"</span></TD>";
            for (var i=0;i<12;i++) {
		var h=i.toString(10);
		if (h.length==1) h="0"+h;
		for (var j=1;j<7;j++) {
                    var mn = ((j-1)*10).toString(10);
                    while (mn.length == 1) mn = "0"+mn;
                    r+="<td title=\"0% "+i+":"+mn+" "+n+"\" class=\"schtd\" style=\"background-color: green;\" name=\""+id+ii+h+j+"\" id=\""+id+ii+h+j+"\" onMouseOver=\"manageSchPercentTableMouseOver(this,'"+id+"');\" onMouseDown=\"manageSchPercentTableMouseDown(this,'"+id+"');\"></td>";
                }
            }
            return r+"</tr>";
        }
        function pLTemp(n,ii,id) {
            var r="<tr><td class=\"schtd\"><span>"+n+"</span></TD>";
            for (var i=0;i<12;i++) {
		var h=i.toString(10);
		if (h.length==1) h="0"+h;
		for (var j=1;j<5;j++) {
                    var mn = ((j-1)*15).toString(10);
                    while (mn.length == 1) mn = "0"+mn;
                    r+="<td title=\"20,5"+String.fromCharCode(176)+"C "+i+":"+mn+" "+n+"\" class=\"schtd\" style=\"background-color: green;\" name=\""+id+ii+h+j+"\" id=\""+id+ii+h+j+"\" onMouseOver=\"manageSchTempTableMouseOver(this,'"+id+"');\" onMouseDown=\"manageSchTempTableMouseDown(this,'"+id+"');\"></td>";
                }
            }
            return r+"</tr>";
        }
        function manageSchTableMouseDown(tdid) {
                isMouseDown=true;
                manageSchTableMouseOver(tdid);
        }
        function manageSchTableMouseOver(tdid) {
            if (isMouseDown) {
                if (tdid.style.backgroundColor == 'white') {
                    tdid.style.backgroundColor = 'orange';
                } else {
                    tdid.style.backgroundColor = 'white';
                }
            }
        }
        function manageSchTempTableMouseDown(tdid,id) {
                isMouseDown=true;
                manageSchTempTableMouseOver(tdid,id);
        }
        function manageSchTempTableMouseOver(tdid,id) {
            if (isMouseDown) {
                var sel = document.getElementById("temperatureSelect"+id);
                tdid.style.backgroundColor = sel.options[sel.selectedIndex].style.backgroundColor;
                var tempValue = sel.options[sel.selectedIndex].value;
                var temp = tempValue.split(" ");
                var degCelsius = String.fromCharCode(176)+"C";
                tdid.title = temp[0]+degCelsius+tdid.title.split(degCelsius)[1];

            }
        }
        function manageSchPercentTableMouseDown(tdid,id) {
                isMouseDown=true;
                manageSchPercentTableMouseOver(tdid,id);
        }
        function manageSchPercentTableMouseOver(tdid,id) {
            if (isMouseDown) {
                var sel = document.getElementById("percentSelect"+id);
                tdid.style.backgroundColor = sel.options[sel.selectedIndex].style.backgroundColor;
                var percentValue = sel.options[sel.selectedIndex].value;
                var temp = percentValue.split(" ");
                tdid.title = temp[0]+"%"+tdid.title.split("%")[1];
            }
        }
        function createOnOffSchTable(id) {
            var html = "";
            html += "<TABLE id=\""+id+"table\" class=\"schtable\">";
	    html += "<thead><TR><th class=\"schtd\">&nbsp</th>";
            for (var i=0; i<12; i++) {
		var hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
                html += "<th class=\"schtd\" colspan=\"3\">"+hour+":00&nbsp;</th>";
                html += "<th class=\"schtd\" colspan=\"3\">"+hour+":30&nbsp;</th>";
            }
            html += "</TR></thead><tbody>";
            html += pL(monday+" AM","0",id);
            html += pL(monday+" PM","1",id);
            html += pL(tuesday+" AM","2",id);
            html += pL(tuesday+" PM","3",id);
            html += pL(wednesday+" AM","4",id);
            html += pL(wednesday+" PM","5",id);
            html += pL(thursday+" AM","6",id);
            html += pL(thursday+" PM","7",id);
            html += pL(friday+" AM","8",id);
            html += pL(friday+" PM","9",id);
            html += pL(saturday+" AM","10",id);
            html += pL(saturday+" PM","11",id);
            html += pL(sunday+" AM","12",id);
            html += pL(sunday+" PM","13",id);
            html += "</TR><tr><td colspan=\"73\">"+scheduleOnOffProgramsManager(id)+"</td></tr></tbody></table>";
            return html;
        }
        function createPercentSchTable(id) {
            var html = "";
            html += "<TABLE id=\""+id+"table\" class=\"schtable\">";
	    html += "<thead><TR><th class=\"schtd\">&nbsp</th>";
            for (var i=0; i<12; i++) {
		var hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
                html += "<th class=\"schtd\" colspan=\"3\">"+hour+":00&nbsp;</th>";
                html += "<th class=\"schtd\" colspan=\"3\">"+hour+":30&nbsp;</th>";
            }
            html += "</TR></thead><tbody>";
            html += pLpercent(monday+" AM","0",id);
            html += pLpercent(monday+" PM","1",id);
            html += pLpercent(tuesday+" AM","2",id);
            html += pLpercent(tuesday+" PM","3",id);
            html += pLpercent(wednesday+" AM","4",id);
            html += pLpercent(wednesday+" PM","5",id);
            html += pLpercent(thursday+" AM","6",id);
            html += pLpercent(thursday+" PM","7",id);
            html += pLpercent(friday+" AM","8",id);
            html += pLpercent(friday+" PM","9",id);
            html += pLpercent(saturday+" AM","10",id);
            html += pLpercent(saturday+" PM","11",id);
            html += pLpercent(sunday+" AM","12",id);
            html += pLpercent(sunday+" PM","13",id);
            html += "</TR><tr><td colspan=\"73\">"+schedulePercentProgramsManager(id)+"</td></tr></tbody></table>";
            return html;
        }
        function createTempSchTable(id) {
            var html = "";
            html += "<TABLE id=\""+id+"table\" class=\"schtable\">";
	    html += "<thead><TR><th class=\"schtd\">&nbsp</th>";
            for (var i=0; i<12; i++) {
		var hour = i.toString(10);
		if (hour.length == 1) hour = "0" + hour;
                html += "<th class=\"schtd\" colspan=\"2\">"+hour+":00&nbsp;</th>";
                html += "<th class=\"schtd\" colspan=\"2\">"+hour+":30&nbsp;</th>";
            }
            html += "</TR></thead><tbody>";
            html += pLTemp(monday+" AM","0",id);
            html += pLTemp(monday+" PM","1",id);
            html += pLTemp(tuesday+" AM","2",id);
            html += pLTemp(tuesday+" PM","3",id);
            html += pLTemp(wednesday+" AM","4",id);
            html += pLTemp(wednesday+" PM","5",id);
            html += pLTemp(thursday+" AM","6",id);
            html += pLTemp(thursday+" PM","7",id);
            html += pLTemp(friday+" AM","8",id);
            html += pLTemp(friday+" PM","9",id);
            html += pLTemp(saturday+" AM","10",id);
            html += pLTemp(saturday+" PM","11",id);
            html += pLTemp(sunday+" AM","12",id);
            html += pLTemp(sunday+" PM","13",id);
            html += "</TR><tr><td colspan=\"49\">"+scheduleTempProgramsManager(id)+"</td></tr></tbody></table>";
            return html;
        }
        function scheduleOnOffProgramsManager(id) {
            var html = "";
            html += sch_saved_programs+"<SELECT id=\"onoffProgs"+id+"\"></select>&nbsp;&nbsp;&nbsp;";
            html += "<BUTTON title=\""+sch_load+"\" id=\"onoffProgsLoad"+id+"\">&nbsp;</BUTTON><BUTTON title=\""+sch_update+"\" id=\"onoffProgsUpdate"+id+"\">&nbsp;</BUTTON><BUTTON title=\""+sch_delete+"\" id=\"onoffProgsDelete"+id+"\">&nbsp;</BUTTON>&nbsp;&nbsp;&nbsp;";
            html += sch_new_program+"<INPUT id=\"onoffProgsName"+id+"\" type=\"text\"/>";
            html += "<BUTTON title=\""+sch_save_new_program+"\" id=\"onoffProgsSave"+id+"\">&nbsp;</BUTTON>";
            return html;
        }
        function scheduleTempProgramsManager(id) {
            var html = "";
            html += sch_temperature_selection+"<SELECT style=\"background-color: green; color:white;\" onChange=\"this.style.backgroundColor = this.options[this.selectedIndex].style.backgroundColor; this.style.color = this.options[this.selectedIndex].style.color;\" id=\"temperatureSelect"+id+"\">"+populateTempOptions()+"</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            html += sch_saved_programs+"<SELECT id=\"temperatureProgs"+id+"\"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            html += "<BUTTON title=\""+sch_load+"\" id=\"temperatureProgsLoad"+id+"\">&nbsp;</BUTTON><BUTTON title=\""+sch_update+"\" id=\"temperatureProgsUpdate"+id+"\">&nbsp;</BUTTON><BUTTON title=\""+sch_delete+"\" id=\"temperatureProgsDelete"+id+"\">&nbsp;</BUTTON>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            html += sch_new_program+"<INPUT id=\"temperatureProgsName"+id+"\" type=\"text\"/>";
            html += "<BUTTON title=\""+sch_save_new_program+"\" id=\"temperatureProgsSave"+id+"\">&nbsp;</BUTTON>";
            return html;
        }
        function populateTempOptions() {
            var statusData = "";
            statusData += "<option style=\"background-color:black; color:white;\">10 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: white; color:black;\">15 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: lightblue; color:black;\">17 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: blue; color:white;\">18 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: darkblue; color:white;\">19 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: lightgreen; color:black;\">20 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: green; color:white;\" selected=\"selected\">20,5 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: darkgreen; color:white;\">21 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: lightgoldenrodyellow; color:black;\">21,5 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: yellow; color:black;\">22 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: gold; color:black;\">22,5 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: lightpink; color:black;\">23 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: pink; color:black;\">23,5 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: darksalmon; color:black;\">24 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: orange; color:black;\">24,5 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: lightcoral; color:black;\">25 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: red; color:black;\">26 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: darkred; color:white;\">28 "+deg_celsius+"</option>";
            statusData += "<option style=\"background-color: orangered; color:black;\">30 "+deg_celsius+"</option>";
            return statusData;
        }
        function schedulePercentProgramsManager(id) {
            var html = "";
            html += sch_percentage_selection+"<SELECT style=\"background-color: green; color:white;\" onChange=\"this.style.backgroundColor = this.options[this.selectedIndex].style.backgroundColor; this.style.color = this.options[this.selectedIndex].style.color;\" id=\"percentSelect"+id+"\">"+populatePercentOptions()+"</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            html += sch_saved_programs+"<SELECT id=\"percentProgs"+id+"\"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            html += "<BUTTON title=\""+sch_load+"\" id=\"percentProgsLoad"+id+"\">&nbsp;</BUTTON><BUTTON title=\""+sch_update+"\" id=\"percentProgsUpdate"+id+"\">&nbsp;</BUTTON><BUTTON title=\""+sch_delete+"\" id=\"percentProgsDelete"+id+"\">&nbsp;</BUTTON>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            html += sch_new_program+"<INPUT id=\"percentProgsName"+id+"\" type=\"text\"/>";
            html += "<BUTTON title=\""+sch_save_new_program+"\" id=\"percentProgsSave"+id+"\">&nbsp;</BUTTON>";
            return html;
        }
        function populatePercentOptions() {
            var statusData = "";
            statusData += "<option style=\"background-color: green; color:white;\" selected=\"selected\">0 "+percent+"</option>";
            statusData += "<option style=\"background-color: white; color:black;\">10 "+percent+"</option>";
            statusData += "<option style=\"background-color: lightblue; color:black;\">20 "+percent+"</option>";
            statusData += "<option style=\"background-color: yellow; color:black;\">30 "+percent+"</option>";
            statusData += "<option style=\"background-color: darkblue; color:white;\">40 "+percent+"</option>";
            statusData += "<option style=\"background-color: pink; color:black;\">50 "+percent+"</option>";
            statusData += "<option style=\"background-color: black; color:white;\">60 "+percent+"</option>";
            statusData += "<option style=\"background-color: orange; color:black;\">70 "+percent+"</option>";
            statusData += "<option style=\"background-color: red; color:white;\">80 "+percent+"</option>";
            statusData += "<option style=\"background-color: darkred; color:white;\">90 "+percent+"</option>";
            statusData += "<option style=\"background-color: lightcoral; color:black;\">100 "+percent+"</option>";
            return statusData;
        }
        function loadPrograms(data, id) {
           var progs = data.split("\n");
           $('#'+id).children().remove();
           for (var i=0; i<progs.length; i++) {
                $('#'+id).append('<option value="'+progs[i]+'">'+progs[i]+'</option>');
           }

        }
        function loadSchedule(sch, id) {
            var binaryCounter = 2;
            for (var day=0;day<14;day++) {                
                for (var i=0;i<12;i++){
                  var hour = i.toString(10);
                  if (hour.length == 1) hour = "0" + hour;
                  for (var j=1; j<7; j++) {
                    var idElem = id+day.toString(10)+hour+j.toString(10);
                    if (sch.substring(binaryCounter,binaryCounter+1)=="1") {
                        document.getElementById(idElem).style.backgroundColor = 'orange';
                    } else {
                        document.getElementById(idElem).style.backgroundColor = 'white';                        
                    }
                    binaryCounter = binaryCounter + 1;
                }
                binaryCounter = binaryCounter + 2;
                }
            }
        }
        function loadTempSchedule(sch, id) {
            var counter = 0;
            for (var day=0;day<14;day++) {                
                for (var i=0;i<12;i++){
                  var hour = i.toString(10);
                  if (hour.length == 1) hour = "0" + hour;
                  for (var j=1; j<5; j++) {
                    var idElem = id+day.toString(10)+hour+j.toString(10);
                    var temperature = sch.substring(counter,counter+2);
                    populateStyleFromTemperature(document.getElementById(idElem), temperature);
                    counter = counter + 2;
                  }
                }
            }
        }
        function loadPercentSchedule(sch, id) {
            var counter = 0;
            for (var day=0;day<14;day++) {                
                for (var i=0;i<12;i++){
                  var hour = i.toString(10);
                  if (hour.length == 1) hour = "0" + hour;
                  for (var j=1; j<7; j++) {
                    var idElem = id+day.toString(10)+hour+j.toString(10);
                    var percent = sch.substring(counter,counter+2);
                    populateStyleFromPercent(document.getElementById(idElem), percent);
                    counter = counter + 2;
                  }
                }
            }
        }
        function populateStyleFromTemperature(element, temperature) {
            var title = String.fromCharCode(176)+"C"+((element.title.split("C"))[1]); 
            if (temperature == "14") {
                element.style.backgroundColor = "black";
                element.style.color = "white";
                element.title = "10"+title;
            } else if (temperature == "1E") {
                element.style.backgroundColor = "white";
                element.style.color = "black";
                element.title = "15"+title;                
            } else if (temperature == "22") {
                element.style.backgroundColor = "lightblue";
                element.style.color = "black";
                element.title = "17"+title;                
            } else if (temperature == "24") {
                element.style.backgroundColor = "blue";
                element.style.color = "white";
                element.title = "18"+title;                
            } else if (temperature == "26") {
                element.style.backgroundColor = "darkblue";
                element.style.color = "white";
                element.title = "19"+title;                
            } else if (temperature == "28") {
                element.style.backgroundColor = "lightgreen";
                element.style.color = "black";
                element.title = "20"+title;                
            } else if (temperature == "29") {
                element.style.backgroundColor = "green";
                element.style.color = "white";
                element.title = "20,5"+title;                
            } else if (temperature == "2A") {
                element.style.backgroundColor = "darkgreen";
                element.style.color = "white";
                element.title = "21"+title;                
            } else if (temperature == "2B") {
                element.style.backgroundColor = "lightgoldenrodyellow";
                element.style.color = "black";
                element.title = "21,5"+title;                
            } else if (temperature == "2C") {
                element.style.backgroundColor = "yellow";
                element.style.color = "black";
                element.title = "22"+title;                
            } else if (temperature == "2D") {
                element.style.backgroundColor = "gold";
                element.style.color = "black";
                element.title = "22,5"+title;                
            } else if (temperature == "2E") {
                element.style.backgroundColor = "lightpink";
                element.style.color = "black";
                element.title = "23"+title;                
            } else if (temperature == "2F") {
                element.style.backgroundColor = "pink";
                element.style.color = "black";
                element.title = "23,5"+title;                
            } else if (temperature == "30") {
                element.style.backgroundColor = "darksalmon";
                element.style.color = "black";
                element.title = "24"+title;                
            } else if (temperature == "31") {
                element.style.backgroundColor = "orange";
                element.style.color = "black";
                element.title = "24,5"+title;                
            } else if (temperature == "32") {
                element.style.backgroundColor = "lightcoral";
                element.style.color = "black";
                element.title = "25"+title;                
            } else if (temperature == "34") {
                element.style.backgroundColor = "red";
                element.style.color = "black";
                element.title = "26"+title;                
            } else if (temperature == "38") {
                element.style.backgroundColor = "darkred";
                element.style.color = "white";
                element.title = "28"+title;                
            } else if (temperature == "3C") {
                element.style.backgroundColor = "orangered";
                element.style.color = "black";
                element.title = "30"+title;                
            }
        }
        function populateStyleFromPercent(element, temperature) {
            var title = "%"+((element.title.split("%"))[1]); 
            if (temperature == "00") {
                element.style.backgroundColor = "green";
                element.style.color = "white";
                element.title = "0"+title;
            } else if (temperature == "0A") {
                element.style.backgroundColor = "white";
                element.style.color = "black";
                element.title = "10"+title;                
            } else if (temperature == "14") {
                element.style.backgroundColor = "lightblue";
                element.style.color = "black";
                element.title = "20"+title;                
            } else if (temperature == "1E") {
                element.style.backgroundColor = "yellow";
                element.style.color = "black";
                element.title = "30"+title;                
            } else if (temperature == "28") {
                element.style.backgroundColor = "darkblue";
                element.style.color = "white";
                element.title = "40"+title;                
            } else if (temperature == "32") {
                element.style.backgroundColor = "pink";
                element.style.color = "black";
                element.title = "50"+title;                
            } else if (temperature == "3C") {
                element.style.backgroundColor = "black";
                element.style.color = "white";
                element.title = "60"+title;                
            } else if (temperature == "46") {
                element.style.backgroundColor = "orange";
                element.style.color = "black";
                element.title = "70"+title;                
            } else if (temperature == "50") {
                element.style.backgroundColor = "red";
                element.style.color = "white";
                element.title = "80"+title;                
            } else if (temperature == "5A") {
                element.style.backgroundColor = "darkred";
                element.style.color = "white";
                element.title = "90"+title;                
            } else if (temperature == "64") {
                element.style.backgroundColor = "lightcoral";
                element.style.color = "black";
                element.title = "100"+title;                
            }
        }        