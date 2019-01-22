component extends="CFIDE.websocket.ChannelListener"{

	public boolean function allowSubscribe(Struct subscriberInfo){
				
		var joiningPlayer = "";
		
		joiningPlayer =	StructKeyExists(subscriberInfo,"username") and 
						StructKeyExists(subscriberInfo,"score") and 
						Len(subscriberInfo.username) and 
						Len(subscriberInfo.score) ? 
						createObject("component","player").init(username=subscriberInfo.username , score=subscriberInfo.score) 
						:  "";
		if(isInstanceOf(joiningPlayer,"player") and !arrayFind(application.allPlayers,joiningPlayer)){
			arrayAppend(application.allPlayers, joiningPlayer);
			return true;
		}
		else
			return false;
	}
	public boolean function allowPublish(publisherInfo){
		writeDump(var = "here" , output="console");
		WSPublish(channelname = "game29",message="joined");
		return true;
	}
}