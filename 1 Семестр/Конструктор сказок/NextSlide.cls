SB0  _T      Next_paje11 >  HSpace     HANDLE    HObject     HANDLE   
 WindowName     STRING    _HObject     HANDLE    hprev1     HANDLE    hnext1     HANDLE   	 PressNext     FLOAT�  	 PressPrev     FLOAT�   PresMenu     FLOAT�   PressNew     FLOAT�   PressOtv     FLOAT�  	 PressHint     FLOAT    Rhelp     FLOAT�   Gres     FLOAT�   mark     FLOAT�   init     FLOAT�   CountZad     FLOAT�   NextShow     FLOAT�   numNow     FLOAT�   numNext     FLOAT�   Next     FLOAT�   PrevShow     FLOAT�   num     FLOAT�   flag     FLOAT�   res     FLOAT�  	 init_time     FLOAT�   b_year     FLOAT    b_mon     FLOAT    b_day     FLOAT    b_Hour     FLOAT    b_min     FLOAT    b_sec     FLOAT    msec     FLOAT    b_time     FLOAT�   result     FLOAT�   resul     FLOAT�  	 SaveEvent     FLOAT�  
 EventRight     FLOAT�   EventRightStop     FLOAT�   EventBad     FLOAT�  	 EventHint     FLOAT�   EventBadStop     FLOAT�   NMass2     HANDLE�   uid     STRING�   SaveFileName     STRING�   SaveFileNameEnter     STRING�   count     FLOAT�   s1     STRING�   i     FLOAT�   count_of_isp     FLOAT�   count_of_all     FLOAT�   H1     HANDLE�   pod     FLOAT�   tmp     HANDLE�   r     FLOAT�   Hour     FLOAT    minut     FLOAT    sec     FLOAT    time     FLOAT�   wrstr     STRING�   HOut     HANDLE�   str     STRING�       �����wwwww ��������wwwwwww������wwwwwwwwww���� wwwwwwwwwwp����wwwwwwwwwwww���wwwwwwwwwwwwp��wwwwwwwwwwwwp��wwwwwwwwwwwww�wwwwwwwwwwwwww�wwwwwwwwwwwwww�wwwwwwwwwwwwwwp�wwwwwwwwwwwwwwpwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww�wwwwwwwwwwwwwwp�wwwwwwwwwwwwww�wwwwwwwwwwwwww�wwwwwwwwwwwwww�wwwwwwwwwwwwp���wwwwwwwwwwwwp���wwwwwwwwwwww���wwwwwwwwwwww����wwwwwwwwww�����wwwwwwwwp�������wwwwwwww��������  www �����������   ������	 R       F   2D  � @                         Y@      Y@      Y@      Y@      ��  
 E2HANDLE HSpace, HObject
STRING WindowName
Handle _HObject
Handle hprev1,hnext1
FLOAT PressNext, PressPrev, PresMenu, PressNew, PressOtv, PressHint
FLOAT Rhelp, Gres
FLOAT mark //������ �������������� local

// 29.01.2014 ����� ����

if(~init==0)
init:=1
 CountZad:= MGet(-111,1,2,1)       //���� ����� ������� == 0 �� ����������� ���� ������ (��� H�ad)
 if(~CountZad == 1)
   NextShow:=0
 endif
 if(~CountZad == 0)
   NextShow:=0
 endif
 numNow:=~MGet(-500,2,0,1)
 numNext:=~numNow+1
 Next:=MGet(-500,~numNext,1,1)
 NextShow:=1
 PrevShow:=1
 if(~Next==-1)
   NextShow:=0
 endif
 if(~numNow==0)
 PrevShow:=0
 endif
 if(~next==0)
   nextShow:=0
 endif
 num:=~MGet(-500,0,1,1)  //���� = -1 �� ����������� �� ������ �������
 CountZad:=    MGet(-111,1,2,1)       //���� ����� ������� == 0 �� ����������� ���� ������ (��� H�ad)
 if(~num == -1 || ~CountZad == 0 )
  PrevShow:=0
  NextShow:=0
 endif
