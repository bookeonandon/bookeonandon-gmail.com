<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.faq.model.vo.Faq" %>
<%
	ArrayList<Faq> flist1 = (ArrayList<Faq>)request.getAttribute("flist1");
	ArrayList<Faq> flist2 = (ArrayList<Faq>)request.getAttribute("flist2");
	ArrayList<Faq> flist3 = (ArrayList<Faq>)request.getAttribute("flist3");
	ArrayList<Faq> flist4 = (ArrayList<Faq>)request.getAttribute("flist4");

%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>faqView</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="bodycolor">
	
		<%@ include file="../common/menubar.jsp" %>

 <div class="faqul">
                <ul class="nav text-center">
                    <li class="nav-item faqnav marginleft"><a href="#Frequently" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">자주 묻는 질문</a>
                    </li>
                    <li class="nav-item faqnav marginright"><a href="#serviceuse" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">서비스 이용</a>
                    </li>
                    <li class="nav-item faqnav marginleft"><a href="#meeton" class="nav-link fontcolor " data-toggle="tab" aria-expanded="false">MEET&ON</a>
                    </li>
                    <li class="nav-item faqnav marginright"><a href="#payrefund" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">결제/환불</a>
                    </li>
                    
                </ul>
               

                <div class="tab-content col-md-12">
                    <div id="Frequently" class="tab-pane">
                        <div id="accordion-three">
                        <%for(int i=0; i<flist1.size(); i++){ %>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0" data-toggle="collapse" data-target="#freList<%=(i+1) %>" aria-expanded="false" aria-controls="freList<%=(i+1) %>">
                                    <i class="fa" aria-hidden="true"></i><%=flist1.get(i).getFaqTitle() %></h5>
                                </div>
                                <div id="freList<%=(i+1) %>" class="collapse" data-parent="#accordion-three">
                                    <div class="card-body">
                                       <%=flist1.get(i).getFaqContent() %>
                                    </div>
                                </div>
                            </div>
                            
                            <hr>
                         <%} %>  
                        </div>
                        <div class="imgcenter">
                            <img src="<%=request.getContextPath() %>/resources/images/down.png">
                        </div>
                    </div>
                    
                    <div id="serviceuse" class="tab-pane">
                        <div id="accordion-three">
                        <%for(int i=0; i<flist2.size(); i++){ %>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0" data-toggle="collapse" data-target="#serList<%=(i+1) %>" aria-expanded="false" aria-controls="serList<%=(i+1) %>">
                                    <i class="fa" aria-hidden="true"></i><%=flist2.get(i).getFaqTitle() %></h5>
                                </div>
                                <div id="serList<%=(i+1) %>" class="collapse" data-parent="#accordion-three">
                                    <div class="card-body">
						               <%=flist2.get(i).getFaqContent() %>
                                    </div>
                                </div>
                            </div>
                            <hr>
                        <%} %> 
                        </div> 
                        <div class="imgcenter">
                           <img src="<%=request.getContextPath() %>/resources/images/down.png">
                        </div>   
                    </div>
                    <div id="meeton" class="tab-pane">
                        <div id="accordion-three">
                        <%for(int i=0; i<flist3.size(); i++){ %>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0" data-toggle="collapse" data-target="#meetList<%=(i+1) %>" aria-expanded="false" aria-controls="meetList<%=(i+1) %>">
                                    <i class="fa" aria-hidden="true"></i><%=flist3.get(i).getFaqTitle() %></h5>
                                </div>
                                <div id="meetList<%=(i+1) %>" class="collapse" data-parent="#accordion-three">
                                    <div class="card-body">
                                        <%=flist3.get(i).getFaqContent() %>
                                    </div>
                                </div>
                            </div>
                            <hr>
                           <%} %>    
                            
                        </div>    
                        <div class="imgcenter">
                          <img src="<%=request.getContextPath() %>/resources/images/down.png">
                        </div>
                    </div>
                    <div id="payrefund" class="tab-pane">
                        <div id="accordion-three">
                         <%for(int i=0; i<flist4.size(); i++){ %>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0" data-toggle="collapse" data-target="#payList<%=(i+1) %>" aria-expanded="false" aria-controls="payList<%=(i+1) %>">
                                    <i class="fa" aria-hidden="true"></i><%=flist4.get(i).getFaqTitle() %></h5>
                                </div>
                                <div id="payList<%=(i+1) %>" class="collapse" data-parent="#accordion-three">
                                    <div class="card-body">
                                        <%=flist4.get(i).getFaqContent() %>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <%} %>    
                        </div> 
                        <div class="imgcenter">
                            <img src="<%=request.getContextPath() %>/resources/images/down.png">
                        </div>   
                    </div>
                </div>       
                
            </div>
             <script type="text/javascript">
				     $(document).ready(function(){
				        var i=0;
				        var color=["#5c186b","#242424"];
				        var fontweight=["bold","normal"];
				        $("h5").click(function(){
				            $(this).css("color",color[i]);
				            $(this).css("font-weight",fontweight[i]);
				            i++;
				            if(i==2){i=0};s
				    });
				});
    		</script>

</body>
</html>