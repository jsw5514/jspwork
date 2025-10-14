function idCheck(id,basePath) {
    const frm = document.getElementById("frm");
    frm.idBtnCheck.value = "idCheck";
    if(id ==""){
        return false;
    }
    const url = basePath+'/ch08_member/idCheck.jsp?id='+id;
    window.open(url, "IDCheck", "width=300, height=150");
}

function inputCheck(basePath) {
    const frm = document.getElementById("frm");
    if(frm.idBtnCheck.value != "idCheck"){
        alert('id 중복체크를 해주세요.');
        return;
    }
    if(frm.pwd.value == ""){
        alert('비밀번호를 입력해주세요.');
        frm.repwd.focus();
        return;
    }
    if (frm.pwd.value != frm.repwd.value){
        alert("비밀번호가 확인과 다릅니다.")
        frm.repwd.focus();
        return;
    }
    if(frm.name.value == ""){
        alert("이름을 입력하세요")
        frm.name.focus();
        frm.submit();
    }
}