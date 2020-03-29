

// list 체크 박스 전체 선택
$(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    })
});
    


// list 텍스트 신고인 경우 처리해주는 제이쿼리
$(function(){
	
	$(".member-table>tbody>tr").each(function(){
	
	// report 처리 값
 	var report = $(this).children().eq(7).text();
 	
	 	// report 처리값
	 	if(report > 9){
	 		$(this).children().eq(7).css('color', '#C90000');
	 	}
	 	
 		$(this).children().eq(7).append("회");

 	// blacklist 처리값
 	var bUser = $(this).children().eq(9).text();

	 	if(bUser.length > 5){
	 		$(this).css({'background-color':'#FCFCFC','color':'#C90000'});
	 	}
	});
});


// list에 null 값 있는 경우 공백으로 리턴하는 제이쿼리
$(function(){
	
	$(".member-table>tbody>tr>td").each(function(){
		
		if($(this).text() === "null"){
			$(this).text("");
		}

	});
});



/************* 모달 *************/


// 신고 회수 눌렀을 경우 모달 상세 보기
$('#report-modal').on('show.bs.modal', function (event){
		
	var button = $(event.relatedTarget);
	nno = button.data('no');

	reportList(nno);
	
})
	    
	    
	 function reportList(nno){
		
		var str = '신고된 내역이 없습니다.';
		
		$.ajax({
			url:"rlist.ame",
			data:{nno:nno},
			type:"get",
			success:function(list){
			
			var value="";
			
			if(!list.length){
				
				value += "<tr>" +
							"<td colspan='5'>" +str+ "</td>" +
							"</tr>"
							
			}else{
			
				for(var i in list){
					if(list[i].reportCategory == '리뷰'){
						value += "<tr>" +
								"<td><input type='checkbox' class='chk1' name='chk1' id='reportChk' value='" +
								list[i].reportNo +
								"'></td>" +
								"<td>" + list[i].reportDate+ "</td>" +
								"<td>" + list[i].reContent + "</td>" +
								"<td>" + list[i].reportContent+ "</td>" +
								"<td>" + list[i].reporter+ "</td>" + 
							 "<tr>"
					}
				}
				
			}
			
				
				$(".report-table tbody").html(value);
				
				ttt = $(this);
				
			},
			error:function(){
			console.log("ajax 통신 실패!!");
			}
		});
	   }


// 신고 내역 삭제
$(function(){
	$("#review-delete").click(function(){
		
		// checkbox 체크된 값 가져오기
		var chkR = new Array();
		$("input[name=chk1]:checked").each(function(){
		
				chkR += $(this).val();

		})
		
		$.ajax({
			url:"rdelete.ame",
			data:{chkR:chkR},
			type:"post",
			success:function(result){
				//location.reload(true);
				//$("#test").click();
				ttt.css("display", 'block');
				reportList(nno);
			},
			error:function(){
				console.log("ajax 통신실패!!");	
			}					
		});
		
	});
	
})


// 블랙리스트 모달 창으로 값 넘기기

     $(function(){
    	 $("#black").click(function(){
    		 
    		 var mname = new Array;
    		 $("input[name=chk]").each(function(index, item){
    			 if($(item).is(':checked')){ 
    			 	mname.push($(item).val());
    			 }
    		 })
    		var mnameJoin = mname.join();
    		 	
    		 $("#blackId").html(mnameJoin);

    	 })
     })
   
   $(function(){
	   
	   $("#blackSubmit").click(function(){
		   
		   var mId = $("#blackId").text();
		   
		   //var mIdArray = mId.split(',');
		 
		 $.ajax({
			url:"blacklist.ame",
			data:{mIdArray:mId}, //mIdArray:"user01,user02"
			type:"get",
			success:function(result){
				console.log("블랙리스트 ajax 통신성공!!");	
				location.reload(true);
			},
			error:function(){
				console.log("블랙리스트 ajax 통신실패!!");	
			}
		});
		 
	 })
	   
   })
   
   // 쿠폰 발급
   
   		function couponSubmit(){
			
			chkRR = new Array();
			var cNo = "";

			$("input:checkbox[name=chk]:checked").each(function(){
					chkRR.push($(this).next().val());
			})
			
				cNo = $(".selectCoupon option:selected").val();

			console.log(cNo);
			
			console.log(chkRR);
			var chkk = chkRR.join();

			$.ajax({
				url:"insert.amc",
				data:{"chkk":chkk,"cNo":cNo},
			    type:"get",
			    success:function(result){
			    	
			    	location.reload(true);
			    	console.log("ajax 통신성공!!");
			    },
			    error:function(){
			    	console.log("ajax 통신실패!!");
			    }
			})
			
		}

	// 구독권 발급

	$("#subManage").click(function(){
	
    if($("input:checkbox[name=chk]:checked").length > 1){
        alert("해당 서비스는 한 명만 발급 및 연장이 가능합니다.");
        
     }
     $(this).attr({
        'data-toggle' : 'modal',
        'data-target' : '#basicModal2'
     });
})
   