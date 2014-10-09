var LOGMANAGER= Packages.org.apache.log4j.LogManager;

var loggerEnumeratin = LOGMANAGER.getCurrentLoggers();
var allLoggers = {};
while(loggerEnumeratin.hasMoreElements()){
	     var mylogger = loggerEnumeratin.nextElement();
	     var level = (mylogger.level != null ? mylogger.level : "");
         allLoggers[mylogger.name]=level;
}

model.allLoggers=allLoggers;