<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	// 주소검색 팝업 호출
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do) 호출
	function goPopup() {
		var pop = window.open("view/user/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	};

	// 팝업페이지에서 주소입력 정보를 받아, 현 페이지에 정보를 등록
	function jusoCallBack(roadFullAddr) {
		document.getElementById("userAddr").value = roadFullAddr;
	};

	function id_Chk() {
		var id = $('#userid').val();
	
		if (id == '') {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}

		if (id.length<4 ||id.length>12) {
			alert("아이디를 4~12자까지 입력해주세요.");
			$('#userid').focus();
			return false;
		}

		for (i = 0; i < id.length; i++) {
			ch = id.charAt(i)
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') 	&& !(ch >= 'A' && ch <= 'Z')) {
				alert("아이디는 대소문자, 숫자만 입력가능합니다.")
				$("#userid").focus();
				return false;
			}
		}

		$.ajax({
			url : "idChk.mc",
			type : "post",
			data : {
				'userid' : id
			},
			success : function(data) {
				if (data) {
					document.userInfo.idChk.value = "Y";
					alert("사용가능한 아이디입니다.");
				} else {
					alert("중복된 아이디입니다. ");
				}
			}
		})
	};

	function join_Chk() {
		var form = document.userInfo;

		if (!form.userid.value) {
			alert("아이디를 입력하세요.");
			form.userid.focus();
			return false;
		}

		if (form.idChk.value == "N") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		if (!form.pwd.value) {
			alert("비밀번호를 입력하세요.");
			form.pwd.focus();
			return false;
		}

		if (form.pwd.value.length<4 || form.pwd.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.")
			form.pwd.focus();
			return false;
		}

		// 비밀번호와 비밀번호 확인 입력 값 동일여부 확인
		if (form.pwd.value != form.pwdchk.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			form.pwdchk.focus();
			return false;
		}

		if (!form.uname.value) {
			alert("이름을 입력하세요.");
			form.uname.focus();
			return false;
		}

		if (!form.birthdate.value) {
			alert("날짜를 입력하세요.");
			form.birthdate.focus();
			return false;
		}

		if (!form.email.value) {
			alert("메일 주소를 입력하세요.");
			form.email.focus();
			return false;
		}

		if (!form.phone.value) {
			alert("전화번호를 입력하세요.");
			form.phone.focus();
			return false;
		}

		if (isNaN(form.phone.value)) {
			alert("전화번호는 - 제외한 숫자만 입력해주세요.");
			form.phone.focus();
			return false;
		}

		if (!form.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
	};

</script>
<body>
	<h2>Register</h2>
	<div class=centermain>
		<form action="uaddimpl.mc" method="post" name="userInfo" onsubmit="return join_Chk();">
			<label for="ID">ID</label>
			<div class="div_text">
			<input type="text" name="userid" id="userid" placeholder="ID" style="margin-bottom:0.5em;"><br>
			<button class="btn" type="button" name="idChk" id=" idChk" onclick="id_Chk();" value="N">중복확인</button>
			<div id="checkMsg"></div>
			</div>
			
			<label for="PASSWORD">PASSWORD</label>
			<div class=div_text>
			<input type="password" name="pwd" placeholder="비밀번호">
			</div>
			
			<label for="PASSWORDconfirm">PASSWORD CONFIRM</label>
			<div class=div_text>
			<input type="password" name="pwdchk" placeholder="비밀번호 확인">
			</div>
			
			<label for="NAME">NAME</label>
			<div class=div_text>
			<input type="text" name="uname" placeholder="이름">
			</div>

			<label for="GENDER">GENDER</label>
			<div class=div_text>
			<input type="radio" name="gender" value="M">남성 
			<input type="radio" name="gender" value="F">여성
			</div>
			
			<label for="PHONE NUMBER">PHONE NUMBER</label>
			<div class=div_text>
			<input type="tel" name="phone" placeholder="핸드폰 번호"><br>
			</div>
			
			<label for="email">E-mail</label>
			<div class=div_text>
			<input type="email" name="email" placeholder="이메일"><br>
			</div>
			
			<label for="address">ADDRESS</label>
			<div class=div_text>
			<input type="text" name="address" placeholder="주소" id="userAddr" readonly style="margin-bottom:0.5em;"><br>
			<button class="btn" type="button" onclick="goPopup()">주소검색</button>
			</div>
			
			<label for="birthdate">BIRTH DATE</label>
			<div class=div_text>
			<input type="date" name="birthdate"><br>
			</div>
			
			<div style="margin: 5em auto;">
			<input class="btn" type="submit" value="REGISTER NOW" style="
				display: inline-block; padding: 6px 12px; margin-bottom: 0.1em;
				font-size: 14px; font-weight: normal; line-height: 1.42857143; 
				text-align: center; white-space: nowrap; vertical-align: middle;
				-ms-touch-action: manipulation; touch-action: manipulation;
				cursor: pointer; -webkit-user-select: none; -moz-user-select: none;
				-ms-user-select: none; user-select: none; background-image: none;
				background-color: #CC3D3D; border: 1px solid transparent;
				border-radius: 2px; color:white;
			"><br>
			</div>

		</form>
	</div>
</body>