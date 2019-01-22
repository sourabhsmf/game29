component accessors="true" output="false" {
	
	//property name="turn" type="any" default="0" required="true" ;
	//property name="score" type="array" default="0" required="true" ;
	property name="trumpCard" type="any" default="" required="false" ;
	//property name="hand" type="any" default="0" required="true" ;
	property name="playableCards" type="card[]" required="false";
	property name="rule" type="rule" default="0" required="false";
	property name="players" type="player[]" required="false" ;
	
	
	public game function init(players){
		//Get all playable cards from rules of the game
		setPlayers(players);
		setRule(createObject("component" , "rule").init());
		setPlayableCards(this.getRule().getPlayableCards());
		return this;
	}
	
	public void function shuffleCards(){
		var playableCards = getPlayableCards();
		var players = getPlayers();
		var cardSelected = [];
		
		
		//writeDump(playableCards);
		//Assign 8 cards to the 4 players of the game
		while(arrayLen(playableCards) neq 0){
			//Save the card index to remove the card from playableCards
			//Save the selectedcard as array to setCard for player later
			//Select the player
			
			playerSelected = players[randRange(1,arrayLen(players))];
			writeDump(playerSelected);
			if(isNull(playerSelected.getCards())){
				var cardSelectedIndex = randRange(1,arrayLen(playableCards) - 1) + 1;
				writeDump(cardSelectedIndex);
				arrayAppend(cardSelected , playableCards[cardSelectedIndex]);
				playerSelected.setCards(cardSelected);
				arrayClear(cardSelected);	
				
				arrayDeleteAt(playableCards,cardSelectedIndex);
				setPlayableCards(playableCards);
				writeDump(playableCards);
				writeDump(playerSelected);
			}
			else{
				var cardSelectedIndex = randRange(1,arrayLen(playableCards) -1 ) + 1;
				arrayAppend(cardSelected , playableCards[cardSelectedIndex]);
				
				//Check if player has no cards or has 8 cards
				if(ArrayLen(playerSelected.getCards()) lte 8 ){
					//Check if player already has the card else add this card
					writeDump(cardSelectedIndex);
					//Get cards already present in player and append the new card and set it to player card array
					
					arrayAppend(cardSelected,playerSelected.getCards(), true);
					//Add card to player's cards
					arrayAppend(cardSelected , playableCards[cardSelectedIndex]);
				
					playerSelected.setCards(cardSelected);
					arrayClear(cardSelected);
					
					//Delete the selectedCard from playable card
					arrayDeleteAt(playableCards,cardSelectedIndex);
					writeDump(playableCards);
					writeDump(playerSelected);	
					//Update the array for playableCards
					setPlayableCards(playableCards);
				}
			}
		setPlayers(players);				
		}		       
	}
	public void function shuffleDeck(){
		var playableCards = getPlayableCards();
		CreateObject( "java", "java.util.Collections" ).Shuffle(playableCards) ;
		setPlayableCards(playableCards);	
	}
	public void function assignCardsToPlayers(){
		//shuffleDeck();
		var playableCards = getPlayableCards();
		var cardList = [];
		var players = getPlayers();
		for(i=1;i<=32;i++){
			arrayAppend(cardList,playableCards[i]);
			if(i % 8 == 0){
				players[i/8].setCards(cardList);
				arrayClear(cardList);
			}
			
		}
		
	}
}