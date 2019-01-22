component accessors="true"    
{
	property name="handNumber" type="string" required="true" hint="the hand number of the game";
	property name="winner" type="string" required="true" hint="winner of hand";
	property name="rule" type="any" required="true" hint="rules of the game";
	property name="cards" type="array" required="true" hint="all the 4 cards available for hand";
	
	public card function getWinningCard(){
		for(card in cards){
			
		}	
	}

}