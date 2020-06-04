/*태경*/
function searchFriend(userid){
	var toid=$('.searchFriend').val();

    $.ajax({
		url : 'search-friend.op',
		method : 'POST',
		dataType : 'html',
		data : {userId : toid},
		success : function(response) {
            $(".x-xsearch-content").html(response);
		}
	})
}

/*친구추가*/
function xfriendSearchResu(){
	var toid=$('.searchFriend').val();
	var me=$('.searchFriendMe').val();
	name="search-friend-insert.jsp?toID="+toid+"&&ID="+me;
	fetch(name).then(function(response){
      response.text().then(function(text){
       
      })
	});
	$(".x-xchat-xpopup").addClass('x-xchat-xpopupCk');
	
}