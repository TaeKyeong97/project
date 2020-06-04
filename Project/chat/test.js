    var i=0;
    var k=0;
    var g=0;
    var h=0;
$(function() {
    	$(document).on('click', '.x-xapi-but button', function(e){
    		var $me = $(this),
    		$selected = $me.val(),
			$parent = $me.parents('.xchat-in-xcon');
    		var aling="";
	    		if($selected==1){
	    			if(i%2==0){
		    			$parent.find('#inputMessage').css('text-align','left');
		    			$parent.find('.style').val('text-align:left;');
		    			aling="text-align:left;";
		    			i++;
		    			g=0;
		    			k=0;
	    			}else{
	    				$parent.find('#inputMessage').css('text-align','unset');
	    				i++;
	    			}
	    		}else if($selected==2){
	    			if(k%2==0){
		    			$parent.find('#inputMessage').css('text-align','center');
		    			$parent.find('.style').val('text-align:center;');
		    			aling="text-align:center;";
		    			k++;
		    			i=0;
		    			g=0;
	    			}else{
	    				$parent.find('#inputMessage').css('text-align','unset');
	    				k++; 
	    			}
	    		}else if($selected==3){
	    			if(g%2==0){
		    			$parent.find('#inputMessage').css('text-align','right');
		    			aling="text-align:right;";
		    			$parent.find('.style').val('text-align:right;');
		    			g++;
		    			i=0;
		    			k=0;
	    			}else{
	    				$parent.find('#inputMessage').css('text-align','unset');
	    				g++;
	    			}
	    		}else if($selected==4){
	    			if(h%2==0){
		    			$parent.find('#inputMessage').css('font-style','italic');
		    			$parent.find('.style').val('font-style:italic;'+aling);
		    			h++;
	    			}else{
	    				$parent.find('#inputMessage').css('font-style','normal');
		    			$parent.find('.style').val(aling);
		    			h++;
	    			}
	    		}	
    		
    		
    	});
    		
    	});