endif
//--------������������ �������-----------//
if(~PressNext==1&&~flag==1)
PressNext:=0
 numNow:=~MGet(-500,2,0,1)
 numNext:=~numNow+1
 Next:=MGet(-500,~numNext,1,1)
 if(~Next==-1)
 exit()
 endif
 res:=MPut(-500,0,0,1,1)
 res:=MPut(-500,1,0,~Next,1)
 res:=MPut(-500,2,0,~numNext,1)
 closeAll()
 exit()
endif

if(~PressPrev==1&&~flag==1)
PressPrev:=0
 numNow:=~MGet(-500,2,0,1)
 if(~numNow == 0)
   exit()
 endif
 numNext:=~numNow-1
 Next:=MGet(-500,~numNext,1,1)
 res:=MPut(-500,0,0,1,1)
 res:=MPut(-500,1,0,~Next,1)
 res:=MPut(-500,2,0,~numNext,1)
 closeAll()
 exit()
endif

if(~PresMenu==1&&~flag==1)
PresMenu:=0
 num:=~MPut(-500,0,1,-1,1)  
 closeAll()
 exit()
endif

//----�������� ����� ����� ������ ����----//
if (~init_time==0)
  init_time:=1
  GetDate(~b_year,~b_mon,~b_day)
  GetTime(~b_Hour,~b_min,~b_sec,~msec)
  b_time := ~b_hour*3600 + ~b_min*60 + ~b_sec
  //ret := MessageBox("����� ����� ��������","���������",MB_OKCANCEL | MB_ICONQUESTION)
endif

