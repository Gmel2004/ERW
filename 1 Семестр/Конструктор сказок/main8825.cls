SB0  �)      main2 5  HSpace     HANDLE   
 classname1     STRING   
 classname2     STRING   
 classname3     STRING   
 classname4     STRING    init     FLOAT�   countk     FLOAT�   classparent     STRING�   count     FLOAT�   QMatr     FLOAT�   ret     FLOAT�   i     FLOAT�   iOk     FLOAT�   HObI     HANDLE�   classObI     STRING�   okI     FLOAT�   k     FLOAT�   jOk     FLOAT�   j     FLOAT�   HObJ     HANDLE�   classObJ     STRING�   okJ     FLOAT�   HLinkIJ     HANDLE�   countOk     FLOAT�   QMatrOut     FLOAT�   out     FLOAT�   temp     FLOAT�   okk     FLOAT�   ink     FLOAT�  	 HObSelect     HANDLE�  
 HObSelect_     HANDLE�   iSelect     FLOAT�   iSelect_     FLOAT�   msg     FLOAT�   xPos     FLOAT    yPos     FLOAT    HOb     HANDLE�   HLinkI     HANDLE�   HPen     HANDLE�   HLinkI_     HANDLE�   redraw     FLOAT�   pressedmassh     FLOAT    init2     FLOAT�   massh   1 FLOAT�   massh2     FLOAT�   width2     FLOAT�   height2     FLOAT�   massh3     FLOAT�   width3     FLOAT�   height3     FLOAT�   massh4     FLOAT�   width4     FLOAT�   height4     FLOAT�       ���������������������������������������������������������������������������������������������������������������������������������������������������������������̌���ό���������̌�����������Ȍ�̌������������������������������������������������������������������������������ό��������������ό���ό���������Ȍ��������������̌��������������̌����������̏�����������������������������������������������������������������̏������������������������������������������������������������������������������������������������ Q      E  2D  � ?                �      Y@      Y@      Y@      Y@          �    
 
  �M    
 
   >            z@      X@     @Q@      =@                   �S    
 
 ��i D     ��      �        Arial �� ��D �    � ����$      �     
 
 ��j       main2�1    
 
 ��k "     �        �      
 HANDLE HSpace
