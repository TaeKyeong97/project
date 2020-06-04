$(function() {
            $( "#sortable1, #sortable2" ).sortable({
                connectWith: ".connectedSortable",
                update: function(event, ui) {
                    var productOrder2 = $('#sortable2').sortable('toArray').toString();
                    var obj = document.querySelectorAll(".use");
                    var arr = [];
                    var k;
                    for (k = 0; k < obj.length; k++) {
                        arr[k] = obj[k].innerText;
                    }


                    var productOrder = $("#sortable2>li").length;
                    $("#sortIdx").text (productOrder);

                    var cc = $('#sortable2').sortable('toArray').toString();
                    $("#sortIdx2").html("<input type='hidden' name='c_userID' value='"+cc+"'>");
                    $('#sortable3').empty();
                    var temp = new Array();
                    temp=productOrder2.split(",");
                    for (var i = 0; i < temp.length; i++) {
                    	$("#sortable3").append("<li id='"+temp[i]+"' class='x-xuser-con ui-sortable-handle'> <span>"+arr[i]+"</span><span title='닫기'></span></li>");
                    }
                }
            }).disableSelection();

          //추가한 항목들을 이용하여 추가
            $( "#sortable3, #sortable4" ).sortable({
                  connectWith: ".connectedSortable",
                  update: function(event, ui) {
                      var productOrder = $('#sortable3').sortable('toArray').toString();
                      var dd = $('#sortable4').sortable('toArray').toString();
                      var productOrder5 = $("#sortable4>li").length;
                      $("#sortIdx3").text (productOrder5);

                      $("#sortIdx4").html("<input type='hidden' name='First_G_userID' value='"+dd+"'>");
                      //$("#sortIdx2").html("<input type='hidden' name='G_user' value='"+cc+"'>");
                  }
            }).disableSelection();

        });

// 결제 하기
var openWin;
var title;
var totals;
function openChild(){
	title=document.getElementsByClassName("title")[0].value;
	totals=document.getElementsByClassName("kakaoPay")[0].innerHTML;
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("../pay/Approval.jsp?title="+title+"&&total="+totals,
            "childForm", "width=426, height=550, resizable = no, scrollbars = no");    
}



        function ck(a){
          if(a==1){
            $(".con1").css("display","block");
            $(".con2").css("display","none");
            $(".con3").css("display","none");
            $(".con4").css("display","none");
            $(".con5").css("display","none");
            $(".con6").css("display","none");
          }else if(a==2){
            $(".con1").css("display","none");
            $(".con2").css("display","block");
            $(".con3").css("display","none");
            $(".con4").css("display","none");
            $(".con5").css("display","none");
            $(".con6").css("display","none");
          }else if(a==3){
            $(".con1").css("display","none");
            $(".con2").css("display","none");
            $(".con3").css("display","block");
            $(".con4").css("display","none");
            $(".con5").css("display","none");
            $(".con6").css("display","none");
          }else if(a==4){
          $(".con1").css("display","none");
          $(".con2").css("display","none");
          $(".con3").css("display","none");
          $(".con4").css("display","block");
          $(".con5").css("display","none");
          $(".con6").css("display","none");
        }else if(a==5){
        $(".con1").css("display","none");
        $(".con2").css("display","none");
        $(".con3").css("display","none");
        $(".con4").css("display","none");
        $(".con5").css("display","block");
        $(".con6").css("display","none");
      	}else if(a==6){
      		openChild();
    		return false;
        }else{
        }
      }