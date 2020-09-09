var coll = document.getElementsByClassName("collapsible");
var i;
    
for (i = 0; i < coll.length; i++) {
	if (coll[i].classList.contains("active")){
		coll[i].innerHTML = "-"
	} else {
		coll[i].innerHTML = "+"
	}
	
	coll[i].addEventListener("click", function() {
	this.classList.toggle("active");
	var is_active = this.classList.contains("active")
	if (is_active){
		this.innerHTML = "-";
	} else {
		this.innerHTML = "+";
	}
	
	var parent = this.parentElement;
	var content = parent.getElementsByTagName("UL")[0];
	if (is_active) {
		content.style.display = "block";
	} else {
		content.style.display = "none";
	}
	});
}