/* global gapi */

function onLoad() {
    gapi.load('auth2', function () {
        gapi.auth2.init();
    });
}

function signOutfromGoogle()
{
   
    var path;

    if (window.location.href.indexOf("Profile/") > -1 || window.location.href.indexOf("Admin/") > -1){
        path = "../";
    }
    
    else{
        path = "";
    }
   
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        
        auth2.disconnect();
        window.location.href = path+"logoutController";
    });

}


