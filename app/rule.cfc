component 
{
	public rule function init(){
		return this;
	}
	public struct function getCardPoints(){
		var pointsTally = {
			7 = "0" ,
			8 = "0" , 
			9 = "2" , 
			10 = "1" ,
			A = "1" ,
			K = "0" , 
			Q = "0" , 
			J = "3" 
		};
		return pointsTally;
	}
	public array function getCardRanking(trumpHouse=""){
		//TODO- Add rule for joker card as trumpHouse
		var cardRanking = [ "J" , "9" , "A" , "10" , "K" , "Q" , "8" , "7"];
		if(Len(trumpHouse)){
			arrayPrepend(cardRanking,trumpHouse);
		}
		return cardRanking;
	}
	public array function getPlayableCards(){
		var playableCards = [];
		for(house in ["Hearts" , "Diamonds" , "Clubs" , "Spades"]){
			for(number in ["7" , "8" , "9" , "10" , "A" , "Q" , "K" , "J"]){
				ArrayAppend(playableCards,createObject("component","card").init(house=house, number=number));
			}
		}	
		return playableCards;
	}
 	
	
}