STRING classname1, classname2, classname3, classname4
if (~HSpace == #0); exit(); endif
if (~init == 0)
  countk := 4
  classparent := GetClassName('..')
  count := GetObjectCount(~classparent)
  QMatr := -62
  ret := MCreate(~QMatr, 0, ~count, 0, ~count, 1)
  i := 0
  iOk := 0
  while(~i < ~count)
    HObI := GetHObjectByNum(~classparent, ~i)
    classObI := GetClassName('..\#' + float(~HObI))
    okI := 0
    k := 1
    while(~k < ~countk + 1)
      if ((pos(~classObI, GetVarS('', 'classname' + ~k), 1) == 0) && (~classObI != ''))
        okI := 1
        k := ~countk + 1
      endif
      k := ~k + 1
    endwhile
    if (~okI == 1)
      iOk := ~iOk + 1
      ret := MPut(~QMatr, ~iOk, 0, float(~HObI), 1)
      //MEditor(~QMatr, 1)
      jOk := 0
      j := 0
      while(~j < ~count)
        HObJ := GetHObjectByNum(~classparent, ~j)
        classObJ := GetClassName('..\#' + float(~HObJ))
        okJ := 0
        k := 1
        while(~k < ~countk + 1)
          if ((pos(~classObJ, GetVarS('', 'classname' + ~k), 1) == 0) && (~classObJ != ''))
            okJ := 1
            k := ~countk + 1
          endif
          k := ~k + 1
        endwhile
        if (~okI == 1 && ~okJ == 1)
          jOk := ~jOk + 1
          ret := MPut(~QMatr, 0, ~jOk, float(~HObJ), 1)
          //MEditor(~QMatr, 1)
          HLinkIJ := GetLink(~classparent, ~HObI, ~HObJ)
          if (~HLinkIJ)
            ret := MPut(~QMatr, ~iOk, ~jOk, float(~HLinkIJ), 1)
            //MEditor(~QMatr, 1)
            //logmessage('#' + float(~HObI) + ' #' + float(~HObJ) + ' #' + float(~HLinkIJ) + ' ' + ~classObI + ' ' + ~classObJ)
          endif
        endif
        j := ~j + 1
      endwhile
    endif
    i := ~i + 1
  endwhile
  countOk := ~iOk
  //MEditor(~QMatr, 1)
  //
  // ������� ���������� Out - > In
  QMatrOut := -63
  ret := MCreate(~QMatrOut, 0, ~countOk, 0, ~countOk, 1)
  i := 0
  while(~i < ~countOk)
    HObI := HANDLE(MGet(~QMatr, 0, ~i + 1, 1))
    ret := MPut(~QMatrOut, ~i + 1, 0, float(~HObI), 1)
    ret := MPut(~QMatrOut, 0, ~i + 1, float(~HObI), 1)
    out := GetVarF('..\#' + float(~HObI), 'out')
    temp := -13254
    SetVar('..\#' + float(~HObI), 'out', ~temp)
    j := 0
    while(~j < ~countOk)
      if (~i != ~j)
        HObJ := HANDLE(MGet(~QMatr, 0, ~j + 1, 1))
        HLinkIJ := HANDLE(MGet(~QMatr, ~i + 1, ~j + 1, 1))
        if (~HLinkIJ)
          okk := 0
          k := 0
          while(~k < 11)
            if (~k == 0)
              ink := GetVarF('..\#' + float(~HObJ), 'in')
            else
              ink := GetVarF('..\#' + float(~HObJ), 'in' + ~k)
            endif
            if (~ink == ~temp)
              k := 11
              okk := 1
              //logmessage('' + float(~HObI) + ' ' + float(~HObJ) + ' ' + ~ink)
              ret := MPut(~QMatrOut, ~i + 1, ~j + 1, float(~HLinkIJ), 1)
            endif
            k := ~k + 1
          endwhile
        endif
      endif
      j := ~j + 1
    endwhile
    SetVar('..\#' + float(~HObI), 'out', ~out)
    i := ~i + 1
  endwhile
  //MEditor(~QMatrOut, 1)
  
  RegisterObject(~HSpace, #0, '', WM_ALLMOUSEMESSAGE, 256)
  
  HObSelect := #0; HObSelect_ := #0; iSelect := 0; iSelect_ := 0
  init := 1
endif
if (~msg)
  if (~msg == WM_MOUSEMOVE)
    HOb := GetObjectFromPoint2d(~HSpace, ~xPos, ~yPos)
    HObSelect := #0
    iSelect := 0
    i := 0
    while(~i < ~countOk)
      HObI := HANDLE(MGet(~QMatr, 0, ~i + 1, 1))
      if (~HObI == ~HOb)
        HObSelect := ~HObI
        iSelect := ~i + 1
        i := ~countOk
      endif
      i := ~i + 1
    endwhile
  endif
  msg := 0
endif
if (~HObSelect != ~HObSelect_)
  i := 0
  while(~i < ~countOk)
    HLinkI := HANDLE(MGet(~QMatr, ~iSelect, ~i + 1, 1))
    if ((~HLinkI != #0) && (~iSelect != 0))
      HPen := GetPenObject2d(~HSpace, ~HLinkI)
      ret := SetPenWidth2d(~HSpace, ~HPen, 3)
    endif
    HLinkI_ := HANDLE(MGet(~QMatr, ~iSelect_, ~i + 1, 1))
    if ((~HLinkI_ != #0) && (~iSelect_ != 0))
      HPen := GetPenObject2d(~HSpace, ~HLinkI_)
      ret := SetPenWidth2d(~HSpace, ~HPen, 1)
    endif
    i := ~i + 1
  endwhile
  HObSelect_ := ~HObSelect
  iSelect_ := ~iSelect
endif
redraw := GetVarF('\', 'redraw')
//redraw := ~redraw + 1
// ����������� ������
if (~redraw == 1)
  //logmessage('111')
  i := 0
  while(~i < ~countOk)
    HObI := HANDLE(MGet(~QMatrOut, ~i + 1, 0, 1))
    out := GetVarF('..\#' + float(~HObI), 'out')
    j := 0
    while(~j < ~countOk)
      HLinkIJ := HANDLE(MGet(~QMatrOut, ~i + 1, ~j + 1, 1))
      if (~HLinkIJ != #0)
        HPen := GetPenObject2d(~HSpace, ~HLinkIJ)
        if (~out == 0)
          ret := SetPenColor2d(~HSpace, ~HPen, rgb(192, 0, 0))
        else
          ret := SetPenColor2d(~HSpace, ~HPen, rgb(0, 192, 0))
        endif
      endif
      j := ~j + 1
    endwhile
    i := ~i + 1
  endwhile
  redraw := 0
endif
FLOAT pressedmassh
if (~init2 > 2)
  massh := 0.7
  massh2 := 0.7
  width2 := 259; height2 := 357
  massh3 := 0.7
  width3 := 408; height3 := 320
  massh4 := 0.7
  width4 := 388; height4 := 293
  //xWin2 := 1215 - ~width2; yWin2 := 855 - ~height2;
  if (~pressedmassh == 1)
    massh := 0.855
  else
    massh := 1
  endif
  init2 := 3
else
  init2 := ~init2 + 1
endif
     
 system.dbm           R 5 	              6 5 �       @  z  ..  �{  y  �         O@q  	  	                              �?<  
                           : 5 �y    �  z  ..\#     �{                    �?             �? : 5 � y  z    z  classname   �       �?�          6 y  z    � + 5 �        �?           �?            �?   3 |          �?6 5 �         �?    	                      �?@  
                           : 5 �y    �  z  ..\#     �{                    �?             �? : 5 xy  z    z  classname   �       �?�          6 y  z    � + 5 l       �?           �?            �?   3 )         �?6          �?6 + 5 �         �?    	                      �?@  
 y      _    o � 	               �?@  
          �?   3          �?   3 T           �O@q                                  �?<  
                : 5 ~ 	                   �?        �??               �?                    �?@  
                     �?           �?@  
 z  ..\#     z  out �        ��@q   z  ..\#     z  out   �               : 5 b    7 5 V 	                   �?        �??     	          �?          �?        �??      o V                               &@: 5 V           6 5 z  ..\#     z  in  �  3 z  ..\#     z  in    �      6 5 J       &@         �?             �?          �?           �?@  
          �?   3 �         �?   3 �z  ..\#     z  out   �         �?   3 
        z           �@       p@�                                             �?   ! 5 % !        �@6 5     "  # | $                                  : 5  	                   �?        �??       $ R 5              �?                �?   3 �          !     S 5 �               : 5 � 	            �?        �??   %  %      S            7 + 5 s    % 0 &     &        @A 
  	             �?        �??   '  '      S             7 + 5 �    ' 0 &     &        �?A 
          �?   3 3         z  \ z  redraw  � (  (        �?6 5 �               : 5 �           �?                 �??    z  ..\#     z  out �                 : 5 �           �?          �?        �??           S 5 ~     0 &            6 5 g    &        h@                  � > 
 3 ~    &                 h@         � > 
          �?   3          �?   3 �          (  *         @8 5  ffffff�? +  ffffff�? ,       0p@ -       Pv@ .  ffffff�? /       �y@ 0        t@ 1  ffffff�? 2       @x@ 3       Pr@ 4  )        �?6 5   \���(\�? + 3        �? +        @ * 3  *        �?  *    Ze-  �   �   5  
 