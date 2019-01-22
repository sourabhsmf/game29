component 
{	
	this.name = "game29";
	this.applicationTimeout = createTimeSpan(0,2,0,0);
	this.sessionManagement = "yes";
	this.sessionTimeout=createTimeSpan(0,2,0,0);
	this.setclientcookies = "yes";
	this.wschannels=[{name = "game29",cfclistener= "game_listener"}];
	
	function onApplicationStart(){
		writeLog("application started");
		application.allPlayers = [];
	}	
}