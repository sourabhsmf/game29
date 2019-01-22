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
	<!---TODO- Provide user to register --->
<cfif !StructKeyExists(session,"player")>
	<cfset player = createObject("component","player").init(username = "Player"&randRange(1,100) , score = 0)>
	<cfset session.player = player> 
</cfif>
<cfwebsocket name="game29Socket" subscribeto="game29" onError="onErrorHandler" onmessage="onMessageHandler" onopen="onOpenHandler" onClose="onCloseHandler" >
<cfoutput>
<script>
	var player = #serializeJSON(session.player)#;
</script>
<input type="button" value="Subscribe" onclick="subscribeToGame29()"></input>
<input type="button" value="Publish" onclick="publishToGame29()"></input>

</cfoutput>



	<cfoutput>
		<div class="#session.player.getUsername()#" style="display:inline-block;margin:0 30 0 30">
			<p>#session.player.getUsername()#</p>
			<input type="numeric" disabled placeholder="Bid" id="bid" ></input>
			<input type="button" value="Bid"></input>
			<input type="button" value="Pass"></input>
		
	</cfoutput>
	<!---Show the first four cards --->
	<!---<cfset playerCards = player.getCards()>
	<cfloop index="cardIndex" from="1" to="4">
		<cfoutput>
			<div class="cards">
				<h4>#playerCards[cardIndex].getHouse()#:#playerCards[cardIndex].getNumber()#</h4>
			</div>
		</cfoutput>	
	</cfloop>
	<cfoutput >
		</div>
	</cfoutput>--->
	<div class="bid" style="text-align:center;">
		<h1 id="highestBid">Highest Bid:</h1>
		<h1 id="highestBidPlayerName">By Player:</h1>
	</div>
	<div id="message">
		
	</div>
	<div class="allPlayers">
		<h2>All Players</h2>
		<cfloop array="#application.allPlayers#" index="player">
			<cfif isInstanceOf(player,"player") >
				<cfoutput>
					<div class="#player.getUsername()#">
						#player.getUsername()#
					</div>
				</cfoutput>
			</cfif>
		</cfloop>
	</div>
	<script src="sockets-main.js"></script>
	<script src="bid-main.js"></script> 
	<script>
		game29.initiatingPlayer = true;
		
	</script>
	
</body>