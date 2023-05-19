// nav 메뉴에 빤짝이

window.addEventListener('DOMContentLoaded', function(){
	
	var url = window.location.href;

 if (url.includes("share")) {
    var shareEffectLi = document.getElementById("shareEffect");
    shareEffectLi.style.backgroundImage = "url('images/highlight.png')";
    shareEffectLi.style.backgroundSize = "160px 68px";
    shareEffectLi.style.backgroundRepeat = "no-repeat";
    shareEffectLi.style.backgroundPosition = "center";
	
}
 if (url.includes("recruitment")) {
    var shareEffectLi = document.getElementById("recruitEffect");
    shareEffectLi.style.backgroundImage = "url('images/highlight.png')";
    shareEffectLi.style.backgroundSize = "160px 68px";
    shareEffectLi.style.backgroundRepeat = "no-repeat";
    shareEffectLi.style.backgroundPosition = "center";
	
}
 if (url.includes("vote")) {
    var shareEffectLi = document.getElementById("voteEffect");
    shareEffectLi.style.backgroundImage = "url('images/highlight.png')";
    shareEffectLi.style.backgroundSize = "160px 68px";
    shareEffectLi.style.backgroundRepeat = "no-repeat";
    shareEffectLi.style.backgroundPosition = "center";
	
}

});

