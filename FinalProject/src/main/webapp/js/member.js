/* 로그인 체크 */
function login_check(){
    if($.trim($('#mid').val()) == ''){
        alert('아이디를 입력해주세요');
        $('#mid').val('').focus();
        return false;
    }

    if($.trim($('#mpwd').val()) == ''){
        alert('비밀번호를 입력해주세요');
        $('#mpwd').val('').focus();
        return false;
    }
}

/* 회원가입 체크 */
function joinCheck() {
    if($.trim($('#mid').val()) == ''){
        alert('아이디를 입력해주세요');
        $('#mid').val('').focus();
        return false;
    }

    if($.trim($('#mpwd').val()) == ''){
        alert('비밀번호를 입력해주세요');
        $('#mpwd').val('').focus();
        return false;
    }

    if($.trim($('#mpwdC').val()) == ''){
        alert('비밀번호 확인를 입력해주세요');
        $('#mpwdC').val('').focus();
        return false;
    }

    if($.trim($('#mpwd').val()) != ($.trim($('#mpwdC').val()))){
        alert("비밀번호가 다릅니다");
        $('#mpwd').val('').focus();
        $('#mpwdC').val('');
        return false;
    }

    if($.trim($('#mname').val()) == ''){
        alert('이름을 입력해주세요');
        $('#mname').val('').focus();
        return false;
    }

    if($.trim($('#mday').val()) == ''){
        alert('생년월일을 입력해주세요');
        $('#mday').val('').focus();
        return false;
    }

    if($.trim($('#mphone').val()) == ''){
        alert('전화번호를 입력해주세요');
        $('#mphone').val('').focus();
        return false;
    }
}

/* 정보 수정 */
function member_edit(){
    $url="memberedit";
    open($url, "정보 수정", "width=600,height=800");
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } else {
                extraAddr = '';
            }

            document.getElementById('addrcode').value = data.zonecode;
            document.getElementById('myaddr').value = addr;
            document.getElementById('myaddr2').focus();
        }
    }).open();
}