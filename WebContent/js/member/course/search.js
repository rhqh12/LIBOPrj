window.addEventListener("load", function(){

	var header = document.querySelector("#header");
	var searchForm = document.querySelector("#search-form");
	var updateForm = document.querySelector("#update-form");
	var type = updateForm.querySelector("input[name=type]").value;
	var title = header.querySelector(".title span");
	var searchBtn = searchForm.querySelector(".search-btn");
	var favMenu = header.querySelector(".fav-menu");
	var main = document.querySelector("#main");

	main.addEventListener("click", function(e){
		var el = e.target;
		var clsn = el.classList;
		var n = el.nodeName;

		if(n!="B" && n!="SPAN"&& n!="LI"&&!clsn.contains("fav-item")){
			return; 
		} 
			
		if(n == "DIV"){
			var ul = el.previousElementSibling;
			var title = ul.querySelector(".ad-title").textContent;
			var address = ul.querySelector(".ad-address").textContent;
			var type = "insert";
			if(clsn.contains("fill-star"))
				type = "delete";
			var params = "address=" + address+"&title="+title+"&type="+type;
			$.ajax({
				type:"POST",
				dataType: "text",
				url:"favorite",      
				data:params,      
				success:function(args){
					 if(args == "success"){
						 if(type == "insert")
							el.classList.replace("empty-star","fill-star");
						 else
							el.classList.replace("fill-star","empty-star");
					 }
				},   
				error:function(e){ 
					alert(e);
				}  
			});
		} else{ 
			for(; el.nodeName!="UL"; el=el.parentElement);
			var title = el.querySelector(".ad-title").textContent;
			var address = el.querySelector(".ad-address").textContent;
			if(type == "workplace"){
				updateForm.querySelector("input[name=workplace]").value=title;
				updateForm.querySelector("input[name=workplaceAddress]").value=address;
			} else{
				updateForm.querySelector("input[name=home]").value=title;
				updateForm.querySelector("input[name=homeAddress]").value=address;
			}
			updateForm.submit();
		}
		
	});

	favMenu.onclick = function(){
		$.ajax({      
	        type:"GET",
	        dataType: "text",
	        async: false,
	        url:"favorite",      
	        success:function(args){
	        	createFavorite(args);
	        },   
	        error:function(e){
				alert(e);
	        }  
	    });
	}

	searchBtn.onclick = function(){
		var address = searchForm.querySelector(".text-address").value;
		if(address == ""){
			alert('주소를 입력해주세요');
			return;
		}
		var params = "address=" + address;
		//ajax 수정해야 함
	     $.ajax({      
	        type:"GET",
	        dataType: "text",
	        async: false,
	        url:"address",      
	        data:params,      
	        success:function(args){
	        	createAddress(args);
	        },   
	        error:function(e){
	        	 alert(e);
	        }  
		}); 
		
	}

	if(type == "workplace")
		title.textContent = "출근지 설정";
	else
		title.textContent = "퇴근지 설정"; 

	title.onclick = function(){
		updateForm.submit();
	}

});

function createAddress(args){	
	var searchInfo = document.querySelector(".search-info");
	var addressBox = document.querySelector("#address-box");
	var address = JSON.parse(args);
	var list = address.items;
	var template = "";
	if(list.length > 0){
		list.forEach(function(o){//address
			template += '<section class="address-item">';
			template += '	<ul>';
			template += '		<li><span class="ad-title">'+o.title+'</span> <span class="ad-sm">'+o.category+'</span></li>';
			template += '		<li><span class="ad-sm ad-address">'+o.address+'</span></li>';
			template += '		<li><span class="ad-tel">'+o.telephone+'</span></li>';
			template += '	</ul>';
			template += '	<div class="fav-item empty-star">';
			template += '	</div>';
			template += '</section>';
		});
		searchInfo.style.display = "none";
	} else{
		searchInfo.textContent = "검색 결과가 없습니다";
		searchInfo.style.display = "inline";
	}
	addressBox.innerHTML = template;
}

function createFavorite(args){	
	var searchInfo = document.querySelector(".search-info");
	var addressBox = document.querySelector("#address-box");
	var address = JSON.parse(args);
	var list = address.items;
	var template = "";
	if(list.length > 0){
		list.forEach(function(o){//address
			template += '<section class="address-item">';
			template += '	<ul>';
			template += '		<li><span class="ad-title">'+o.title+'</span>';
			template += '		<li><span class="ad-sm ad-address">'+o.address+'</span></li>';
			template += '	</ul>';
			template += '	<div class="fav-item fill-star">';
			template += '	</div>';
			template += '</section>'; 
		})
		searchInfo.style.display = "none";
	} else{
		searchInfo.textContent = "즐겨찾기가 없습니다";
		searchInfo.style.display = "inline";
	}
	addressBox.innerHTML = template;
}