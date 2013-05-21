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
        function pL(n,ii,id) {
            var r="<tr><td class=\"schtd\">"+n+"</TD>";
            for (var i=0;i<12;i++) {
		var h=i.toString(10);
		if (h.length==1) h="0"+h;
		for (var j=1;j<7;j++)
                    r+="<td title=\""+i+":"+(j-1)+"0 "+n+"\" class=\"schtd\" name=\""+id+ii+h+j+"\" id=\""+id+ii+h+j+"\" onMouseOver=\"manageSchTableMouseOver(this);\" onMouseDown=\"manageSchTableMouseDown(this);\"></td>";
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
        function createSchTable(id) {
            var html = "";
            html += "<TABLE id=\""+id+"table\" class=\"schtable\">";
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