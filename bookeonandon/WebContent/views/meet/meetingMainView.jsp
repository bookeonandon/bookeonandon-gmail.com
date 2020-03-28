<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.meet.model.vo.PageInfo"%>
<%@page import="com.kh.meet.model.vo.Meet"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Meet> list = (ArrayList<Meet>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Member loginUser1 = (Member)session.getAttribute("loginUser");
	int userNo = -1;
	if(loginUser1 != null){
		userNo = loginUser1.getMemberNo();
	}
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!--커밋커밋 주희주희ㄷㅈㄱㅈㄱㅈㄷㄱㅈㄷㄱㅈㄷㄷㄴ-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="#">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<link rel= "stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/meetMainView.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cc556abb66e18207618376a432eecfd&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--datetimepicker1  -->
<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<!-- sweetalert  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<body>
<!-- 아무eee거나 -->
	<%@ include file="../common/menubar.jsp"%>
	<div style="clear:both;"></div>
	<div class="meetContent">
		<!-- 최종수정 되나  -->
		<% if(list.isEmpty()){ %>	
					<p>조회된 리스트가 없습니다.</p>
				<% }else{ %>
					<% for(Meet m : list){ %>
		<div class="meetRoom" data-toggle="modal" data-target="#exampleModal">
		<div class="roomNo" style="display:none"><%=m.getRoomNo() %></div>
		<div class="memberNo" style="display:none"><%=m.getMemberNo() %></div>
			<div class="roomTitle"><%=m.getRoomTitle() %></div>
			<hr>
			<div>
				<div class="roomCategory">
						<% String[] checkedInterest = new String[6];%>
					<%
						String[] genre = null;
								if (m.getGenre() != null) {
									for (int i = 0; i < list.size(); i++) {
										genre = m.getGenre().split(",");
									}
									for (int i = 0; i < genre.length; i++) { %>
											<div id="ctgy<%=i %>_<%=m.getRoomNo()%>"><%=genre[i].toString() %></div>	
									<% }
								}%>
				</div>
				<div class="roomMembers" id="roomMembers">인원 : <%= m.getRoomNowPP()+"/" + m.getRoomTotalPP() %></div>
			</div>

			<div class="conAndbook">
				<div class="roomContent">
					<p><%=m.getRoomContent()%></p>
				</div>
				<div class="bookImg"><img id="bookImg" style="width: 90px; height: 139px;" src="<%=request.getContextPath()+"/resources/images/meetImage/"+m.getBookImg() %>"></div>
					
			</div>
		</div>
		<% } %>
	<% } %>
	</div>
	<br>
	
	<!-- Modal -->
		<div class="ThisRoomNo" style="display:none"></div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
				<div class="dropdown" id="modalDropdown" style="visibility: hidden;">
					<button class="dropbtn"><img src="<%=request.getContextPath()%>/resources/images/meetImage/modalList.png" id="search-image" width="30px" height="30px"></button>
					<div class="dropdown-content">
						<a href="javascript:ModalDropdownSel('main');">메인화면</a> 
						<a href="javascript:ModalDropdownSel('commu');">커뮤니티</a> 
						<a href="javascript:ModalDropdownSel('fixmeet');">정기모임</a>
						<a href="javascript:ModalDropdownSel('setting');">설정</a>
					</div>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true" class="closeX">&times;</span>
		        </button>
		        <p id="header-name"></p>
		        <hr class="modal-hr">
		        
		  <!--modalMain  -->
		  <div id= "modalMain">
		      <div class="modal-header">
		       <h3 class="modal-title" id="modal-title"></h3>
		       <div class="modal-Members" id="modal-Members"></div>
		      </div>
		     
    

		      <div class="modal-category" id="modal-category">

		      </div>
		      <div class="modal-body">
				<div class="modal-DivCon"><p id="modal-Pcon"></p></div>
				<div class="modal-DivImg">
				<p style="text-align: center;">현재 구독중인 책</p>
				<div class="modal-DivImg2"><img id="modalBookImg" style="width: 285px; height: 378px;" src=""></div>
				</div>
		      </div>   
				 <div id="div_apply">
				 <button id="btn_apply" onclick="goApply();">신청하기</button>
				 <button id="btn_applyDone" disabled="disabled">신청완료!</button></div>
		      </div>

				<!--modalCommunity  -->
				<div id="modalCommunity" style="display: none;">
					<div class="modal2-body">
						<div class="modal2-nav-left">
							<table class="modal2-nav-lt">
							</table>
						</div>
						
						<div class="modal2-nav-right">
						<div style=" margin-top: 6px;"><p style="font-size: 17px; margin: 7px; width: 400px; display: inline-block; float: left;">한줄글</p></div>
						<div><span style="color:#aaa; float: right; margin-right: 119px; margin-top: 12px;" id="counter">(0 / 최대 30자)</span></div>
						<div><textarea class="modal2-nav-textarea" cols="50" rows="10"></textarea></div>
						<div><button id="btn_comment" onclick="insertComment();">등록</button></div>
						<br both="clear">
						<div class="modal2-nav-div-history">
						<table class="modal2-nav-right-history">
						
						</table>
						</div>
						</div>
					</div>
				</div>

				<!--fixmeet  -->
				<div class="fixmeet" id="fixmeet" style="display: none;">
					<div class="fixmeet-left">
						<div class="showFixmeet1" style="text-align: center; margin-left: 30px;">
						<input class="inputAddress" id="inputAddress" type="text" onclick="goAddressApi('0')" placeholder="주소를 검색하시려면 여기를 눌러봐요!" readonly="readonly">
						<input type="text" id="picker" class="inputdate" />
						</div>
						<div class="showFixmeet2" style="text-align: center; margin-left: 30px;">
						<p class="showAddress"></p>
						<p class="showDateTime"></p>
						</div>
						<div id="map" style="width: 100%; height: 500px; border-radius: 20px; margin-left: 20px;"></div>
					</div>
					<div class="fixmeet-right1">
					<div><button class='btnFixmeetSave' id='btnFixmeetSave' onclick='fixmeetSave();'>저장하기</button></div> 
					<textarea class='fixmeet-right-text' id='fixmeet-right-text;'></textarea>
					</div>
					<div class="fixmeet-right2">
					<div><button class='btnFixmeetSave2'>메롱메롱</button></div>
					<textarea class='fixmeet-right-text2' id='fixmeet-right-text2;'></textarea>
					</div>
				</div>

				<!--setting  -->
		    <div id="setting" style="display:none;">
				<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
		            <input type="file" id="FILE_TAG" name="FILE_TAG">
		            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a>
       			 </form>
       			 <div><img class="settingMemImg" alt="" src=""></div>
		    </div>
		   </div>
		  </div>
		</div>
	
		<script>
		
		
		var roomNo;
		var memberNo;
		
		function uploadFile(){
            var form = $('#FILE_FORM')[0];
            var formData = new FormData(form);
            formData.append('roomNo', roomNo);
            formData.append('userNo', <%=userNo%>);
            /* formData.append("fileObj", $("#FILE_TAG")[0].files[0]); */
            $.ajax({
                url: 'uploadMemFile.mt',
                        processData: false,
                        contentType: false,
                        data: formData,
                        type: 'POST',
                        success: function(result){
                            alert("업로드 성공!!");
                        },
                        error: function(){
                        	alert("업로드 실패!!");
                        }
                });
        }
		
		$(function(){
			$(".meetRoom").click(function(){
				
				roomNo = $(this).children().eq(0).text();
				memberNo = $(this).children().eq(1).text();
				var roomTitle = $(this).children().eq(2).text();
				var ctgy0 = document.getElementById("ctgy0_"+roomNo).innerHTML;
				$("#modal-category").empty();
				$("#modal-category").append("<div class='modal-ctgy0' id='modal-ctgy0'>"+ctgy0+"</div>");
				
				var ctgy1 = null;
				var ctgy2 = null;
				
				if(document.getElementById("ctgy1_"+roomNo) != null){
				  ctgy1 = document.getElementById("ctgy1_"+roomNo).innerHTML;
				  
				  $("#modal-category").append("<div class='modal-ctgy1' id='modal-ctgy1'>"+ctgy1+"</div>");
				}
				
				if(document.getElementById("ctgy2_"+roomNo) != null){
				  ctgy2 = document.getElementById("ctgy2_"+roomNo).innerHTML;
				  
				  $("#modal-category").append("<div class='modal-ctgy2' id='modal-ctgy2'>"+ctgy2+"</div>");
				}
				
				var roomMembers = document.getElementById("roomMembers").innerHTML;
				var roomContent = $(this).children().eq(5).text();
				$("#modalBookImg").attr('src', $(this).find('img').attr('src'));
				<%-- <img id="bookImg" style="width: 90px; height: 139px;" src="<%=request.getContextPath()+"/resources/images/meetImage/"+m.getBookImg() %>"> --%>
				console.log(roomNo);
				console.log(memberNo);
				console.log(roomTitle);
				console.log(ctgy0);
				console.log(ctgy1);
				console.log(ctgy2);
				console.log(roomMembers);
				console.log(roomContent);
				/* console.log(src); */
				
				document.getElementById("modal-title").innerHTML=roomTitle;
				document.getElementById("modal-Pcon").innerHTML=roomContent;
				document.getElementById("modal-Members").innerHTML=roomMembers; 
				<%-- location.href="<%=contextPath%>/modal.me?mId=" + mId; --%>
				goModal(roomNo);
			});
		});
				
		function goModal(roomNo){
					var userNo = <%=userNo%>;
					/* console.log(userNo); */
			 		roomNo = roomNo;
			 		ModalDropdownSel("main");
 			 		$.ajax({
			 			url:"applyJoin.mt",
						data : {
							userNo : userNo,
							roomNo : roomNo
						},
						type : "POST",
						success : function(rms) {
							/* console.log(rms); */
								
							$('#btn_apply').css("display", "inline-block");
							$('#btn_applyDone').css("display", "none");
							$('#modalDropdown').css("visibility", "hidden");
							
							if(userNo == -1){
								$('#btn_apply').css("display", "none");
								$('#btn_applyDone').css("display", "none");
							}
							
							if(rms.applyYN == "Y"){
								$('#btn_apply').css("display", "none");
								$('#btn_applyDone').css("display", "inline-block");
							}
							
							if(rms.joinYN == "Y"){
								$('#modalDropdown').css("visibility", "visible");
								$('#btn_apply').css("display", "none");
								$('#btn_applyDone').css("display", "none");
							}
						},
						error : function() {
							console.log("ajax 통신 실패!!");
						}
					});
				}
		
		function goApply(){
			var userNo = <%=userNo%>;
	 		roomNo = roomNo;
	 		$.ajax({
	 			url:"doApply.mt",
				data : {
					userNo : userNo,
					roomNo : roomNo
				},
				type : "POST",
				success : function(rms) {
					if(rms != null){
						goModal(roomNo);
					}
				},
				error : function() {
					console.log("ajax 통신 실패!!");
				}
			});
		}
		
		
		function ModalDropdownSel(val){
			
			if(val == "main"){
				$('#modalMain').css("display", "block");
 				$('#modalCommunity').css("display", "none");
 				$('#fixmeet').css("display", "none");
 				$('#setting').css("display", "none");
			}
			if(val == "commu"){
				$('#modalMain').css("display", "none");
 				$('#modalCommunity').css("display", "block");
 				$('#fixmeet').css("display", "none");
 				$('#setting').css("display", "none");
 				setCommunication();
 				setchatting();
			}
			if(val == "fixmeet"){
				$('#modalMain').css("display", "none");
 				$('#modalCommunity').css("display", "none");
 				$('#fixmeet').css("display", "block");
 				$('#setting').css("display", "none");
 				initfixmeet();
			}
			if(val == "setting"){
				$('#modalMain').css("display", "none");
 				$('#modalCommunity').css("display", "none");
 				$('#fixmeet').css("display", "none");
 				$('#setting').css("display", "block");
			}
		    /* case "fixmeet" : break;
		    case "setting" : break; */
		}
		
		function setCommunication(){
	 		roomNo = roomNo;
	 		memberNo = memberNo;
			userNo = <%=userNo%>;
			$.ajax({
	 			url:"doCommu.mt",
				data : {
					/* userNo : userNo, */
					roomNo : roomNo
				},
				type : "POST",
				success : function(list) {
					console.log(list);
					if(list != null){
						var value="";
						var contextPath = "<%=request.getContextPath()%>";
						for(var i=0;i<list.length;i++){
							if(userNo == memberNo){
								value += 
									"<tr>" +
									"<td>" +
									"<img style='width:40px; height:40px; border-radius:20px; margin: 10px; margin-left:30px;' src='"+ contextPath + "/" + list[i].memberPic +"'>" + 
									"<p class='modal2-nav-lt-p'>" + list[i].memName + "</p>" +
									"</td>" +
									"<td style='width: 50px;'><img class='deleteMember' value='"+list[i].memberNo+"/"+list[i].roomNo+"' style='width:15px; height:15px;' src='resources/images/meetImage/close.png'></td>" +
									"</tr>"
							}else{
								 value += 
									"<tr>" +
									"<td>" +
									"<img style='width:40px; height:40px; border-radius:20px; margin: 10px; margin-left:30px;' src='"+ contextPath + "/" + list[i].memberPic +"'>" + 
									"<p class='modal2-nav-lt-p'>" + list[i].memName + "</p>" +
									"</td>" +
									"</tr>"
							}
						}
						
						$(".modal2-nav-lt").empty();
						$(".modal2-nav-lt").append(value);
					}
				},
				error : function() {
					console.log("ajax 통신 실패!!");
				}
			});
		}
		
		function setchatting(){
			roomNo = roomNo;
			memberNo = memberNo;
			userNo = <%=userNo%>;
			console.log(memberNo);
			$.ajax({
	 			url:"dochatt.mt",
				data : {
					roomNo : roomNo
				},
				type : "POST",
				success : function(list) {
					/* console.log(list); */
					if(list != null){
						var value="";
						var contextPath = "<%=request.getContextPath()%>";
						for(var i=0;i<list.length;i++){
							if(userNo == memberNo){
							value += 
							"<tr>" +
							"<td style='font-weight : 600; width: 60px;'><p>" + list[i].memberName + "</p></td>" +
							"<td style='width: 450px;'><p>" + list[i].cmmmtCntnt + "</p></td>" +
							"<td style='width: 140px;'><p>" + list[i].createDate + "</p></td>" +
							"<td style='width: 50px;'><img class='deleteCmmmt' value='"+list[i].cmmmtNo+"' style='width:15px; height:15px;' src='resources/images/meetImage/close.png'></td>" +
							"</tr>"
							}else{
							value += 
								"<tr>" +
								"<td style='font-weight : 600; width: 60px;'><p>" + list[i].memberName + "</p></td>" +
								"<td style='width: 450px;'><p>" + list[i].cmmmtCntnt + "</p></td>" +
								"<td style='width: 140px;'><p>" + list[i].createDate + "</p></td>" +
								"<td style='width: 50px;'></td>" +
								"</tr>"
							}
						}
						$(".modal2-nav-textarea").val("");
						$(".modal2-nav-right-history").empty();
						$(".modal2-nav-right-history").append(value);
					}
				},
				error : function() {
					console.log("ajax 통신 실패!!");
				}
			});
		}
		
		function insertComment(){
			roomNo = roomNo;
			var userNo = <%=userNo%>;
			var comment = $(".modal2-nav-textarea").val();
			$.ajax({
	 			url:"insertComment.mt",
				data : {
					roomNo : roomNo,
					userNo : userNo,
					comment : comment
				},
				type : "POST",
				success : function(result) {
					setchatting();
				},
				error : function() {
					console.log("ajax 통신 실패!!");
				}
			});
		}
		
		$('body').on('click','.deleteCmmmt',function(){
			var cmmmtNo = $(this).attr("value");
			
			Swal.fire({
				  title: '정말 삭제 하시겠습니까?',
				  text: "",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  cancelButtonText: '취소',
				  confirmButtonText: '삭제'
				}).then((result) => {
				  if (result.value) {
					  Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '삭제성공!',
						  showConfirmButton: false,
						  timer: 1000 
						})
				   if(result.value){
						$.ajax({
				 			url:"deletecmmmt.mt",
							data : {
								cmmmtNo : cmmmtNo
							},
							type : "POST",
							success : function(result) {
								setchatting();
							},
							error : function() {
								console.log("ajax 통신 실패!!");
							}
						});
				   }
				  }
				})
		})
		
		$('body').on('click','.deleteMember',function(){
			var value = $(this).attr("value");
			var valSplit = value.split('/');
			var memberNo = valSplit[0];
			var roomNo = valSplit[1];
			
			Swal.fire({
				  title: '정말 강퇴 하시겠습니까?',
				  text: "",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  cancelButtonText: '취소',
				  confirmButtonText: '강퇴'
				}).then((result) => {
				  if (result.value) {
					  Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '강퇴성공!',
						  showConfirmButton: false,
						  timer: 1000 
						})
				   if(result.value){
					   $.ajax({
				 			url:"deleteMember.mt",
							data : {
								memberNo : memberNo,
								roomNo : roomNo
							},
							type : "POST",
							success : function(result) {
								setCommunication();
							},
							error : function() {
								console.log("ajax 통신 실패!!");
							}
						});
				   }
				  }
				})
			
			 
		})
		
		$(function () {
	        $("#picker").shieldDateTimePicker({
	            openOnFocus: false,
	            showButton: true,
	            editable: true,
	            messages: { calendarIconTooltip: "open" },
	            value: new Date(2020, 02, 26, 12, 0),
	            format: "{0:yyyy.MM.dd hh:mm:ss TT}",
	            textTemplate: "{0:yyyy-MM-dd hh:mm:ss}",
	            parseFormats: ["dd/MM/yyyy"]
	        });
	    });
		 
		
		
		function initfixmeet(){
			memberNo = memberNo;
			userNo = <%=userNo%>;
			roomNo1 = roomNo;
			var addre1 = -1;
	 		$.ajax({
	 			url:"selMeeting.mt",
				data : {
					roomNo1 : roomNo1
				},
				type : "POST",
				success : function(mt) {
					console.log(mt);
					if(mt != null){
						if(memberNo == userNo){
							// 방장일때
							$('.inputAddress').val('아직 정해진 위치가 없어요!');
							$('.sui-picker-input').val('아직 정해진 시간이 없어요!');
							$('.fixmeet-right-text').val('');
							$('.inputAddress').val(mt.meetLocation);
							$('.sui-picker-input').val(mt.meetTime);
							$('.fixmeet-right-text').val(mt.meetContent);
							addre1 = mt.meetLocation;
						}else{
							// 방장아닐때
							$('.showAddress').text('아직 정해진 위치가 없어요!');
							$('.showDateTime').text('아직 정해진 시간이 없어요!');
							$('.fixmeet-right-text2').val('');
							$('.showAddress').text(mt.meetLocation);
							$('.showDateTime').text(mt.meetTime);
							$('.fixmeet-right-text2').val(mt.meetContent);
							$('.fixmeet-right-text2').attr('readonly','readonly');
							addre1 = mt.meetLocation;
						}
					}else{
						$('.inputAddress').val('아직 정해진 위치가 없어요!');
						$('.sui-picker-input').val('아직 정해진 시간이 없어요!');
						$('.fixmeet-right-text').val('');
						$('.showAddress').text('아직 정해진 위치가 없어요!');
						$('.showDateTime').text('아직 정해진 시간이 없어요!');
						$('.fixmeet-right-text2').val('');
						$('.fixmeet-right-text2').attr('readonly','readonly');
					}
					gomap(addre1);
				},
				error:function(request,status,error){
				    /* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
				}
				
			});
			   
			document.getElementById("inputAddress").value = '';
			value = "";
			value2 = "";
			if(memberNo == userNo){
				$(".showFixmeet1").css("display","block");
				$(".showFixmeet2").css("display","none");
				$(".fixmeet-right1").css("display","block");
				$(".fixmeet-right2").css("display","none");
				$(".fixmeet-right-text").attr("readonly",false);
			}else{
				$(".showFixmeet1").css("display","none");
				$(".showFixmeet2").css("display","block");
				$(".fixmeet-right1").css("display","none");
				$(".fixmeet-right2").css("display","block");
				$(".fixmeet-right-text").attr("readonly",true);
				$(".fixmeet-right-text").css("border","none");
			}
			$(".sui-picker-input").attr("readonly",true);
			$(".fixmeet-right").empty();
			$(".fixmeet-right").append(value);
			
			
			
			/* 디비 불러와서 기본 주소 값, 년월일시 붙이기  */
		}
		
		function fixmeetSave(){
			var meetContents = $(".fixmeet-right-text").val();
			var meetLocation = $(".inputAddress").val();
			var meetTime =  $(".sui-picker-input").val();
			console.log(meetTime);
			roomNo = roomNo;
			var userNo = <%=userNo%>;
			
			Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '저장성공!',
				  showConfirmButton: false,
				  timer: 1000 
				})
					
			$.ajax({
	 			url:"fixmeetSave.mt",
				data : {
					meetContents : meetContents,
					meetLocation : meetLocation,
					meetTime : meetTime,
					roomNo : roomNo
				},
				type : "POST",
				success : function(result) {
					setchatting();
				},
				error : function() {
					console.log("ajax 통신 실패!!");
				}
			});
		} 
		
		
		 function gomap(addre1){
			    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(1, 1), // 지도의 중심좌표
			        level: 1 // 지도의 확대 레벨
			    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addre1, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		 }
		 
		    function goAddressApi(aaa) {
		    	
		    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		        mapOption = {
		            center: new daum.maps.LatLng(0, 0), // 지도의 중심좌표
		            level: 1// 지도의 확대 레벨
		        };
			    //지도를 미리 생성
			    var map = new daum.maps.Map(mapContainer, mapOption);
			    //주소-좌표 변환 객체를 생성
			    var geocoder = new daum.maps.services.Geocoder();
			    //마커를 미리 생성
			    var marker = new daum.maps.Marker({
			        position: new daum.maps.LatLng(0, 0),
			        map: map
			    });
		    	
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
						/* addr = "서울 관악구 신림동 1441-30"; */
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("inputAddress").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(addr, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {

		                        var result = results[0]; //첫번째 결과의 값을 활용

		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);	    			        
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords);
		                    }
		                });
		            }
		        }).open();
		    }
		
		// 글자수 체크
		$('.modal2-nav-textarea').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 30자)"); //글자수 실시간 카운팅

		    if (content.length > 30){
		        alert("최대 30자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 30));
		        $('#counter').html("(30 / 최대 30자)");
		    }
		});
		
		</script>

	<!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/meetMain.mt';"> &lt;&lt; </button>		
			<!-- 이전페이지(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%=contextPath%>/meetMain.mt?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button disabled> <%=p%> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath%>/meetMain.mt?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>				
			<%} %>		
			<!-- 다음페이지(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%=contextPath%>/meetMain.mt?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>		
			<!-- 맨 마지막으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/meetMain.mt?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>	
</body>
</html>