if(~PressNext==1 || ~PressPrev==1 || ~PresMenu==1 || ~PressNew == 1 || PressOtv == 1)
 if(GetHObjectByName("\��������Rus")!=#0) // ���� ����� ����������, ������� �������� ������
   result := GetVarF("\��������Rus","result")
   //ret := MessageBox(string(~result),"����� ����������",MB_OKCANCEL | MB_ICONQUESTION) 
   if(~result>4)
     resul := 0
   endif
       
   if(~result==1) // ���������� �����
    resul:=1
    SaveEvent := 0
    EventRight := 1
    if(~EventRightStop == 1)
    //  EventRightStop := 0 ;
      //ret := MessageBox("___","������ ����������� ������",MB_OKCANCEL | MB_ICONQUESTION)
    endif
    SetVar("\��������Rus","result",7)
    //ret := MessageBox("����� ������!","���",MB_OKCANCEL | MB_ICONQUESTION)
   else
    if(~result==2)//���-�� ��������� �� �� ���������
      resul:=0
      SaveEvent := 0
      EventBad := 1
      init_time := 0
      //ret := MessageBox("������� �� �������","����� ���",MB_OKCANCEL | MB_ICONQUESTION) 
    endif
    if(~result== 3)// ������ � ���� ����� �� ��������
      SaveEvent := 1
      //ret := MessageBox("���� ����� �����","������",MB_OKCANCEL | MB_ICONQUESTION) 
    endif   
    if(~result==4) // ������ ������ ������
      SaveEvent := 0
      //ret := MessageBox("������","������ �� ���",MB_OKCANCEL | MB_ICONQUESTION) 
      EventHint := 1 //������
      
     //EventBad := 0 ; //-------
      if(~EventRightStop == 1)
        //-----------------------------------
        //SaveEvent := 1 //----------------------------------------------
        //-------------------------------
        EventRightStop := 0 ;
      endif
        //-----------------
      resul := 0//--------------------
      //--------------------
  
      //sdal := 1// ���� ����� ��� ����� ��������� ������ ��� �� �������� 2��
    //else
      //sdal := 0
    endif
   endif
  else // ������ �� ���������� ������� �������� ������
    resul:=1 //� ������ ����� ��������
    //ret := MessageBox("��� ������","",MB_OKCANCEL | MB_ICONQUESTION) 
  endif
    
  if(~pressNew == 1 && ~EventBad == 1 && ~EventBadStop == 1) // �� ����� ���� ������ ������
     EventBadStop := 0
     EventBad := 0
     //ret := MessageBox("AAAAAAAAAAA","",MB_OKCANCEL) 
  endif 
  if(~pressNew == 1 && ~EventBad == 1) // �� ����� ��� ������ ����� � ������ ������
     EventBadStop := 1
     EventBad := 0
     SetVar("\��������Rus","result",6)
     //ret := MessageBox("�������","",MB_OKCANCEL) 
  endif 
  
  if( (~EventHint && ~pressNew) || (~EventHint && ~PresMenu) )
    SaveEvent := 1 ;
    EventHint := 0 ; 
    SetVar("\��������Rus","result",5) // ���������� ���� � ����� 5 "������" 
  endif
  
  if( ~pressNew == 1 && ( ~result == 5 || ~result == 0) ) // ���� ������ ������ � �� ����� ���� ���� ������
    SaveEvent := 0 ;
    EventRightStop := 0 ; // ������
    //-----------------
    resul := 0//--------------------
    //--------------------
    //ret := MessageBox("111","",MB_OKCANCEL) 
  endif
  
  if( ~pressNew == 1 && ~result == 6 ) // ���� ������ ������ � �� ����� ���� ���� ������
    SaveEvent := 0 ;
    //EventRightStop := 0 ; // ������
  //ret := MessageBox("222","",MB_OKCANCEL) 
  endif
  
  if( ~pressNew == 1 && ~result == 8 ) // ���� ������ ������ � �� ����� ���� ���� ������
    SaveEvent := 0 ;
    EventRightStop := 0 ;
    resul := 0;
  //ret := MessageBox("333","",MB_OKCANCEL) 
  endif 
  
  if( ~pressNew == 1 && ~result == 7 ) // ���� ������ ������ � �� ����� ���� ���� ������
    SaveEvent := 0 ;
    SetVar("\��������Rus","result",8) // ��� ������ ����� ����� ����������� ������ ������ ������ � ����� ����� ������
    //ret := MessageBox("444","",MB_OKCANCEL) 
  endif
  
  if( ~pressNew == 1 && ~result == 3 ) // ���� ������ ������ � �� ����� ���� ���� ������
    SaveEvent := 0 ;
    //ret := MessageBox("555","",MB_OKCANCEL) 
  endif
  
  if( ~presMenu == 1 && ~result == 3 ) //��� ��������  //------------------------------------------����� 
     SaveEvent := 0  //------------------------------------------����� 
     eventRightStop := 0
     resul := 0
  endif  //------------------------------------------����� 
  
  if( ~presMenu == 1 && ~result == 4 ) //��� ��������  //------------------------------------------����� 
     SaveEvent := 0  //------------------------------------------����� 
  endif  //------------------------------------------����� 
    
  if( ~presMenu == 1 && ~result == 5 ) //��� ��������  //------------------------------------------����� 
   SaveEvent := 0  //------------------------------------------����� 
  endif  //------------------------------------------����� 
   
  if( ~presMenu == 1 && ~result == 0 ) //????��������  //------------------------------------------����� 
   SaveEvent := 0  //------------------------------------------����� 
  endif  //------------------------------------------����� 
  
  if(~SaveEvent == 0 && ~EventRightStop == 0 && ~EventBadStop == 0)
    if(~EventRight)
      EventRightStop := 1
      //ret := MessageBox(".����!","����",MB_OKCANCEL | MB_ICONQUESTION) 
    endif
     
    SaveEvent := 1
    //ret := MessageBox("����������.........","����������",MB_OKCANCEL | MB_ICONQUESTION)
    NMass2:=Handle(MGet(-600,1,1,1))
    if(~NMass2)
      uid:=vGetS(~NMass2,0,"uid")
      SaveFileName:=vGetS(~NMass2,0,"SaveFileName")
      SaveFileNameEnter:=vGetS(~NMass2,0,"SaveFileNameEnter")
    endif
    
    /*����� ��������� ���� � ���������!!!!!!!!!!!!!!!!!!!!!*/
    count := GetObjectCount("New_Project_Class")
    s1 := ""
    i:=0;
    count_of_isp:=0;
    count_of_all:=0;
    while(~i<~count)
      H1:=GetHObjectByNum("New_Project_Class",~i)
      if(GetObjectClass("New_Project_Class",~H1)=="ButtonShowHelpLevel")
        s1:=GetObjectName2d(~HSpace,~H1)
        if(GetVarF("\" + ~s1,"help")==1)         
         inc(~count_of_isp)
        endif
        inc(~count_of_all)
        SetVar("\" + ~s1,"Again",1)
      endif
      inc(~i)
    endwhile
    if(~count_of_all == 0)
      pod := 0
    else
      pod:=~count_of_isp/~count_of_all 
    endif
    logmessage(string(~pod))
    /*������ ������ ����� � �������� - ����� ������ ���������� ����*/
    
    if (~uid!="")
     tmp:=CreateStream ("MEMORY","","WRITEONLY")
     r := Writeln(~tmp,'<?xml version="1.0" encoding="Windows-1251"?>')
     r := Writeln(~tmp,'<XML>')
     r := Writeln(~tmp,"<ver>"+vGetS(~NMass2,0,"ver")+"</ver>")
     r := Writeln(~tmp,"<query_type>"+vGetS(~NMass2,0,"query_type")+"</query_type>")
     r := Writeln(~tmp,"<Answer>")
     r := Writeln(~tmp,"<uid>"+~uid+"</uid>")   
     r := Writeln(~tmp,"<taskid>"+vGetS(~NMass2,0,"taskid")+"</taskid>")   
     r := Writeln(~tmp,"<comment>"+"</comment>")
     GetTime(~Hour,~minut,~sec,~msec)
     time:= ~hour*3600 + ~minut*60 + ~sec
     time:=~time-~b_time
     wrstr:=String(~b_day)+";"+String(~b_mon)+";"+String(~b_year)+";"//date
     wrstr:=~wrstr+String(~b_hour)+";"+String(~b_min)+";"+String(~time)//+String(~hour)+";"+String(~minut)+";"+String(~msec)//time&duration
     r := Writeln(~tmp,"<time>"+~wrstr+"</time>")
     if(~resul>0)
      GRes := 1;
      RHelp := ~pod;  
      mark := (1/255)*(255*~Rhelp+5*255*~Gres-((3/255)*255*255*~Rhelp*~Gres))
      wrstr:=string(round(~mark,1))+";"+string(round(255*~Rhelp,0))+";"+string(round(255*~Gres,0))+";"+string(0) 
     else
      if(~resul<0)//������ R � G ��� �������� � ������ ���
        mark := (1/255)*(255*~Rhelp+5*255*~Gres-((3/255)*255*255*~Rhelp*~Gres)) 
        wrstr:=string(round(~mark,1))+";"+string(round(255*~Rhelp,0))+";"+string(round(255*~Gres,0))+";"+string(0) 
      else // ����� ����� � ������ ���
        GRes := 0;
        RHelp := ~pod;
        mark := (1/255)*(255*~Rhelp+5*255*~Gres-((3/255)*255*255*~Rhelp*~Gres))
        wrstr:=string(round(~mark,1))+";"+string(round(255*~Rhelp,0))+";"+string(round(255*~Gres,0))+";"+string(0) 
      endif
     endif
     //ret := messageBox(string(~mark),"������ = " + string(~result),MB_OKCANCEL | MB_ICONQUESTION)
     r := Writeln(~tmp,"<result>"+~wrstr+"</result>")
     r := Writeln(~tmp,"</Answer>")
     r := Writeln(~tmp,"</XML>")
 
      if(fileexist(~SaveFileName))
       HOut := CreateStream("FILE",~SaveFileName,"READWRITE")
       r := Seek(~HOut,GetSize(~HOut)-8)//</XML>
       r := Seek(~tmp,0)
       while(!Eof(~tmp))
         str:=Readln(~tmp)
         if(Left(~str,8)=='<Answer>' || Left(~str,5)=='<uid>' || Left(~str,8)=='<taskid>' ||Left(~str,9)=='<comment>' ||Left(~str,6)=='<time>' ||Left(~str,8)=='<result>' ||Left(~str,9)=='</Answer>'||Left(~str,6)=='</XML>')
           r := Writeln(~HOut,~str)
         endif
       endwhile
       r:=CloseStream (~HOut)
      else
       HOut := CreateStream("FILE",~SaveFileName,"CREATE")
       r:= CopyBlock(~tmp,~HOut,0,GetSize(~tmp))//~HStream
       r:=CloseStream (~HOut)
      endif
///////////////
    if(fileexist(~SaveFileNameEnter))
     HOut := CreateStream("FILE",~SaveFileNameEnter,"READWRITE")
     r := Seek(~HOut,GetSize(~HOut)-8)//</XML>
     r := Seek(~tmp,0)
     while(!Eof(~tmp))
       str:=Readln(~tmp)
       if(Left(~str,8)=='<Answer>' || Left(~str,5)=='<uid>' || Left(~str,8)=='<taskid>' ||Left(~str,9)=='<comment>' ||Left(~str,6)=='<time>' ||Left(~str,8)=='<result>' ||Left(~str,9)=='</Answer>'||Left(~str,6)=='</XML>')
         r := Writeln(~HOut,~str)
       endif
     endwhile
     r:=CloseStream (~HOut)
    else
     HOut := CreateStream("FILE",~SaveFileNameEnter,"CREATE")
     r:= CopyBlock(~tmp,~HOut,0,GetSize(~tmp))//~HStream
     r:=CloseStream (~HOut)
   endif
////////////////    
     r:=CloseStream (~tmp)  
    endif
   endif
 //endif 
 flag := 1
 if(~PressOtv == 1 && ~result == 3) //------------------------------------------����� 
   flag := 0 //------------------------------------------����� 
 endif //------------------------------------------����� 
 
 if(~PressNew == 1)
  PressNew := 0   
  EventBadStop := 0 // -------
  flag := 0 //------------------------------------------����� 
  EventRightStop := 0 //------------------------------------------����� 
  /*����� ������� �����!!!!!!!!!!!!!!*/
  
  count := GetObjectCount("New_Project_Class")
  s1 := ""
  i:=0;
  while(~i<~count)
    H1:=GetHObjectByNum("New_Project_Class",~i)
    if(GetObjectClass("New_Project_Class",~H1)=="ButtonShowHelpLevel")
      s1:=GetObjectName2d(~HSpace,~H1)
      SetVar("\" + ~s1,"Again",1)
    endif
    inc(~i)
  endwhile
  
  
  /*---------------------------------*/
  //monitoringSave := 0
  Rhelp := -1
  Gres := -1 
  init_time := 0 // ����� ��������� �������
  mark := -1
 endif 
 if(PressOtv == 1)// ������ �� ��� ��� ������� ��� �����������?
  PressOtv := 0 //
  //monitoringSave := 0
  //init_time := 0 // ����� ��������� �������
 endif
endif     
 system.dbm �             6 5        �?        �[@q        �?        @       �??            �?6 5 :                       6 5 K                  @@q         @                �??            �?         @@q          �?       �??          �?         �?           �?q 6 5 �                       6 5 �                       6 5 �                  @@q                 �?       �??         �[@q        �?        @       �??            �?q 6            6 , 5                                �?6          �?6 + 5 �                 @@q         @                �??            �?         @@q          �?       �??            �?q 6 5 s        @@q                          �?       �?@         @@q        �?                  �?@         @@q         @                  �?@   Q            �?6          �?6 + 5 u                 @@q         @                �??              6 5            �?         @@q          �?       �??         @@q                          �?       �?@         @@q        �?                  �?@         @@q         @                  �?@   Q            �?6          �?6 + 5 �                 @@q                 �?       �?q        �?@   Q              6 5 �       �?  � � � �� � � �  �         �@          N@      !          �?6          �?6 ,          �?6 ,  	        �?6 ,  
        �?6 , 5 �z  \��������Rus  �     S 5 �z  \��������Rus  z  result  � "  "        @8 5 G          #  "        �?6 5 �       �? #           $        �? %  &        �?6 5 pz  \��������Rus  z  result         @�3 � "         @6 5 �          #           $        �? '             "        @6 5 �       �? $  "        @6 5 �          $        �? (  &        �?6 5 �          &           # 3 �       �? #  	        �?6  '        �?6 +  )        �?6 + 5 !          )           '  	        �?6  '        �?6 + 5 W       �? )           ' z  \��������Rus  z  result         @� (  	 +  (   + , 5 �       �? $           ( z  \��������Rus  z  result         @� 	        �?6  "        @6  "          6 , + 5 �          $           &           #  	        �?6  "        @6 + 5 �          $  	        �?6  "         @6 + 5 �          $           &           #  	        �?6  "        @6 + 5 )          $ z  \��������Rus  z  result          @� 	        �?6  "        @6 + 5 C          $          �?6  "        @6 + 5 k          $           &           #          �?6  "        @6 + 5 �          $          �?6  "        @6 + 5 �          $          �?6  "          6 + 5 �          $  $          6  &          6 +  )          6 + 5  % 5 �       �? &        �? $       ��@q        �?       �?       �??   *  * o : *          z  uid �{ +  *          z  SaveFileName  �{ ,  *          z 	 SaveFileNameEnter �{ - z 	 New_Project_Class � . z    { /           0           1           2  0  . : 5 �z 	 New_Project_Class  0 � 3 z 	 New_Project_Class  3 �z 
 ButtonShowHelpLevel � 5 �    3 z{ / z  \ y / | z  help  �       �?6 5 ��1 c�2 cz  \ y / | z  Again        �?��0 c3 b 2          6 5 �          4 3 � 1  2   4  4 � �y + z    � 5 z  MEMORY  z    z  WRITEONLY �  5  5 z  <?xml version="1.0" encoding="Windows-1251"?> �  6  5 z  <XML> �  6  5 z  <ver>  *          z  ver �| z  </ver>  | �  6  5 z  <query_type>   *          z  query_type  �| z  </query_type> | �  6  5 z  <Answer>  �  6  5 z  <uid> y + | z  </uid>  | �  6  5 z  <taskid>   *          z  taskid  �| z  </taskid> | �  6  5 z  <comment> z  </comment>  | �  6 �7 �8 �9 �  � 7        �@  8        N@   9   :  :  !   :   � z  ; |   � | z  ; |   � | z  ; | { ; y ;   � | z  ; |   � | z  ; |  : � | { ;  5 z  <time>  y ; | z  </time> | �  6  #          8 5 �       �?   4          �?      �o@       �o@          @      �o@            @      �o@       �o@       �o@                    �?) � z  ; |       �o@            ) � | z  ; |       �o@            ) � | z  ; |          � | { ; 3 �	 #          : 5 ^	       �?      �o@       �o@          @      �o@            @      �o@       �o@       �o@                    �?) � z  ; |       �o@            ) � | z  ; |       �o@            ) � | z  ; |          � | { ; 3 �	            4          �?      �o@       �o@          @      �o@            @      �o@       �o@       �o@                    �?) � z  ; |       �o@            ) � | z  ; |       �o@            ) � | z  ; |          � | { ;  5 z  <result>  y ; | z  </result> | �  6  5 z  </Answer> �  6  5 z  </XML>  �  6 y , �5 �
z  FILE  y , z  READWRITE �  <  <  < �         @ �  6  5          �  6  5 � - 5 �
 5 � { = y =         @} z  <Answer>  � y =        @} z  <uid> � , y =         @} z  <taskid>  � , y =        "@} z  <comment> � , y =        @} z  <time>  � , y =         @} z  <result>  � , y =        "@} z  </Answer> � , y =        @} z  </XML>  � , 5 �
 < y = �  6 3 F
 < �  6 3 
z  FILE  y , z  CREATE  �  <  5  <           5 � �  6  < �  6 y - �5 �z  FILE  y - z  READWRITE �  <  <  < �         @ �  6  5          �  6  5 � - 5 � 5 � { = y =         @} z  <Answer>  � y =        @} z  <uid> � , y =         @} z  <taskid>  � , y =        "@} z  <comment> � , y =        @} z  <time>  � , y =         @} z  <result>  � , y =        "@} z  </Answer> � , y =        @} z  </XML>  � , 5 � < y = �  6 3 8 < �  6 3 �z  FILE  y - z  CREATE  �  <  5  <           5 � �  6  < �  6  5 �  6        �?   
        �?6  "        @6 + 5 "            	        �?6 5 �          	           )                      & z 	 New_Project_Class � . z    { /           0  0  . : 5 �z 	 New_Project_Class  0 � 3 z 	 New_Project_Class  3 �z 
 ButtonShowHelpLevel � 5 �    3 z{ / z  \ y / | z  Again        �?��0 c3 b       �?q          �?q                     �?q    
        �?6 5 �          
    sN%  �   �  	 ,  
 