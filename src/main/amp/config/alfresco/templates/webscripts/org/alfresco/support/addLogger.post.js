var LOGGER = Packages.org.apache.log4j.Logger;
var LEVEL = Packages.org.apache.log4j.Level;
var LOGMANAGER= Packages.org.apache.log4j.LogManager;

var LOGGER_OK=0;
var LOGGER_NOT_SURE=1;
var LOGGER_KO=2;

var packageArr = new Array();
var logLevLArr= new Array();    

for each (field in formdata.fields)
{
	switch (String(field.name).toLowerCase())
	{
	case "log":
		packageArr.push(field.value.trim());
		break;

	case "level":
		logLevLArr.push(field.value);
		break;

	case "hiddenshowlogs":
		model.showLogs=field.value;
		break;	

	default:	
		break;
	}
}

var result = {};

for(var i =0; i<packageArr.length;i++){

	if(packageArr[i] != null && packageArr[i] != ""){

		var logName= packageArr[i];
		var logLevel = logLevLArr[i];
		var localLevel = LEVEL.toLevel(logLevel);
		var couple = new Array();
		couple.push(logName);
		couple.push(logLevel);
		

		var localLogger = LOGMANAGER.exists(logName);

		if(localLogger!=null){

			localLogger.setLevel(localLevel);
			logIt(localLogger);
			result[couple]=LOGGER_OK;
			continue;

		}
		else{

			//check if it's a class -> it means it doesn't have a logger
			try{

				var classObj = java.lang.Class.forName(logName);
				result[couple]=LOGGER_KO;
				continue;
			}
			catch(e){
			}
			
			var localLogger = LOGGER.getLogger(logName);
			//check if it's a Package
			var packageObj = java.lang.Package.getPackage(logName);

			if(packageObj!=null){
				localLogger.setLevel(localLevel);
				logIt(localLogger);
				result[couple]=LOGGER_OK;
				continue;
			}

			//if we don't know we set it anyway
			
			localLogger.setLevel(localLevel);
			logIt(localLogger);
			result[couple]=LOGGER_NOT_SURE;
			continue;


		}
	}
}

var loggerEnumeratin = LOGMANAGER.getCurrentLoggers();
var allLoggers = {};
while(loggerEnumeratin.hasMoreElements()){
	var mylogger = loggerEnumeratin.nextElement();
	var level = (mylogger.level != null ? mylogger.level : "");
	allLoggers[mylogger.name]=level;
}

model.result = result;
//model.notExisting = notExisting;
//model.notSureExisting = notSureExisting;
model.allLoggers=allLoggers;


function logIt(mylogger){
	if(mylogger.level == LEVEL.OFF){
		mylogger.log(mylogger.level,"*** ADDLOGGER -->LOGGER for " + mylogger.name + " turned OFF");
		return;
	}
	mylogger.log(mylogger.level,"*** ADDLOGGER -->LOGGER for " + mylogger.name + " activated with "+mylogger.level +" LEVEL ***") ;
}