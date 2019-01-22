game29 = {
	highestBid : 16,
	highestBidPlayerName : "Player 1",
	bidTurn : 1,
	init : function(){
		document.getElementById("highestBid").innerText += this.highestBid;
		document.getElementById("highestBidPlayerName").innerText += this.highestBidPlayerName;
	},
//	set highestBid(bid){
//		this.highestBid = bid;	
//	},
//	set bidTrun(turn){
//		this.bidTurn += 1; 
//	}
		
};

game29.init();


function startBiding(element){
	document.getElementById("message").innerHTML = "<p style='text-align:center'>Staring Bidding</p>"	
	if(game29.initiatingPlayer){
		document.getElementById("bid").disabled = "";
	}
}
document.onload = startBiding();