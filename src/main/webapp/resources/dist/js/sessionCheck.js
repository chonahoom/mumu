window.onload = function(){
    if("${sessionScope.userLoginInfo.name}" === '')
        location.href="/user/login";
}