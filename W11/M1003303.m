data=thingSpeakRead(935349,'DateRange',[datetime("Nov 18, 2021"),datetime("Nov 19, 2021")],'OutputFormat','timetable')
data1=thingSpeakRead(624218,'DateRange',[datetime("Nov 18, 2021"),datetime("Nov 19, 2021")],'OutputFormat','timetable')
data2=thingSpeakRead(12397,'DateRange',[datetime("Nov 18, 2021"),datetime("Nov 19, 2021")],'OutputFormat','timetable')

thingSpeakWrite(1579923,timetable(data(1:100,:).Timestamps,data(1:100,:).humidity,data1(1:100,:).Pulsdauerms,data2(1:100,:).WindDirectionNorth0Degrees)...
,"WriteKey",'8P9Q53ZA3HPTINF1')