<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>memberJoinForm</title>
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>Insert title here</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
</head>
<body>
	  <div class="header joinheader">

        <div class="joinlogo"><img src="" alt="">BOOK E ON & ON</div>
        <div class="joindiv">이용약관</div>
      </div>
      <div class="col p-md-0 joinlist">
        <ul class="pagination pagination-sm">
            <li class="page-item"><a class="joinpagelink" href="#">●</a>
            </li>
            <li class="page-item"><a class="joinpagelink joinpage" href="#">●</a>
            </li>
            <li class="page-item"><a class="joinpagelink joinpage" href="#">●</a>
            </li>
        </ul>
       </div>
      

       <div class="content-body joinbody">
         <div class="container-fluid">
             <div class="row">
                 <div class="col">
                     <div class="card cardsize">
                         <label class="css-control css-control-primary css-checkbox joincheck" for="join-terms">
                             <input type="checkbox" class="css-control-input" id="join-terms" name="join-terms" value="1">&nbsp&nbsp 이용약관 동의</label>
                         <div class="card-body termssize">
                             <p> 
				                                 제1장 총 칙 <br>
				                                 제1조 [목 적]<br>
				                                 본 약관은 리디 주식회사(이하 “회사”라 합니다)가 운영하는 리디북스(www.ridibooks.com)를 통하여 제공하는 상품 및 디지털콘텐츠 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 이용자의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
				                                 <br>
				                                 제2조 [정 의]
     
                             </p>
                             <p class="text-primary loginlink" data-toggle="modal" data-target="#useAgree">>> 더보기</p>
                             <div class="modal fade" id="useAgree">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">이용약관 동의</h5>
                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p> 
										                                 제1장 총 칙<br><br>
															제1조 [목 적]<br>
															본 약관은 리디 주식회사(이하 “회사”라 합니다)가 운영하는 리디북스(www.ridibooks.com)를 통하여 제공하는 상품 및 디지털콘텐츠 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 이용자의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
															<br><br>
															제2조 [정 의]<br>
															본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
															<br><br>
															“리디북스”란 회사가 디지털콘텐츠를 이용자에게 제공하기 위하여 운영하는, 정보통신설비(인터넷, 전화 등)를 이용하여 디지털콘텐츠를 거래할 수 있도록 설정한 가상의 전자상거래 웹사이트를 말합니다.<br>
															“이용자”란 회사의 웹사이트에 접속하여 본 약관에 따라 회사가 제공하는 콘텐츠 및 제반 서비스를 이용하는 회원 및 비회원을 말합니다.<br>
															“회원”이란 본 약관에 동의하고 개인정보를 제공하여 회원 등록을 한 자로서, 회사가 제공하는 정보와 서비스를 지속적으로 이용할 수 있는 자를 말합니다.<br>
															“비회원”이란 회원 등록을 하지 않고 회사가 제공하는 정보와 서비스를 이용하는 자를 말합니다.<br>
															“콘텐츠”라 함은 회사가 제공하는 전자책, 이용권 등 디지털 콘텐츠 및 기타 관련 정보를 의미하며, 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호, 문자, 음성, 음향, 이미지, 영상 등으로 표현된 자료 또는 정보를 말합니다.<br>
															"전자책 선물 서비스"라 함은 회사가 운영하는 리디북스 서점(www.ridibooks.com) 또는 제휴하는 유선인터넷 또는 무선인터넷을 통해 리디북스 전자책을 선물할 수 있는 서비스를 말합니다.<br>
															"수신자"라 함은 전자책 선물 서비스를 회원으로부터 전송 받은 자를 말합니다.<br>
															"사이버머니"라 함은 전자책을 구매할 수 있는 수단이며, 아래와 같이 구분될 수 있습니다.<br>
															리디캐시 : 전자책을 구매할 수 있는 결제수단<br>
															리디포인트 : 리디캐시 충전 및 이벤트 등의 사유로 무상 제공 받을 수 있으며, 전자책을 구매할 때 현금처럼 사용할 수 있는 수단<br>
															전항 각호에 해당하는 정의 이외의, 기타 용어의 정의에 대하여는 거래 관행 및 관계 법령에 따릅니다.<br><br>
															제3조 [약관의 명시 및 개정]<br>
															회사는 이용자가 별도의 연결화면을 통하여 본 약관의 내용과 상호, 영업소 소재지, 대표자 성명, 사업자 등록번호, 연락처 등을 확인할 수 있도록 리디북스 웹사이트 첫 화면에 게시합니다.<br>
															회사는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률 등 관계 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.<br>
															회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여, 개정 전 약관과 함께 적용일자 7일 전부터 웹사이트에서 확인할 수 있도록 게시하며, 기존 회원에게는 본 약관 제5조의 방법을 통하여 약관 개정사실을 통지합니다. <br>다만, 회원의 권리 또는 의무에 관한 중요한 규정의 변경은 최소한 30일전에 공지하고 개정약관을 회원이 등록한 이메일로 발송하여 통지합니다.<br>
															회사가 개정약관을 공지 또는 통지한 후에 회원이 30일 기간 내에 명시적으로 거부의 의사 표시를 하지 않으면 약관의 개정사항에 대해 동의한 것으로 간주하며, 변경된 약관에 대한 정보를 알지 못하여 발생하는 이용자의 피해에 대해 회사는 책임을 지지 않습니다.<br>
															개정된 약관에 동의하지 않는 회원은 회원 탈퇴를 요청할 수 있습니다.<br>
															본 약관에서 명시하지 않은 사항과 본 약관의 해석에 관하여는 정부가 제정한 소비자보호지침, 전자거래소비자보호지침 및 관계법령, 또는 상관례에 따릅니다.<br><br>
															제4조 [약관의 효력]<br>
															본 약관은 이용자가 회원가입 시 약관의 내용에 동의하고, 회사가 그 회원가입 신청에 대하여 승낙함으로써 효력이 발생합니다.<br>
															회사는 기존 회원이 본 약관 제5조에 따른 공지 또는 통지에도 불구하고, 동 기간 내에 이의를 제기하지 않는 경우에는 변경된 약관을 승인한 것으로 봅니다.<br><br>
															제5조 [회원에 대한 통지]<br>
															회사는 회원에게 알려야 할 사항이 발생하는 경우, 회원가입 시 회원이 공개한 전자우편주소, 팝업, 알림 (웹/애플리케이션), 푸시알림, 전화 등의 방법으로 통지할 수 있습니다. 회원이 통지를 받을 전자우편 주소를 지정한 때에는 회사의 통지는 부가통신사업자 또는 수신인이 관리하는 메일서버 등에 도착하여 회원이 검색할 수 있는 상태에 이르렀을 때 도달된 것으로 보며, 회원이 전자우편을 개봉하였는지 여부, 회원의 PC에 전자우편이 전송되었는지 여부는 불문합니다.<br><br>
															회사는 회원 전체에 대한 통지의 경우 7일 이상 회사 웹사이트 게시판에 게시함으로써 전항의 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 전항과 동일한 방법으로 별도 통지할 수 있습니다.<br><br>
															제6조 [서비스의 제공 및 변경]<br>
															회사는 다음과 같은 업무를 수행합니다.<br>
															재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
															구매계약이 체결된 재화 또는 용역의 제공 및 배송<br>
															광고 또는 이벤트 등 재화 또는 용역과 관련된 판촉 행위<br>
															기타 이용자에게 유용한 정보 제공<br>
															회사는 재화의 품절 또는 기술적 사양의 변경 등의 불가피한 경우에는 장차 체결되는 계약에 의해 제공할 재화와 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 등의 내용 및 제공일자를 명시하여 현재의 재화 등의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다. 단, 회사가 합리적으로 예측할 수 없는 불가피한 여건이나 사정이 있는 경우, 위 공지를 하지 않을 수 있습니다.<br>
															회사가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 회사는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, 회사에 고의 또는 과실이 없는 경우에는 그 책임을 지지 않습니다.<br>
															회사는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 회원에게 별도의 보상을 하지 않습니다.<br><br>
															제7조 [서비스의 중단]<br>
															회사와 계약한 출판사와의 계약 종료 및 변경 등의 사유로 서비스의 내용이 변경되거나, 서비스가 중단될 수 있습니다.<br>
															회사는 정보통신 설비의 보수점검 교체 및 고장, 통신의 두절, 천재지변 등의 불가항력적 사유가 발생한 경우에는 서비스의 전부 또는 일부를 제한하거나 일시 중단할 수 있습니다.<br>
															서비스가 일시적으로 중단되는 경우 회사는 제5조에 정한 방법으로 이용자에게 통지합니다. 다만, 미리 통지하는 것이 곤란하거나 급박하거나 불가피한 사정이 있는 경우에는 사후에 통지할 수 있습니다<br>
															회사는 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, 회사에 고의 또는 과실이 없는 경우는 책임을 지지 않습니다.<br>
															회사의 귀책사유로 인하여 회원이 자유이용권(정액제) 서비스 이용기간 동안 서비스를 제공받을 수 없게 되는 경우, 회사는 회원이 그 기간만큼 이용할 수 있는 동일, 유사한 컨텐츠를 다시 제공합니다.<br>
															사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 회사는 제5조에 정한 방법으로 이용자에게 통지하고, 해당 시점에 통지된 내용에 따라 이용자에게 손해가 최소화되도록 조치합니다. 다만, 회사가 통제할 수 없는 사유로 인한 서비스의 중단(운영자의 고의나 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 사후에 통지할 수 있습니다.<br>
															회사는 1개월 내 서비스 중지 및 장애 발생 누적시간이 72시간을 초과한 경우 미이용 기간을 포함, 잔여기간에 대한 이용료를 회원에게 환불합니다.<br>
																					     
						                             </p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                         </div>
                     </div>
                 </div>
                 <div class="col">
                     <div class="card cardsize">
                         <label class="css-control css-control-primary css-checkbox joincheck" for="join-terms2">
                             <input type="checkbox" class="css-control-input" id="join-terms2" name="join-terms" value="2">&nbsp&nbsp개인정보 처리 방침 동의</label>
                         <div class="card-body termssize">
                             <p>
                                 1. 수집하는 개인정보 항목 및 수집방법 <br>
					                                 가. 수집하는 개인정보 항목<br>
					                                 첫째, 회사는 회원가입 및 로그인, 원활한 고객상담, 각종 최적화된 서비스를 제공하기 위하여, 다음과 같은 최소한의 개인정보를 이용자의 회원가입 시 수집하고 있습니다.
					                                 <br>
					                                 일반/외국인/14세미만 어린이 회원가입 시<br>
					                                 필수 입력 사항: 이름, 아이디, 비밀번호, 이메일주소, 법정대리인의 본인인증값
                                </p>
                                <p class="text-primary loginlink" data-toggle="modal" data-target="#privacyAgree">>> 더보기</p>
                                <div class="modal fade" id="privacyAgree">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">개인정보 처리 방침 동의</h5>
                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>
                                                    	리디 주식회사(이하 "회사”라 함)는 고객님들의 개인정보를 소중히 다루고 있습니다. 회사는 ‘정보통신망이용촉진 및 정보 보호 등에 관한 법률’ 등 모든 관련 법규를 준수하며 회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다. 개인정보 보호정책을 통해 이용자가 제공한 개인정보가 어떠한 용도와 방식으로 이용되며, 개인정보 보호를 위해 어떠한 방법을 통해 관리되고 있는지에 대해 알려드립니다.
														<br><br>
														1. 수집하는 개인정보 항목 및 수집방법<br>
														가. 수집하는 개인정보 항목<br>
														첫째, 회사는 회원가입 및 로그인, 원활한 고객상담, 각종 최적화된 서비스를 제공하기 위하여, 다음과 같은 최소한의 개인정보를 이용자의 회원가입 시 수집하고 있습니다.
														<br><br>
														일반/외국인/14세미만 어린이 회원가입 시<br>
														필수 입력 사항: 이름, 아이디, 비밀번호, 이메일주소, 법정대리인의 본인인증값<br>
														선택 입력 사항: 생년, 성별<br>
														소셜 네트워크 계정으로 회원가입 시 : 이름, 이메일주소, 생년, 성별<br>
														둘째, 모바일 서비스 이용시 단말기에 관한 정보(단말기 모델, 하드웨어 ID, 운영체제 버전정보)와 서비스 이용 기본 통계(동기화, 독서노트 기능 제공을 위한 서점 및 애플리케이션 이용 정보, 서점 내 회원 대상 또는 개인화된 맞춤 추천 기능을 위한 서점 및 애플리케이션 이용 정보)이 수집될 수 있으나, 이는 개인을 식별할 수 없는 형태입니다. 만약 서비스 이용 도중 추가적으로 개인정보 수집이 필요한 경우, 회사는 회원에게 미리 이러한 사실을 고지하고 동의를 받습니다.
														<br><br>
														셋째, 회사는 이용자의 페이퍼샵 주문 혹은 AS시 재화의 배송 및 원활한 고객상담을 위하여 다음과 같은 기본 정보를 수집하고 있습니다.
														<br><br>
														이름, 주소, 유선전화번호, 휴대전화번호, 이메일주소<br>
														넷째, 회사는 이용자의 선물하기 기능 이용시 선물 전송을 위하여 필요한 선물 수령인의 기본 정보를 수집하고 있습니다.<br>
														<br><br>
														선물 수령인의 이름, 휴대전화번호, 이메일 주소<br>
														다섯째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
														<br><br>
														IP 주소, 쿠키, 방문 일시, OS종류, 브라우저 종류, 결제기록, 서비스 이용 기록, 불량이용 기록<br>
														여섯째, 유료 서비스 이용 과정에서 아래와 같은 정보가 개인정보 수탁자(결제대행사)에 의해 수집될 수 있으나, 회사는 결제 정보를 보관하지 않습니다.
														<br><br>
														신용카드 결제시 : 카드사명, 카드번호 등<br>
														휴대전화 결제시 : 휴대폰번호, 통신사, 결제승인번호 등<br>
														계좌이체시 : 은행명, 계좌번호 등<br>
														상품권 이용시 : 상품권 번호<br>
														나. 개인정보 수집방법<br>
														회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br>
														<br>
														홈페이지, 모바일 애플리케이션, 서면 양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모<br><br>
														2. 개인정보 이용목적<br>
														가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>
														제화 및 컨텐츠의 제공, 맞춤 서비스 제공, 청구서 및 구매내역 발송, 컨텐츠 선물하기, 기기 간 동기화 서비스 제공, 본인인증, 구매 및 요금 결제, 요금추심 등
														<br><br>
														나. 회원관리<br>
														본인확인, 불량회원(리디북스 이용약관 제16조 위반 사유로 인하여 영구이용이 정지된 회원)의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 분쟁 조정을 위한 기록 보존, 민원처리, 공지사항 전달
														<br><br>
														다. 신규 서비스 개발 및 마케팅에의 활용<br>
														신규 서비스 개발, 통계학적 특성, 이용 형태 등에 따른 맞춤형 서비스 제공, 광고 게재, 이벤트 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계
                                                    </p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                               
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                         </div>
                     </div>
                 </div>
             
             </div>
             <div class="row">
                 <div class="col">
                     <div class="card cardsize">
                         <label class="css-control css-control-primary css-checkbox joincheck" for="join-terms3">
                             <input type="checkbox" class="css-control-input" id="join-terms3" name="join-terms" value="3">&nbsp&nbsp개인 정보 제3자 제공 및 위탁 동의</label>
                         <div class="card-body">
                             <p>개인 정보 제3자 제공 및 위탁 동의<br>
				                                 리디 주식회사(이하 "회사”라 함)는 고객님들의 개인정보를 소중히 다루고 있습니다. 회사는 ‘정보통신망이용촉진 및 정보 보호 등에 관한 법률’ 등 
				                                 모든 관련 법규를 준수하며 회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다. 개인정보 보호정책을 통해 이용자가 제공한 개인정보가 
				                                 어떠한 용도와 방식으로 이용되며, 개인정보 보호를 위해 어떠한 방법을 통해 관리되고 있는지에 대해 알려드립니다.
                            
                             </p>  
                             <p class="text-primary loginlink" data-toggle="modal" data-target="#privacyProcess">>> 더보기</p> 
                             <div class="modal fade" id="privacyProcess">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">개인 정보 제3자 제공 및 위탁 동의</h5>
                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>
														리디 주식회사(이하 "회사”라 함)는 고객님들의 개인정보를 소중히 다루고 있습니다. 회사는 ‘정보통신망이용촉진 및 정보 보호 등에 관한 법률’ 등 모든 관련 법규를 준수하며 회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다. 개인정보 보호정책을 통해 이용자가 제공한 개인정보가 어떠한 용도와 방식으로 이용되며, 개인정보 보호를 위해 어떠한 방법을 통해 관리되고 있는지에 대해 알려드립니다.
														<br><br>
														1. 수집하는 개인정보 항목 및 수집방법<br>
														가. 수집하는 개인정보 항목<br>
														첫째, 회사는 회원가입 및 로그인, 원활한 고객상담, 각종 최적화된 서비스를 제공하기 위하여, 다음과 같은 최소한의 개인정보를 이용자의 회원가입 시 수집하고 있습니다.
														<br><br>
														일반/외국인/14세미만 어린이 회원가입 시<br>
														필수 입력 사항: 이름, 아이디, 비밀번호, 이메일주소, 법정대리인의 본인인증값<br>
														선택 입력 사항: 생년, 성별<br>
														소셜 네트워크 계정으로 회원가입 시 : 이름, 이메일주소, 생년, 성별<br>
														둘째, 모바일 서비스 이용시 단말기에 관한 정보(단말기 모델, 하드웨어 ID, 운영체제 버전정보)와 서비스 이용 기본 통계(동기화, 독서노트 기능 제공을 위한 서점 및 애플리케이션 이용 정보, 서점 내 회원 대상 또는 개인화된 맞춤 추천 기능을 위한 서점 및 애플리케이션 이용 정보)이 수집될 수 있으나, 이는 개인을 식별할 수 없는 형태입니다. 만약 서비스 이용 도중 추가적으로 개인정보 수집이 필요한 경우, 회사는 회원에게 미리 이러한 사실을 고지하고 동의를 받습니다.
														<br><br>
														셋째, 회사는 이용자의 페이퍼샵 주문 혹은 AS시 재화의 배송 및 원활한 고객상담을 위하여 다음과 같은 기본 정보를 수집하고 있습니다.
														<br><br>
														이름, 주소, 유선전화번호, 휴대전화번호, 이메일주소<br>
														넷째, 회사는 이용자의 선물하기 기능 이용시 선물 전송을 위하여 필요한 선물 수령인의 기본 정보를 수집하고 있습니다.<br><br>
														
														선물 수령인의 이름, 휴대전화번호, 이메일 주소<br>
														다섯째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br><br>
														
														IP 주소, 쿠키, 방문 일시, OS종류, 브라우저 종류, 결제기록, 서비스 이용 기록, 불량이용 기록<br>
														여섯째, 유료 서비스 이용 과정에서 아래와 같은 정보가 개인정보 수탁자(결제대행사)에 의해 수집될 수 있으나, 회사는 결제 정보를 보관하지 않습니다.<br>
														<br>
														신용카드 결제시 : 카드사명, 카드번호 등<br>
														휴대전화 결제시 : 휴대폰번호, 통신사, 결제승인번호 등<br>
														계좌이체시 : 은행명, 계좌번호 등<br>
														상품권 이용시 : 상품권 번호<br>
														나. 개인정보 수집방법<br>
														회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br><br>
														
														홈페이지, 모바일 애플리케이션, 서면 양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모<br>
														2. 개인정보 이용목적<br>
														가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>
														제화 및 컨텐츠의 제공, 맞춤 서비스 제공, 청구서 및 구매내역 발송, 컨텐츠 선물하기, 기기 간 동기화 서비스 제공, 본인인증, 구매 및 요금 결제, 요금추심 등
														<br><br>
														나. 회원관리<br>
														본인확인, 불량회원(리디북스 이용약관 제16조 위반 사유로 인하여 영구이용이 정지된 회원)의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 분쟁 조정을 위한 기록 보존, 민원처리, 공지사항 전달
														<br><br>
														다. 신규 서비스 개발 및 마케팅에의 활용<br>
														신규 서비스 개발, 통계학적 특성, 이용 형태 등에 따른 맞춤형 서비스 제공, 광고 게재, 이벤트 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계
														<br><br>
														3. 개인정보 수집에 대한 동의<br>
														첫째, 회사는 고객님께서 개인정보 보호정책 또는 이용약관의 내용에 대해 ‘동의함’ 버튼을 통해 동의 여부를 선택할 수 있는 절차를 마련하여, ‘동의함’ 버튼을 선택할 경우 입력하신 개인정보가 당사의 고객DB에 저장되어 상기 명시된 이용목적에 적합하게 이용되는 것으로 간주합니다.
														<br><br>
														둘째, 제휴사 등 제3자를 통해 개인정보 수집에 대한 동의를 받을 경우에도, 고객님께서 개인정보 보호정책 또는 이용약관의 내용에 대해 ‘동의함’ 버튼을 통해 동의 여부를 선택할 수 있는 절차를 마련하여, ‘동의함’ 버튼을 선택할 경우 동의하신 것과 동일하게 간주합니다.
                                                    </p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                         </div>
                     </div>
                 </div>
                 <div class="col">
                     <div class="card cardsize">
                         <label class="css-control css-control-primary css-checkbox joincheck" for="join-terms4">
                             <input type="checkbox" class="css-control-input" id="join-terms4" name="join-terms" value="4">&nbsp&nbsp이벤트 혜택 개인정보 동의 (선택)</label>
                     </div>
                 </div>
             
             </div>
             <div>
                 <label class="css-control css-control-primary css-checkbox text-primary joincheckall" for="checkall">
                     <input type="checkbox" class="css-control-input" id="checkall" name="checkall" value="all">&nbsp&nbsp전체동의하기</label>
             </div>
			
             <div class="joinbtn">
                 <button type="button" onclick="history.back();" class="btn btn-light">이전</button>
                 <button type="submit" onclick="enroll();" class="btn btn-primary">다음</button>
             </div>
         </div>
      
        </div>
        <script>
        function enroll(){
        	location.href="<%=request.getContextPath()%>/enrollForm.me";
        }
        
        function allCheckFunc( obj ) {
    		$("[name=join-terms]").prop("checked", $(obj).prop("checked") );
	    }
	
	    /* 체크박스 체크시 전체선택 체크 여부 */
	    function oneCheckFunc( obj )
	    {
	    	var allObj = $("[name=checkall]");
	    	var objName = $(obj).attr("name");
	
	    	if( $(obj).prop("checked") )
	    	{
	    		checkBoxLength = $("[name="+ objName +"]").length;
	    		checkedLength = $("[name="+ objName +"]:checked").length;
	
	    		if( checkBoxLength == checkedLength ) {
	    			allObj.prop("checked", true);
	    		} else {
	    			allObj.prop("checked", false);
	    		}
	    	}
	    	else
	    	{
	    		allObj.prop("checked", false);
	    	}
	    }
	
	    $(function(){
	    	$("[name=checkall]").click(function(){
	    		allCheckFunc( this );
	    	});
	    	$("[name=join-terms]").each(function(){
	    		$(this).click(function(){
	    			oneCheckFunc( $(this) );
	    		});
	    	});
	    });
        </script>
        
</body>
</html>