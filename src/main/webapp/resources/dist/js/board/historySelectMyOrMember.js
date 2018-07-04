function gotoMyhistoryOrMemberHistory(writer, loginUser, page) {
    var pageNumber = page;
    var makePage = "?page="+pageNumber+"&perPageNum=15";
    if(writer === loginUser){
        location.href = "/board/sheet-historys";
    }else {
        var memberSheetViewPath = "/board/member-sheet-view"+ makePage + "&memberName=";
        sheetClick(memberSheetViewPath, writer);
    }
}