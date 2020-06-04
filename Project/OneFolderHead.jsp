<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	//해드 사용자 gnb
		userA=1;
		function gnb_userInfo(){
		    if(userA==1){
		      $('.gnb_userInfo').css('display','block');
		      userA++;
		    }else{
		      $('.gnb_userInfo').css('display','none');
		      userA--;
		    }
		}
      a=0;
      function gnb_lstOn(a){
        if(a==1){
          $('.gnb_lst>li>.gnb_notiec').css('display','block');
          a++;
          $('.gnb_lst>li:nth-child(1)>a').attr('onclick','gnb_lstOn('+a+')');
        }else if(a==2){
          $('.gnb_lst>li>.gnb_notiec').css('display','none');
          a--;
          $('.gnb_lst>li:nth-child(1)>a').attr('onclick','gnb_lstOn('+a+')');
        }
      }

      function UPMCkNot(a,b){
        if(a==1){
          //$('.not-popup').css('display','block');
          $('.not-popup-BG').css('display','block');
          $('.popup'+b+'.not-popup-animaE').removeClass('not-popup-animaNone');
          $('.popup'+b+'.not-popup-animaE').addClass('not-popup');

          $('.popup'+b+'.not-popup').removeClass('not-popup-animaE');

          $('.popup'+b+'.not-popup').addClass('not-popup-animaS');
          a++;
          //$('.subMenu>li:nth-child(1)>a').attr('onclick','UPMCkNot('+a+','+b+')');
          $('a[onclick="UPMCkNot('+a+','+b+')"]').attr('onclick','UPMCkNot('+a+','+b+')');
          $('.popup'+b+'.not-popup>.header>div:nth-child(1)').attr('onclick','UPMCkNot('+a+','+b+')');

        }else if(a==2){
          $('.not-popup-BG').css('display','none');
          $('.not-popup-animaS').addClass('not-popup-animaE');
          setTimeout(function() {
            $('.not-popup-animaE').addClass('not-popup-animaNone');
          }, 350);
          //$('.popup'+b+'.not-popup').removeClass('not-popup');

          $('.not-popup-animaE').removeClass('not-popup-animaS');
          a--;
          //$('a[onclick="UPMCkNot('+a+','+b+')"]').attr('onclick','UPMCkNot('+a+','+b+')');
          //$('.popup'+b+'.not-popup>.header>div:nth-child(1)').attr('onclick','UPMCkNot('+a+','+b+')');
        }
      }

      $(document).keyup(function(e) {
        if (e.keyCode == 27) {
          $('.not-popup-BG').css('display','none');
          $('.not-popup-animaS').addClass('not-popup-animaE');
          setTimeout(function() {
            $('.not-popup-animaE').addClass('not-popup-animaNone');
          }, 350);
          $('.not-popup-animaE').removeClass('not-popup-animaS');


        }
      });
    </script>
