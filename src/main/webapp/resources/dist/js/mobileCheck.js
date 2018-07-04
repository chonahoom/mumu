var filter = "win16|win32|win64|mac|macintel";
if ( navigator.platform ) {
    if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 )
    { //mobile
        setTimeout(function() { swal("PC", "Please access to MUMU throught PC", "error")}, 1);
        setTimeout(function() {goGoogle()}, 5000);
    }
}
function goGoogle(){
    document.location="https://www.google.com/"
}