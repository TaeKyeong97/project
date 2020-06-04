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