<head>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	 <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
<cfset allPlayableCards = createObject("component","rule").getPlayableCards()>
<!---Create all players --->
<cfset players  = []>
<cfloop index="i" from="1" to="4">
	<cfset arrayappend(players, createObject("component","player").init(username = "Player"&i , score = 0))>
</cfloop>
<cfset game = createObject("component","game").init(players=players, trumpCard = "")>

<cfscript>
	for(card in allPlayableCards){
		//writeOutput(card.getHouse()&card.getNumber()&"<br>");
		
	}
</cfscript>

<cfscript>
	//game.shuffleCards();
	game.shuffleDeck();
	game.assignCardsToPlayers();
	
</cfscript>
		
<cfloop array="#players#" index="player">
	<cfoutput>
		<div class="#player.getUsername()#" style="display:inline-block;margin:0 30 0 30">
			<p>#player.getUsername()#</p>
			<input type="numeric" disabled placeholder="Bid" id="bid" ></input>
			<input type="button" value="Bid"></input>
			<input type="button" value="Pass"></input>
		
	</cfoutput>
	<!---Show the first four cards --->
	<cfset playerCards = player.getCards()>
	<cfloop index="cardIndex" from="1" to="4">
		<cfoutput>
			<div class="cards">
				<h4>#playerCards[cardIndex].getHouse()#:#playerCards[cardIndex].getNumber()#</h4>
			</div>
		</cfoutput>	
	</cfloop>
	<cfoutput >
		</div>
	</cfoutput>
</cfloop>
<div class="bid" style="text-align:center;">
	<h1 id="highestBid">Highest Bid:</h1>
	<h1 id="highestBidPlayerName">By Player:</h1>
</div>
<div id="message">
	
</div>
	<script src="bid-main.js"></script> 
	<script>
		game29.initiatingPlayer = true;
	</script>
	

</body>

