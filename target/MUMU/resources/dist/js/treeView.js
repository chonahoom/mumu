
$(function(){
    $(".treeview-menu").children("li").click(function(){
        $(".treeview-menu").children("li").removeClass();
        $(this).addClass('on');
    })
})