<header>
      <div class="lnb-but"><span></span><span></span><span></span></div>
      <a href="../index.ops" class="xu-p-logo">
        <span>
          <svg x="0px"
          	 y="0px" viewBox="0 0 31 31" style="enable-background:new 0 0 31 31;" xml:space="preserve">
          <g>
          	<g>
          		<g>
          			<defs>
          				<path id="SVGID_1_" d="M10.6509056,31h-0.0000048c-1.279685,0-2.3266993-1.0470142-2.3266993-2.3266983L8.3242006,2.3278716
          					c0-1.2796847,1.0470152-2.3266995,2.3267002-2.3266995h0.0000048c1.279685,0,2.3266993,1.0470147,2.3266993,2.3266995
          					v26.3454285C12.9776049,29.9529839,11.9305897,31,10.6509056,31z"/>
          			</defs>
          			<clipPath id="SVGID_2_">
          				<use xlink:href="#SVGID_1_"  style="overflow:visible;"/>
          			</clipPath>
          			<g style="clip-path:url(#SVGID_2_);">

          					<image style="overflow:visible;" width="5" height="31" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAfCAIAAACgQJBPAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
          GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAJpJREFUeNq8UEkOwkAMizOpVFQ4
          9PW8kA+A2ASZ4HShhTvkEMVjO8vgsA9Zhcpn/BvbkGONQyDvbDDPd8TMs9KKzJSEle668CCvoe0t
          ngatFBoBibI7i6sU4s0dpYZr2abRmv60zGc/QaUkHpZTRv3op2XALf0eXia/9cc0Yt4/K1Q0LhXc
          xbS7fN87SnJb3qeNz1z84H9fAgwATUU8KMjGFWUAAAAASUVORK5CYII=" transform="matrix(1 0 0 1 8 0)">
          				</image>
          			</g>
          		</g>
          	</g>
          	<g>
          		<g>
          			<g>
          				<defs>
          					<path id="SVGID_3_" d="M9.8018694,4.6670928c0.0295563-0.0240049,0.0594368-0.0476003,0.0892754-0.0712533
          						C9.8605013,4.6188421,9.8307428,4.6425977,9.8018694,4.6670928z"/>
          				</defs>
          				<clipPath id="SVGID_4_">
          					<use xlink:href="#SVGID_3_"  style="overflow:visible;"/>
          				</clipPath>
          				<g style="clip-path:url(#SVGID_4_);">

          						<image style="overflow:visible;" width="1" height="1" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
          GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAA5JREFUeNpiYAACgAADAAAFAAHb
          iZPSAAAAAElFTkSuQmCC" transform="matrix(1 0 0 1 9 4)">
          					</image>
          				</g>
          			</g>
          		</g>
          		<g>
          			<path style="fill:#E4B0FF;" d="M9.485383,7.2421308l0.3379555,0.4705443
          				c0.6078205,0.8462849,1.7914762,1.0474253,2.6445799,0.4557447c0.233923-0.1992941,0.4846869-0.3782043,0.7484303-0.5365505
          				l0.4719172-0.3389435c0.8548861-0.6139946,1.0519781-1.8158102,0.4379787-2.6706958l-0.3379555-0.4705448
          				c-0.4543676-0.6326284-1.2305737-0.9045401-1.9499378-0.7545996c-0.4233437,0.1957169-0.8311281,0.4216666-1.2203264,0.6754251
          				L9.923357,4.571434C9.9123535,4.5793352,9.9019299,4.5877442,9.8911448,4.5958395
          				c-0.0298386,0.023653-0.0597191,0.0472484-0.0892754,0.0712533C9.0514431,5.3038139,8.9017391,6.4295139,9.485383,7.2421308z"/>
          		</g>
          		<g>
          			<g>
          				<g>
          					<defs>
          						<path id="SVGID_5_" d="M18.2082977,2.7406616l-1.2077541-0.1500998
          							c-1.8253126-0.2268541-3.5991402,0.0838981-5.1621933,0.8065228c0.719368-0.1499388,1.495574,0.1219714,1.9499388,0.7546
          							l0.3379555,0.4705462c0.6140022,0.8548856,0.4169073,2.0567017-0.4379778,2.6706958l-0.4719181,0.338943
          							c1.0208054-0.612886,2.2434626-0.9042978,3.5095921-0.7469425l0.6974316,0.0866771
          							c3.0123043,0.3743711,5.1706142,3.1452808,4.7962437,6.1575861l-0.0866776,0.6974316
          							c-0.3743706,3.0123024-3.1452808,5.1706104-6.1575861,4.7962399l-0.6974325-0.0866776
          							c-1.0673351-0.1326485-2.0265045-0.5672398-2.8047295-1.2057705l0.1898623,0.1707859
          							c0.3353329,0.3300838,0.6477108,0.6849346,0.9340696,1.0620899c0.3083172,0.6820717,0.2176151,1.5158577-0.2976704,2.1107197
          							l-0.3832626,0.4424553c-0.4275942,0.4936295-1.0517159,0.7118797-1.6531467,0.6422596
          							c0.9821901,0.5140343,2.0693226,0.8641644,3.2299509,1.0084076l1.2077541,0.1500988
          							c5.2164221,0.6482983,10.0148363-3.0892601,10.6631327-8.3056822l0.1501007-1.2077532
          							C27.162281,8.1873684,23.4247189,3.3889582,18.2082977,2.7406616z"/>
          					</defs>
          					<clipPath id="SVGID_6_">
          						<use xlink:href="#SVGID_5_"  style="overflow:visible;"/>
          					</clipPath>
          					<g style="clip-path:url(#SVGID_6_);">

          							<image style="overflow:visible;" width="16" height="21" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAVCAIAAADAXPmFAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
          GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAS5JREFUeNp8kwFuwzAIRf1JmrXK
          7r8T7gqr0iZQbGxM6mpWhFDMBx628fsjtP5N6336Lna9U7GYd1x2umSbSADOloSSL0Fz0j8rCzAx
          LU+6bTlYZa5MkO4HgaYUhhz4UEq8JsynGqG9cRNXQbCQ+plAI3IFdnENUkRMRwBDq2BxRYD5oK9H
          K+Xt4QytQbdNrSlrKfNN0Emc4SBL9p41TGyYErc4blkDT/liBa4VSku2k4nP0ClOiWxPiWnZz/Md
          oOm65QtT/rbGRujIoP0og7wFxTtynlKeozQGh3FucyUF6D4iu3y9FIjrqUMCtGXVn8tTxfUEiTHz
          B2gsDz218kq4ajpDEkkDtA60JLbeAoD5w3swYns3UtDF78g4o5RmfTfiid2xHhTDWEOZlwADAKho
          z86GuEYdAAAAAElFTkSuQmCC" transform="matrix(1 0 0 1 11 2)">
          						</image>
          					</g>
          				</g>
          			</g>
          			<g>
          				<g>
          					<defs>
          						<path id="SVGID_7_" d="M12.0940065,16.9893246c0.1209145,0.1193333,0.2474833,0.2330303,0.3791828,0.3410892
          							L12.0940065,16.9893246z"/>
          					</defs>
          					<clipPath id="SVGID_8_">
          						<use xlink:href="#SVGID_7_"  style="overflow:visible;"/>
          					</clipPath>
          					<g style="clip-path:url(#SVGID_8_);">

          							<image style="overflow:visible;" width="1" height="2" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAACCAIAAAAW4yFwAAAACXBIWXMAAAsSAAALEgHS3X78AAAA
          GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAABNJREFUeNpi+P//PxMDAwNAgAEA
          Ef4DAKFQnrkAAAAASUVORK5CYII=" transform="matrix(1 0 0 1 12 16)">
          						</image>
          					</g>
          				</g>
          			</g>
          			<g>
          				<path style="fill:#E5A6FF;" d="M12.9161882,21.1164627l0.3832626-0.4424534
          					c0.5152855-0.5948601,0.6059856-1.4286442,0.2976694-2.1107197c-0.2863598-0.3771515-0.5987349-0.7320061-0.9340687-1.0620899
          					l-0.1898623-0.1707859c-0.1316996-0.1080589-0.2582684-0.221756-0.3791828-0.3410892l-0.0743847-0.0669079
          					c-0.01019-0.0091667-0.0207434-0.017643-0.0310755-0.0265522c-0.0298071-0.0243607-0.0595684-0.0487709-0.089653-0.072773
          					c-0.7905006-0.6031914-1.9231091-0.4982719-2.5849943,0.2658367l-0.3832674,0.4424534
          					c-0.5689659,0.6568394-0.6200228,1.6047325-0.1878576,2.3181553c0.7229099,0.7648678,1.5727434,1.4133034,2.5202646,1.9091892
          					C11.8644733,21.8283424,12.4885921,21.6100941,12.9161882,21.1164627z"/>
          			</g>
          		</g>
          	</g>
          </g>
          </svg>
        </span>
        <span>프로젝트 관리자 페이지</span>
      </a>
      <div class="search-con">
        <input class="MyPagesearch" type="search" name="MyPagesearch" placeholder="검색어를 입력해 주세요.">
        <span class="search-btn"><svg x="0px" y="0px" viewBox="0 0 31 31" style="enable-background:new 0 0 31 31;" xml:space="preserve"> <path style="fill:#FFFFFF;" d="M29.8,29.7l-9.4-9.4c2.7-2.1,4.4-5.3,4.4-8.9C24.7,5.1,19.6,0,13.3,0S2,5.1,2,11.3 s5.1,11.3,11.3,11.3c2.1,0,4-0.6,5.7-1.6l9.6,9.6c0.1,0.1,0.3,0.2,0.5,0.2s0.4-0.1,0.5-0.2C30,30.5,30,30,29.8,29.7z M3.5,11.3 c0-5.4,4.4-9.8,9.8-9.8s9.8,4.4,9.8,9.8s-4.4,9.8-9.8,9.8S3.5,16.8,3.5,11.3z"/> </svg></span>
      </div>
      <div class="gnb">
        <ul class="gnb_lst">
		<c:if test="${EM_id!=null}">
          <li>
            <a href="#" onclick="gnb_lstOn(1);">
              <em>알림</em>
              <span><svg x="0px" y="0px" viewBox="0 0 31 31" style="enable-background:new 0 0 31 31;" xml:space="preserve"> <g> <path style="fill:#FFFFFF;" d="M15.9,30c-2.5,0-4.6-2.3-4.7-5.1H5c-0.7,0-1.4-0.4-1.8-1.1C2.8,23,2.6,22,2.9,21.1L7.2,7.6 c0.4-1.2,1-2.2,1.9-2.9c0.9-0.7,1.9-1.1,2.9-1.1h0.7V3c0-1.6,1.1-3,2.6-3h1.4c1.4,0,2.6,1.3,2.6,3v0.6h0.7c1,0,2,0.4,2.9,1.1 c0.8,0.7,1.5,1.7,1.9,2.9l4.3,13.5c0.3,0.9,0.2,1.9-0.3,2.7c-0.4,0.7-1.1,1.1-1.8,1.1h-6.1C20.4,27.7,18.4,30,15.9,30z M11.9,5.5 c-1.4,0-2.7,1.1-3.2,2.8L4.5,21.7c-0.1,0.3-0.1,0.6,0.1,0.9C4.6,22.8,4.8,23,5,23h7.8v1.5c0,2,1.4,3.6,3.1,3.6 c1.7,0,3.1-1.6,3.1-3.6V23h7.8c0.2,0,0.4-0.2,0.5-0.3c0.2-0.3,0.2-0.6,0.1-0.9L23,8.3c-0.5-1.7-1.8-2.8-3.2-2.8h-2.3V3 c0-0.6-0.4-1.1-0.9-1.1h-1.4c-0.5,0-0.9,0.5-0.9,1.1v2.5H11.9z"/> </g> </svg></span>
              <em>알림 갯수</em>
              <div class="intf" style="position:absolute;">1</div>
            </a>
            <div class="gnb_notiec">
              <div class="noti-info">새 알림이 있습니다.</div>
              <div class="gnb_notiec_list">
                오늘 아침 9:30 결산회의 참...
                <div class="lis-info">
                  신규 업무
                </div>
                <div style="width:23px; position:absolute; top:23px; right:20px;">
                  <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"/> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"/> </g> </svg>
                </div>
              </div>
              <div class="gnb_notiec_list">
                오늘 아침 9:30 결산회의 참...
                <div class="lis-info">
                  신규 업무
                </div>
                <div style="width:23px; position:absolute; top:23px; right:20px;">
                  <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"/> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"/> </g> </svg>
                </div>
              </div>
            </div>
          </li>
		</c:if>
          <li style="margin-top:12px;">
            <c:if test="${EM_id==null}">
            <a href="../login/login.ops?loginCk=1">
              <div class="u_Name">로그인</div>
            </a>
            <a href="../join/v1join.jsp">
              <div class="u_Name">회원가입</div>
            </a>
            </c:if>
            <c:if test="${EM_id!=null}">
            <a href="#" class="u_info" onclick="gnb_userInfo()">
              <em>사용자 프로필</em>
              <img src="../upload/${user_imgFolder}/${user_imgName}" alt="">
            </a>
            <a href="#" onclick="gnb_userInfo()">
              <em>사용자 이름</em>
              <div class="u_Name">
	              	${user_name}
              </div>
            </a>
            <div class="gnb_userInfo">
              <a href="../infoChange.ops" class="u_info">
                <em>사용자 프로필</em>
                <img src="../upload/${user_imgFolder}/${user_imgName}" alt="">
              </a>
              <a href="../infoChange.ops">
                <div class="u_Name">
		              	${user_name}
                </div>
              </a>
              <a href="../logout/logoutPro.ops" class="logo_out_con">로그아웃</a>
            </div>
            </c:if>
          </li>
          <li>
            <a href="#">
              <em>채팅</em>
              <span>
<svg x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <path style="fill:#FFFFFF;" d="M3.8,4.7l61.6,15.9l28.8,48.6l-63.6-2.7l-2.1,0.8L3.8,92.3l0-24.2l0,0V4.7 M1,1.2v67l0,0l0,30.9 l29.3-29.6l68.7,2.9l-31.9-54L1,1.2L1,1.2z"/> <path style="fill:#FFFFFF;" d="M13.5,52.8l16.8-17.2c0.5-0.6,1.4-0.6,2-0.1l9.5,8l20.3-16.8L45,52.4c-0.7,1.1-2.2,1.4-3.3,0.5 l-9.5-7.4L13.5,52.8z"/> </g> </svg>
              </span>
            </a>
          </li>
        </ul>
      </div>
    </header>