function onMessageHandler(response){
	console.log(response);
}
function onOpenHandler(){
	document.getElementById("message").innerHTML += "<p>Connection Established</p>";
}
function onCloseHandler(){
	
}
function subscribeToGame29(){
	game29Socket.subscribe("game29" , {
		username: player.username,
		score: player.score
	});
}
function publishToGame29(){
	game29Socket.publish("game29" , {
		username: player.username,
		score: player.score
	})
}
function onErrorHandler(response){
	console.log(response.code);
	if(response.code === -1){
		console.log("Subscription to channel failed")
	}
}
