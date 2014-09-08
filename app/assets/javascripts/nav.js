/**
 * Created by ddlarosa on 28/08/14.
 */

$(function() {
    setNavigation();
})

function setNavigation(){
    var path = window.location.pathname;

    path = path.replace(/\/$/,"");
    path = decodeURIComponent(path);

    $(".nav.nav-pills a").each(function() {
        var href = $(this).attr('href');

        if(path.substring(0,href.length) === href){
            $(this).closest('li').addClass('active');
        }
    });

}
