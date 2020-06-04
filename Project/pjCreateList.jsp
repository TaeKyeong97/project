<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title></title>

    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" href="css/admin-p-main2.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>


    <meta charset="utf-8">
    <title></title>
    <script>
      var cka=0;
      function ck(){
        cka=document.getElementsByName('pj-ck');
        var cka_value;
        for(var i=0; i<cka.length; i++) {
        if(cka[i].checked) {
                cka_value = cka[i].value;
            }
        }
        if(cka_value[0]=="a"){
          location.href="PJ.jsp";
        }else{
          alert('준비중 입니다.');
        }
      }
    </script>
    <script type="text/javascript">
      function infoCK(a,b){
        if(a%2==0){
            $(".infock"+b).css("display","none");
            a++;
            $(".infocks"+b).attr("onclick","infoCK("+a+","+b+");");
        }else{
          $(".infock"+b).css("display","table-row");
          a--;
          $(".infocks"+b).attr("onclick","infoCK("+a+","+b+");");
        }
      }
    </script>

  </head>
  <body>
    <%@include file="head.jsp" %>
    <%@include file="nav.jsp" %>
    <main>
      <!--테이블-->
      <table class="x-x-PJList">
        <tr class="head">
          <th>프로젝트 해드</th>
          <td>번호</td>
          <td>프로젝트명</td>
          <td>생성일</td>
          <td>만료일</td>
          <td>참가인원</td>
        </tr>
        <c:if test="${pcl!=null}">
        <tr class="infocks25" onclick="infoCK(1,25)">
          <th>프로젝트 리스트</th>
          <td>25</td>
          <td>이름</td>
          <td>2019-00-00</td>
          <td>2019-00-00 <span class="exp-red">기간연장</span>
            <span class="exp-help">?
              <span class="sub-desc">기간 연장 알림 서비스입니다.<br>
                <span style="width:20px; height:10px; margin:3px 2px; background-color:#ed275f; display:block; float:left;"></span>
                <span> 은 만료일이 얼마 남지 않은 프로젝트를</span>
                <span>실수로 신청을 하지 않아 프로젝트가 만료되어 삭제되는것을 방지하기 위하여 사전에 알려주는 서비스입니다.</span>
              </span>
            </span>
          </td>
          <td>500명</td>
        </tr>
        <tr class="infock25" style="display:none;">
          <td colspan="5" class="t-tsub-wrap">
            <div class="t-tsub-con">
              <div class="t-tsub-col">
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">
                    프로젝트이름 <span>EDIT</span>
                  </div>
                  <div class="t-tinfo-subtitle">
                    폴리프로젝트 2-1
                  </div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">상태</div>
                  <div class="t-tinfo-subtitle">운영중</div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">생성일</div>
                  <div class="t-tinfo-subtitle">
                    2019-00-00 오후 7:30(UTC+09:00)
                  </div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">담당자 <span>EDIT</span></div>
                  <div class="t-tinfo-subtitle">
                    admin,test,ko01
                  </div>
                </div>
              </div>
              <div class="t-tsub-col">
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">
                    프로젝트 접근 IP <span>EDIT</span>
                  </div>
                  <div class="t-tinfo-subtitle">
                    172.0.0.1..
                  </div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">
                    스토리지
                  </div>
                  <div class="t-tinfo-subtitle">
                    50GB(+100GB)
                  </div>
                </div>

                <div class="x-xgraph-wrap">
                  <ul class="t-tgraph-info">
                    <li><span style="background:#72e3b7"></span> 이미지 :</li>
                    <li><span style="background:#f47272"></span> 문서 : </li>
                    <li><span style="background:#aba8b7"></span> 기타 : </li>
                  </ul>
                  <div style="width:100%; height:25px;"></div>
                  <ul class="t-tgraph-info">
                    <li><span style="background:#f7d560"></span> 동영상 :</li>
                    <li><span style="background:#8a72f4"></span> 오디오 :</li>
                    <li><span style="background:#d9dbe0"></span> 여유 :</li>
                  </ul>
                </div>
                <div style=" width: 100%; height: 50px; background: #494e5f; ">
                  <!-- 이미지 -->
                  <div style="width: %;padding:0 0.5%;float: left;height:50px;background: #72e3b7"></div>
                  <!-- 문서 -->
                  <div style="width: %;padding:0 0.5%;float: left;height:50px;background:#f47272"></div>
                  <!-- 기타 -->
                  <div style="width: %;padding:0 0.5%;float: left;height:50px;background:#aba8b7"></div>
                </div>

              </div>
            </div>
          </td>
        </tr>
		<c:forEach var="pcl" items="${pcl}" varStatus="status">
        <tr class="infocks${pcl.pj_no}" onclick="infoCK(1,${pcl.pj_no})">
          <th>프로젝트 리스트</th>
          <td>${pcl.pj_no}</td>
          
          <td>${pcl.pj_title}</td>
          <td>${pcl.pj_dateSlice}</td>
          <c:choose>
          	<c:when test="${pcl.pj_dateRemain>29}">
	          <td>${pcl.pj_serviceDate} <span class="exp-blu">기간연장</span>
		          <span class="exp-help">?
		             <span class="sub-desc">기간 연장 알림 서비스입니다.<br>
		               <span style="width:20px; height:10px; margin:3px 2px; background-color:#ed275f; display:block; float:left;"></span>
		               <span> 은 만료일이 얼마 남지 않은 프로젝트를</span>
		               <span>실수로 신청을 하지 않아 프로젝트가 만료되어 삭제되는것을 방지하기 위하여 사전에 알려주는 서비스입니다.</span>
		             </span>
		          </span>
	          </td>
          	</c:when>
          	<c:otherwise>
	          <td>${pcl.pj_serviceDate} <span class="exp-red">기간연장</span>
		          <span class="exp-help">?
		             <span class="sub-desc">기간 연장 알림 서비스입니다.<br>
		               <span style="width:20px; height:10px; margin:3px 2px; background-color:#ed275f; display:block; float:left;"></span>
		               <span> 은 만료일이 얼마 남지 않은 프로젝트를</span>
		               <span>실수로 신청을 하지 않아 프로젝트가 만료되어 삭제되는것을 방지하기 위하여 사전에 알려주는 서비스입니다.</span>
		             </span>
		          </span>
	          </td>
          	</c:otherwise>
          </c:choose>
          
          <td>50명</td>
        </tr>
        
        <tr class="infock${pcl.pj_no}" style="display:none;">
          <td colspan="5" class="t-tsub-wrap">
            <div class="t-tsub-con">
              <div class="t-tsub-col">
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">
                    프로젝트이름 <span>EDIT</span>
                  </div>
                  <div class="t-tinfo-subtitle">
                    ${pcl.pj_title}
                  </div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">상태</div>
                  <div class="t-tinfo-subtitle">운영중</div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">생성일</div>
                  <div class="t-tinfo-subtitle">
                  	${pcl.pj_date}
                  </div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">담당자 <span>EDIT</span></div>
                  <div class="t-tinfo-subtitle">
                    ${pcl.pj_admin}
                  </div>
                </div>
              </div>
              <div class="t-tsub-col">
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">
                    프로젝트 접근 IP <span>EDIT</span>
                  </div>
                  <div class="t-tinfo-subtitle">
                    172.0.0.1..
                  </div>
                </div>
                <div class="t-tsub-row">
                  <div class="t-tinfo-title">
                    스토리지
                  </div>
                  <div class="t-tinfo-subtitle">
                  <c:if test="${pcl.pj_space=='1'}">
                  	30GB
                  </c:if>
                  <c:if test="${pcl.pj_space=='2'}">
                  	50GB
                  </c:if>
                  <c:if test="${pcl.pj_space=='3'}">
                  	100GB
                  </c:if>(+100GB)
                  </div>
                </div>

                <div class="x-xgraph-wrap">
                  <ul class="t-tgraph-info">
                    <li><span style="background:#72e3b7"></span> 이미지 : ${img[status.index]}</li>
                    <li><span style="background:#f47272"></span> 문서 : ${document[status.index]}</li>
                    <li><span style="background:#aba8b7"></span> 기타 :</li>
                  </ul>
                  <div style="width:100%; height:25px;"></div>
                  <ul class="t-tgraph-info">
                    <li><span style="background:#f7d560"></span> 동영상 : ${movie[status.index]}</li>
                    <li><span style="background:#8a72f4"></span> 오디오 :</li>
                    <li><span style="background:#d9dbe0"></span> 여유 :</li>
                  </ul>
                </div>
                <div style=" width: 100%; height: 50px; background: #494e5f; ">
                  <!-- 이미지 -->
                  <div style="width:${kgg[status.index]}%;float: left;height:50px;background: #72e3b7"></div>
                  <!-- 문서 -->
                  <div style="width:${documentSize[status.index]}%;float: left;height:50px;background:#f47272"></div>
                  <!-- 동영상 -->
                  <div style="width:${movieSize[status.index]}%;float: left;height:50px;background:#f7d560"></div>
                </div>

              </div>
            </div>
          </td>
        </tr>
        </c:forEach>
        </c:if>
      </table>
    </main>
    <aside class="chat-wrap">
      <ul>
        <li>
          <div class="chat-p"></div>
          <div class="chat-n">김태경</div>
        </li>
      </ul>
    </aside>
  </body>
</html>
