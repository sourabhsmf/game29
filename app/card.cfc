component accessors="true" output="true" 
{
	property name="house" type="string" required="true" hint="house of the card";
	property name="number" type="string" required="true" hint="7-10-A-K-Q-J";
	
	public card function init(house , number){
		setHouse(house);
		setNumber(number); 
		return this;
	}
		
}