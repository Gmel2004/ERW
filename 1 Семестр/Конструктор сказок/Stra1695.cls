SB0  r      ControlW   HSpace     HANDLE   
 HSpaceMain     HANDLE    xWin     FLOAT�   yWin     FLOAT�   xPosMain     FLOAT    yPosMain     FLOAT    xWin0     FLOAT�   yWin0     FLOAT�  	 xPosMain0     FLOAT   	 yPosMain0     FLOAT    init     FLOAT�   msg     FLOAT�   flag     FLOAT�   ret     FLOAT�  
 �HANDLE HSpace, HSpaceMain
FLOAT xWin, yWin, xPosMain, yPosMain
FLOAT xWin0, yWin0, xPosMain0, yPosMain0
if ((~HSpace == #0) || (~HSpaceMain == #0)); exit(); endif
if (~init == 0)
  RegisterObject(~HSpace, #0, '', WM_ALLMOUSEMESSAGE, 256)
  //RegisterObject(~HSpace, ~HSpace, '', WM_CONTROLNOTIFY, 256)
  init := 1
endif
if (~msg != 0)
  //logmessage('dadadd')
  if (~msg == WM_LBUTTONDOWN)
    flag := 1
    xWin0 := ~xWin; yWin0 := ~yWin
    ret := GetMousePos(GetWindowName(~HSpaceMain), ~xPosMain0, ~yPosMain0)
    SetCapture(~HSpace, "", 0)
  endif
  if (~msg == WM_MOUSEMOVE)
    if (~flag == 1)
      ret := GetMousePos(GetWindowName(~HSpaceMain), ~xPosMain, ~yPosMain)
      xWin := ~xWin0 + (~xPosMain - ~xPosMain0)
      yWin := ~yWin0 + (~yPosMain - ~yPosMain0)
    endif
  endif
  if (~msg == WM_LBUTTONUP)
    ReleaseCapture()
    flag := 0
  endif
  msg := 0
endif 
 system.dbm �           R        R , 5     
          6 5 4         z           �@       p@�        �? 
            7 5 �         �@6 5 l        �?            � � �	 �      z             �          �@6 5 �          �?6 5 �   � � � �                  	             �@6 5 � �                          k�]-  X  
 