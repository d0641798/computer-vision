Data=[];
if ~exist('mObj')
    mObj=mobiledev;
end
for i=1:5
    pause(1)
    Data=[Data;timetable(datetime,mObj.Acceleration(1),mObj.Acceleration(2),mObj.Acceleration(3))];
end
thingSpeakWrite(1588534,Data,'WriteKey','5FAM9LH386XHTTRQ');