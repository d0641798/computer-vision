Data=[];

while 1
    pause(1)
    flag=thingSpeakRead(1588604,'ReadKey','V2JGS4KSM9A71TSJ')
    if flag==0
        for i=0:10:100
            pause(15)
            Data=timetable(datetime,i);
            thingSpeakWrite(1588498,Data,'WriteKey','BTN58CWTU6UQF452');
            
        end 
        thingSpeakWrite(1588604,1,'WriteKey','FFRKOSTRVAG0WEOJ')
    end
end
