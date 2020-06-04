<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>스케줄</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" href="schedule/css/bar.css">	
    <style>
    	header{background-color:rgba(89, 94, 115, 0.15);}
    </style>
  </head>
  <body>
  <%@include file="../head.jsp" %>
  <h1 style="width:100%; line-height:310px; text-align:center; font-weight:300; font-size:32px; position:absolute; ">스케줄 관리</h1>
  <div class="schHead-con" style="margin-top:280px;">
    <div class="sch-mon monON-left">1</div>
    <div class="sch-mon monON-right">2</div>
    <div class="sch-mon">3</div>
    <div class="sch-mon">4</div>
    <div class="sch-mon">5</div>
    <div class="sch-mon">6</div>
    <div class="sch-mon">7</div>
    <div class="sch-mon">8</div>
    <div class="sch-mon">9</div>
    <div class="sch-mon">10</div>
    <div class="sch-mon">11</div>
    <div class="sch-mon">12</div>
  </div>
  <div class="schedule-wrap">
    <button id="sch-add" class="sch-add-1">+</button>
    <div class="sche-row">
      <ul class="sche-orginal" style="margin:0; padding:0; height: border:0; ">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>
    <!--<c:forEach var="sbList" items="${sbList}" varStatus="status">
	    <div class="schedule-row">
	      <div class="schbar schWNum-${sbList.no}" style="width:8.3%">
	        <div class="schLeft-btn"></div>
	        <div class="schCent-btn">
	        </div>
	        <div class="schRight-btn schNum-1">1 </div>
	      </div>
	    </div>
    </c:forEach>-->
    
  </div>
  <!--스케줄 팝업-->
  <div class="sche-popup-wrap" style="z-index:0; top:100%; opacity:0;">
    <div class="sche-popup-head">
      <a href="#s" onclick="clears()">취소</a>
      <span>스케줄 추가</span>
      <a href="#s" onclick="scheAdd()">추가</a>
    </div>
    <div class="sche-popup-bar">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 753 45" style="z-index:5; position:relative;" enable-background="new 0 0 753 45"><text transform="translate(14.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">1</text><text transform="translate(79.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">2</text><text transform="translate(144.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">3</text><text transform="translate(208.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">4</text><text transform="translate(272.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">5</text><text transform="translate(337.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">6</text><text transform="translate(402.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">7</text><text transform="translate(466.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">8</text><text transform="translate(531.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">9</text><text transform="translate(587.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">10</text><text transform="translate(652.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">11</text><text transform="translate(716.115 29.375)" fill="#fff" font-family="NanumSquareR" font-size="21.202">12</text></svg>
      <div class="chepop-bg" style="max-width:742px; height:68%; left:5px; border-radius:25px; display:block; z-index:2; position:absolute; top:8px;"></div>
      <div style="width:100%; max-width:742px; height:68%; left:5px; border-radius:25px; display:block; background:#323448; z-index:1; position:absolute; top:8px;"></div>
    </div>
    <div class="sche-date-wrap">

      <select class="ampm" name="ampm">
        <option value="am">AM</option>
        <option value="pm">PM</option>
      </select>
      <select class="chepopup-startDate" name="sDate">
      	<c:set var="ind" value="0"/>      	
      	<c:forEach begin="0" end="11">
      		<fm:parseNumber  var="indNum" type="number" value="${ind}"/>
      		<c:choose>
      			<c:when test="${indNum<9}">
      				<option value="0${ind=ind+1}:00">0${ind}:00</option>
      			</c:when>
      			<c:when test="${indNum>=9}">
      				<option value="${ind=ind+1}:00">${ind}:00</option>
      			</c:when>
      		</c:choose>			
      	</c:forEach>
      </select>
      ~
      <select class="chepopup-endDate" name="eDate">
        <c:set var="ind" value="0"/>      	
      	<c:forEach begin="0" end="11">
      		<fm:parseNumber  var="indNum" type="number" value="${ind}"/>
      		<c:choose>
      			<c:when test="${indNum<9}">
      				<option value="0${ind=ind+1}:00">0${ind}:00</option>
      			</c:when>
      			<c:when test="${indNum>=9}">
      				<option value="${ind=ind+1}:00">${ind}:00</option>
      			</c:when>
      		</c:choose>			
      	</c:forEach>
      </select>
      <textarea name="name" rows="9" cols="97"></textarea>
    </div>
  </div>
<script>
  var schSENDWidth=0;//현재 bar 생성한 크기
  //전체 크기
  var schDefWidth=$(".schedule-wrap").outerWidth();  //전체 크기
  var schBarWidth=$(".schbar").outerWidth();    //bar 크기
  //하나의 방크기
  var indexWidth=parseInt(schDefWidth)*(8.3/100);
  //각각의 수치 정의
  var schIndexArray=new Array();
  for(var schI=1;schI<=12;schI++){
    schIndexArray[schI]=indexWidth*schI;
  }
  var schBuffer=new Array();
  //초기 바 크기 지정
  //$(".schbar").css("width",schBarWidth);
  //각각의 방크기 정의
  var stateArray=new Array();
  var stateIndex=null;
  var scheo=0;
  var state2=0; //현재 버튼 버퍼 인덱스 번호
  var state3=0; //현재 버튼 버퍼 인덱스 번호

  var hmoveA=document.getElementsByClassName("schedule-wrap")[0];
  function conten(scheoj,schTarget,state){
    stateIndex=state;
      $(document).on("mousemove","body",function(e){
        if(i==1){
          //해당 bar가 원점으로 부터 얼마나 떨어져있는지 찾기
          var schBarLeft=$(".schNum-"+stateIndex).parent().attr("style").split("left: ");
          var schBarLeftInt=0;
          if(schBarLeft.length==2){
            schBarLeftInt=schBarLeft[1].replace("px","");
          }

          //console.log("누른상태에서 움직이면 실행");
          //스크롤시 현재 크기보다 크며는 (스크롤 키우기)
          if(e.pageX+3>schBuffer[state]){
            //var widthBAR=e.pageX+30; //전체 크기 수정
            stateArray[state]=e.pageX+30-parseInt(schBarLeftInt);
            //-$(e.target).parent().css("width",widthBAR);
            //$(schTarget).css("background","red");
            $(".schNum-"+stateIndex).parent().css("width",stateArray[state]);
            //-console.log(e.pageX);
            schBuffer[state]=e.pageX;
            state2=state;

          }else{
            stateArray[state]=e.pageX+30-parseInt(schBarLeftInt);
            //$(".schNum-"+stateIndex).css("background","green");
            $(".schNum-"+stateIndex).parent().css("width",stateArray[state]);
            //-console.log(e.pageX);
            schBuffer[state]=e.pageX;
            state2=state;
          }
        }
      });
  }
  $(document).on("mousedown",".schRight-btn",function(e){
    i=1;
    //해당버튼 정보 저장
    var schTarget=null;
    schTarget=event.target;
    var state=$(schTarget).attr("class").split("-");
    state=state[state.length-1];
    //해당버튼의 좌표
    schBuffer[state]=$(e.target).offset().left;
    conten(scheo,event.target,state);
  });
  hmoveA.addEventListener('mouseup', function(scheo){
      i=0;
      schk=0;
      st=0;
      //bar 놓았을때 이벤트 처리 (위치 재 조정)
      schIndexArray[0]="0";
      if(state3!=0){
        for(var schI=0; schI<=12;schI++){
          if(parseInt(schIndexArray[schI])+50<schDrageBuffer[state3]){
          }else{
            //console.log(schDrageBuffer[state3]);
            $(".schWNum-"+state3).css("left",schIndexArray[schI]);
            //input 값수정
            $(".startDate-"+state3).attr("value",schI+1);
            //input 값수정
            /*
            var schNumWidth=$(".schWNum-"+st).css("width");
            var schNumleft=$(".schWNum-"+st).css("left");
            schNumWidth=schNumWidth.replace("px","");
            schNumleft=schNumleft.replace("px","");
            console.log(Number(schNumWidth)+Number(schNumleft));//수정중
            for(var i=0;i<12;i++){
              if((Number(schNumWidth)+Number(schNumleft))<schDrageBuffer[i]){
              }else{
                console.log(schI+i);
                break;
              }
            }*/
            schI+1
            break;
          }
        }
		
      }
      if($(event.target).attr("id")!="sch-add"){
        var chIAAAA=0;
        //버튼 놓았을때 이벤트 처리 (위치 재 조정)
        for(var schI=1; schI<=12;schI++){
          if(parseInt(schIndexArray[schI])+30<parseInt(stateArray[state2])){
          }else{
            $(".schWNum-"+state2).css("width",schIndexArray[schI]);
            var schArrayTest=$(".startDate-"+$(event.target).attr("class").split("-")[1]);
            if(schArrayTest.length==1){
              if(chIAAAA==1){
                var state=$(".startDate-"+$(event.target).attr("class").split("-")[1]).attr("value");
                $(".endDate-"+$(event.target).attr("class").split("-")[1]).val(Number(Number(state)+Number(schSENDWidth))-2);
              }else{
                var state=$(".startDate-"+$(event.target).attr("class").split("-")[1]).attr("value");
                //left + width 크기 로 endMonth 구하기
                var widthHeight=$(".schWNum-"+$(event.target).attr("class").split("-")[1]).attr("style").replace("width: ","").replace("left: ","");
                var widthArray=widthHeight.split("px;");
                endDateSize=Number(Number(widthArray[0].trim())+Number(widthArray[1].trim()));
                var schI2=0;
                for(var endDateSizeI=1;endDateSizeI<=12;endDateSizeI++){
                	if(schIndexArray[endDateSizeI]==endDateSize){
                		schI2=endDateSizeI;
                		break;
                	}
                }                
                $(".endDate-"+$(event.target).attr("class").split("-")[1]).val(schI2);
                /*//$(".endDate-"+$(event.target).attr("class").split("-")[1]).val(Number(Number(state)+Number(schSENDWidth))-1);
                $(".endDate-"+$(event.target).attr("class").split("-")[1]).val(Number(Number(state)+Number(schI))-1);*/
              }
            }else{
            	var widthHeight=$(".schWNum-"+state2).attr("style").replace("width: ","").replace("left: ","");
                var widthArray=widthHeight.split("px;");
           	 endDateSize=Number(Number(widthArray[0].trim())+Number(widthArray[1].trim()));
            	var schI2=0;
                for(var endDateSizeI=1;endDateSizeI<=12;endDateSizeI++){
                	if(schIndexArray[endDateSizeI]==endDateSize){
                		schI2=endDateSizeI;
                		break;
                	}
                }                
                $(".endDate-"+state2).val(schI2);
                
            	/*
              var state=$(".startDate-"+state2).attr("value");
              $(".endDate-"+state2).val(Number(Number(state)+Number(schI))-1);*/
              chIAAAA=1;
            }
            break;
          }
        }
      }
	//수정
	console.log("마우스 뗏다는");
	
	if($(event.target).attr("class").split(" ")[0]=="schRight-btn"){
		var scheTargetNumber=$(event.target).parent().attr("class").split("-")[1];
		$.ajax({
			url:'scheduleModify.ops',
			method:'post',
			dataType:'html',
			data:{'no':${param.no},'noNum':arrayList[scheTargetNumber-1][2],startMonth:$(".startDate-"+scheTargetNumber).val(),endMonth:$(".endDate-"+scheTargetNumber).val(),startDate:$(".startD-"+scheTargetNumber).val(),endDate:$(".endD-"+scheTargetNumber).val(),ampm:$(".ampm-"+scheTargetNumber).val()},
			seccess:function(response){				
			}
		});
	}else{
		var scheTargetNumber=$(event.target).attr("class").split("-")[1];
		$.ajax({
			url:'scheduleModify.ops',
			method:'post',
			dataType:'html',
			data:{'no':${param.no},'noNum':arrayList[scheTargetNumber-1][2],startMonth:$(".startDate-"+scheTargetNumber).val(),endMonth:$(".endDate-"+scheTargetNumber).val(),startDate:$(".startD-"+scheTargetNumber).val(),endDate:$(".endD-"+scheTargetNumber).val(),ampm:$(".ampm-"+scheTargetNumber).val()},
			seccess:function(response){				
			}
		});
	}
	
	
  });


  //드래그
  var schDrageBuffer=new Array();
  var schDrageStartBuffer=new Array();
  var stateDrageIndex=null;
  //마우스 좌표
  var mouseX=0;
  //마우스 드래그 값
  var mouseDrageX=0;
  //마우스 실제 이동거리
  var mouseDrageRealX=0;
  //드래그 대상의 실제 이동 거리
  var barDrageX=0;
  $(document).on("mousedown",".schbar",function(e){
    if($(event.target).attr("class").split(" ")[0]=="schbar"){
      schk=1;
      var schState = $(event.target).attr("class").split("-");
      schDrageBuffer[schState[1]]=$(e.target).position().left;
      //현재 마우스 좌표 저장
      mouseX=e.pageX;
      drageSchbar(event.target,schState[1],mouseX,schDrageBuffer[schState[1]]);
    }
  });
  function drageSchbar(schTarget,schState,mouseX,schDrageBuffers){
    stateDrageIndex=schState;
    $(document).on("mousemove","body",function(e){
        if(schk==1){
          mouseDrageX=e.pageX;    //현재 마우스 드래그값
          if(mouseX<mouseDrageX){
            mouseDrageRealX=mouseDrageX-mouseX;   //시작 포커스로 부터 실제 이동 거리
            barDrageX=schDrageBuffers+mouseDrageRealX;               //해당 bar의 실제 이동할 거리

            schDrageStartBuffer[schState]=barDrageX;
            $(".schWNum-"+stateDrageIndex).css("left",schDrageStartBuffer[schState]);
            schDrageBuffer[schState]=barDrageX;
            state3=schState;
          }else{
            mouseDrageRealX=mouseDrageX-mouseX;     //시작 포커스로 부터 실제 이동 거리
            barDrageX=schDrageBuffers+mouseDrageRealX;               //해당 bar의 실제 이동할 거리

            schDrageStartBuffer[schState]=barDrageX;
            $(".schWNum-"+stateDrageIndex).css("left",schDrageStartBuffer[schState]);
            schDrageBuffer[schState]=barDrageX;
            state3=schState;
          }
          /*
          if(e.pageX>=schDrageBuffer[schState]){
            schDrageStartBuffer[schState]=e.pageX-60;
            $(".schWNum-"+stateDrageIndex).css("left",schDrageStartBuffer[schState]);

            schDrageBuffer[schState]=e.pageX;
          }else{
            schDrageStartBuffer[schState]=e.pageX-60;
            $(".schWNum-"+stateDrageIndex).css("left",schDrageStartBuffer[schState]);

            schDrageBuffer[schState]=e.pageX;
          }*/
      }
    });
  }


  /*
  * 스케줄 팝업
  */
  var chePopIndexArray = new Array();
  var schePopupWidth=$(".sche-popup-bar").outerWidth();
  var schePopSetting=0;
  schePopupWidth=schePopupWidth*(8.3/100);
  //console.log(schePopupWidth);
  for(var schePopI=1;schePopI<=12;schePopI++){
    chePopIndexArray[schePopI]=schePopupWidth*schePopI;
  }
  var startDate=0;
  var endDate=0;

  var schPopupState=0;
  $(document).on("mousedown",".sche-popup-bar",function(){
    if(schPopupState==0){
      chePopIndexArray[0]=0;
      for(var schePopI=1;schePopI<=12;schePopI++){
        if(chePopIndexArray[schePopI]<event.offsetX){
        }else{
            $(".chepop-bg").css({"width":"50px","margin-left":chePopIndexArray[schePopI-1]+5});
            schePopSetting=chePopIndexArray[schePopI-1];
          break;
        }
      }
      startDate=schePopI;
      schPopupState=1;
    }else{
      for(var schePopI=1;schePopI<=12;schePopI++){
        if(chePopIndexArray[schePopI]-60<event.offsetX){
        }else{
          //console.log(chePopIndexArray[schePopI]);
          //console.log(event.offsetX);
            $(".chepop-bg").css({"width":chePopIndexArray[schePopI-1]-schePopSetting-17});
          break;
        }
      }
      endDate=schePopI-1;
      schPopupState=0;
    }
  });
  $(document).on("mousemove",".sche-popup-bar",function(){
    if(schPopupState==1){
      $(".chepop-bg").css({"width":event.offsetX-schePopSetting+20});
    }
  });

  //날짜 선택을 위한 이벤트
  $(document).on("click","#sch-add",function(){
	  $(".sche-popup-wrap").css({"z-index":"6","top":"50%","opacity":"1"});

  });


  /*
  * 스케줄 추가
  */
  var schI=<c:if test="${sbList!=null}">${sbList.size()+1}</c:if><c:if test="${sbList==null}">1</c:if>;
  function scheAdd(){
    var widths=schIndexArray[endDate]-schIndexArray[startDate-1];
    var schContent="<div class=\"schedule-row\">"
      +"<div class=\"schbar schWNum-"+schI+"\" style=\"width:"+widths+"px; left:"+schIndexArray[startDate-1]+"px;\">"
        +"<div class=\"schLeft-btn\"></div>"
        +"<div class=\"schCent-btn\">"
        +"</div>"
        +"<div class=\"schRight-btn schNum-"+schI+"\">2 </div>"
      +"</div>"
      +"<button id=\"sch-add\" class=\"sch-add-"+schI+"\">+</button>"
      +"<input class='startDate-"+schI+"' type='hidden' name='startMonth' value='"+startDate+"'>"
      +"<input class='endDate-"+schI+"' type='hidden' name='endMonth' value='"+endDate+"'>"
    +"</div>"
    schSENDWidth=endDate-startDate+1;
    $(".schedule-wrap").append(schContent);
    schI++;
    //저장후 초기화
    $(".chepop-bg").css("width","0px");
    $("#sch-add").remove();
    $(".sche-popup-wrap").css({"z-index":"0","opacity":"0","top":"100%"})
    
    /*
     * 스케줄 등록 
     */
    
    $.ajax({
		url:'schedulePro.ops',
		method:'post',
		dataType:'html',
		data:{'no':${param.no},startMonth:startDate,endMonth:endDate,startDate:$(".chepopup-startDate").val(),endDate:$(".chepopup-endDate").val(),ampm:$(".ampm").val()},
		seccess:function(response){				
		}
	});
    //새로 고침    
    startDate=1;
    endDate=2;
    setTimeout(function(){
    	location.reload();
   	},500);
  }
  function clears(){
    $(".chepop-bg").css("width","0px");
    $(".sche-popup-wrap").css({"z-index":"0","opacity":"0","top":"100%"})
    startDate=1;
    endDate=2;
  }

  
  /*
  *	스케줄 불러오기
  *
  */
  var arrayList = [<c:forEach var="sbList" items="${sbList}" varStatus="status">[${sbList.startMonth},${sbList.endMonth},${sbList.no},'${sbList.startDate}','${sbList.endDate}','${sbList.ampm}'],</c:forEach>];
  
  var scheListIndex=<c:if test="${sbList!=null}">${sbList.size()}</c:if><c:if test="${sbList==null}">0</c:if>;
	var schHtml="";	
	for(var schListX=0;schListX<scheListIndex;schListX++){
		schHtml="<div class=\"schedule-row\">"
				      +"<div class=\"schbar schWNum-"+Number(schListX+1)+"\" style=\"width:"+Number(schIndexArray[Number(arrayList[schListX][1])]-schIndexArray[Number(arrayList[schListX][0]-1)])+"px;  left:"+schIndexArray[Number(arrayList[schListX][0]-1)]+"px;\">"
				        +"<div class=\"schLeft-btn\"></div>"
				        +"<div class=\"schCent-btn\">"
				        +"</div>"
				        +"<div class=\"schRight-btn schNum-"+Number(schListX+1)+"\">1 </div>"
				      +"</div>"
				    +"</div>"
				    +"<input class='startD-"+Number(schListX+1)+"' type='hidden' name='startDate' value='"+arrayList[schListX][3]+"'>"
				    +"<input class='endD-"+Number(schListX+1)+"' type='hidden' name='endDate' value='"+arrayList[schListX][4]+"'>"
				    +"<input class='ampm-"+Number(schListX+1)+"' type='hidden' name='ampm' value='"+arrayList[schListX][5]+"'>"
					+"<input class='startDate-"+Number(schListX+1)+"' type='hidden' name='startMonth' value='"+arrayList[schListX][0]+"'>"
					+"<input class='endDate-"+Number(schListX+1)+"' type='hidden' name='endMonth' value='"+arrayList[schListX][1]+"'>"
	    $(".schedule-wrap").append(schHtml);
				    
	}


</script>
  </body>
</html>
