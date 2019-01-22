component accessors="true"   
{
	property name="username" type="string" required="true" hint="username of player";    
	property name="cards" type="card[]" required="false" hint="set of cards available to a player for a game";
	property name="score" type="numeric" required="true" hint="individual score of player";
	
	public player function init(username, score){
		setUsername(username);
		setScore(score);
		return this;
	}	   
}