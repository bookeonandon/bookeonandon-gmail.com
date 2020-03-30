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
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div style="clear:both;"></div>
	<div class="meetContent">
		<!-- 미팅방  -->
		<% if(list.isEmpty()){ %>	
					<p>조회된 리스트가 없습니다.</p>
				<% }else{ %>
					<% for(Meet m : list){ %>
		<div class="meetRoom" data-toggle="modal" data-target="#exampleModal">
		<div class="roomNo" style="display:none"><%=m.getRoomNo() %></div>
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
				<div class="modal-DivImg2"></div>
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
						<div><p style="font-size: 17px; margin: 7px;">한줄글</p></div>
						<div><textarea class ="modal2-nav-textarea" cols="50" rows="10"></textarea></div>
						<div><button id="btn_comment">등록</button></div>
						</div>
					</div>
				</div>

				<!--modalCommunity  -->
		    <div id="fixmeet" style="display:none;">
				fixmeet
		    </div>
		    
		    <!--modalCommunity  -->
		    <div id="setting" style="display:none;">
				setting
		    </div>
		   </div>
		  </div>
		</div>
	
		<script>
			var roomNo;
			
		$(function(){
			$(".meetRoom").click(function(){
				
				roomNo = $(this).children().eq(0).text();
				var roomTitle = $(this).children().eq(1).text();
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
				var roomContent = $(this).children().eq(4).text();
				var src = jQuery('#bookImg').attr("src");
				
				<%-- <img id="bookImg" style="width: 90px; height: 139px;" src="<%=request.getContextPath()+"/resources/images/meetImage/"+m.getBookImg() %>"> --%>
				/* console.log(roomNo);
				console.log(roomTitle);
				console.log(ctgy0);
				console.log(ctgy1);
				console.log(ctgy2);
				console.log(roomMembers);
				console.log(roomContent);
				console.log(src); */
				
				document.getElementById("modal-title").innerHTML=roomTitle;
				document.getElementById("modal-Pcon").innerHTML=roomContent;
				document.getElementById("modal-Members").innerHTML=roomMembers; 
				<%-- location.href="<%=contextPath%>/modal.me?mId=" + mId; --%>
				
				goModal(roomNo);
			});
		});
				
		function goModal(roomNo){
					var userNo = <%=userNo%>;
					console.log(userNo);
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
					console.log("ajax 통신 성공!!");
					
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
 				/* setchatting(); */
			}
			if(val == "fixmeet"){
				$('#modalMain').css("display", "none");
 				$('#modalCommunity').css("display", "none");
 				$('#fixmeet').css("display", "block");
 				$('#setting').css("display", "none");
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
			<%-- var userNo = <%=userNo%>; --%>
			
	 		roomNo = roomNo;
			$.ajax({
	 			url:"doCommu.mt",
				data : {
					/* userNo : userNo, */
					roomNo : roomNo
				},
				type : "POST",
				success : function(list) {
					/* console.log(list); */
					if(list != null){
						var value="";
						var contextPath = "<%=request.getContextPath()%>";
						for(var i=0;i<list.length;i++){
							value += "<tr>" +
							"<td>" +
							"<img style='width:40px; height:40px; border-radius:20px; margin: 10px; margin-left:30px;' src='"+ contextPath + list[i].memberPic +"'>" + 
							"<p class='modal2-nav-lt-p'>" + list[i].memName + "</p>" +
							"</td>" +
							"</tr>"
						}
						$(".modal2-nav-lt").empty();
						$(".modal2-nav-lt").append(value);
					}
					console.log("ajax 통신 성공!!");
				},
				error : function() {
					console.log("ajax 통신 실패!!");
				}
			});
		}
		
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