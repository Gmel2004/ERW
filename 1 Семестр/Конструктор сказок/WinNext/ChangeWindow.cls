SB0  z)      ChangeWindow ;  HWnd     HANDLE�   WinName     STRING   	 ImageName     STRING   
 ImageName_     STRING�   replace     FLOAT�   control     FLOAT    init     FLOAT�   ret     FLOAT�   i     FLOAT�   dx     FLOAT�   dy     FLOAT�   heiWin     FLOAT�   widWin     FLOAT�   heiWin_     FLOAT�   widWin_     FLOAT�  	 heiClient     FLOAT�  	 widClient     FLOAT�  
 heiClient_     FLOAT�  
 widClient_     FLOAT�  	 widBorder     FLOAT�  	 heiBorder     FLOAT�   xWin     FLOAT    yWin     FLOAT    xWin_     FLOAT�   yWin_     FLOAT�   xSpace     FLOAT�   ySpace     FLOAT�   xSpace_     FLOAT�   ySpace_     FLOAT�   Transparent   100 FLOAT    Transparent_     FLOAT�  	 SetRegion     FLOAT    IsSmallCaptionShow     FLOAT    IsCaptionShow     FLOAT    UpdateRegion     FLOAT�   RegionObjectName     STRING    HRegionObject     HANDLE�  	 HMasPoint     HANDLE�  
 SetRegion_     FLOAT�   IsSmallCaptionShow_     FLOAT�   IsCaptionShow_     FLOAT�   RegionObjectName_     STRING�   showWin     FLOAT    showWin_     FLOAT�   toTopWin     FLOAT�   minHor     FLOAT    maxHor     FLOAT    minHor_     FLOAT�   maxHor_     FLOAT�   minVer     FLOAT    maxVer     FLOAT    minVer_     FLOAT�   maxVer_     FLOAT�  	 FrameName     STRING   
 FrameName_     STRING�  	 WSHSCROLL     FLOAT   	 WSVSCROLL     FLOAT    massh     FLOAT    massh_     FLOAT�       ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ݟ��������������ݟ��������������ݟ��������������ݘ��������������ݘ��������������ݘ��������������٘��������������ٟ�����ٟ�������ٟ��������������ݟ���ٙ��������������������������������������������������������������������������������������������������������������� �      �  2D  � �                        Y@      Y@      Y@      Y@        _�    
 
  �M    
 
   >     �                      a@      5@                   ��    
 
 ��i D     ��      �        Arial �� ��h��    �� x�\ �      i D     ��      �        Arial CYR ��h��    �� l^ �      �3    
 
 ��j       Changej       Window�=    
 
 ��k .     �$      �        �        
 �HANDLE HWnd
STRING WinName
STRING ImageName
STRING local ImageName_
FLOAT replace
FLOAT control
FLOAT local init
FLOAT local ret, i, dx, dy
FLOAT heiWin, widWin
FLOAT local heiWin_, widWin_
FLOAT heiClient, widClient
FLOAT local heiClient_, widClient_
FLOAT widBorder, heiBorder
FLOAT xWin, yWin
FLOAT local xWin_, yWin_
FLOAT xSpace, ySpace
FLOAT local xSpace_, ySpace_
FLOAT Transparent
FLOAT local Transparent_
FLOAT SetRegion, IsSmallCaptionShow, IsCaptionShow, UpdateRegion
STRING RegionObjectName
HANDLE local HRegionObject, HMasPoint
FLOAT local SetRegion_, IsSmallCaptionShow_, IsCaptionShow_
STRING local RegionObjectName_
FLOAT showWin
FLOAT local showWin_
FLOAT toTopWin
FLOAT minHor, maxHor
FLOAT local minHor_, maxHor_
FLOAT minVer, maxVer
FLOAT local minVer_, maxVer_
STRING FrameName
STRING local FrameName_
FLOAT WSHSCROLL, WSVSCROLL
FLOAT massh
FLOAT local massh_

if (~HWnd == #0); exit(); endif
if (~init == 0)
  heiWin_ := ~heiWin - 1; widWin_ := ~widWin - 1
  xWin_ := ~xWin - 1; yWin_ := ~yWin - 1
  xSpace_ := ~xSpace - 1; ySpace_ := ~ySpace - 1
  Transparent_ := ~Transparent - 1
  SetRegion_ := ~SetRegion - 1; IsSmallCaptionShow_ := ~IsSmallCaptionShow - 1; IsCaptionShow_ := ~IsCaptionShow - 1
  RegionObjectName_ := '!' + ~RegionObjectName
  showWin_ := ~showWin - 1
  minHor_ := ~minHor - 1; maxHor_ := ~maxHor - 1
  minVer_ := ~minVer - 1; maxVer_ := ~maxVer - 1
  FrameName_ := '!' + ~FrameName
  ImageName_ := ~ImageName
  massh_ := ~massh
  init := 1
endif
if (~replace == 1)
  xWin_ := ~xWin - 1
  replace := 0
endif
if (~heiWin != ~heiWin_ || ~widWin != ~widWin_)
  ret := SetWindowSize(~WinName, ~widWin, ~heiWin)
  heiClient := GetClientHeight(~WinName); heiClient_ := ~heiClient
  widClient := GetClientWidth(~WinName); widClient_ := ~WidClient
  widBorder := Abs(~widWin - ~widClient); heiBorder := Abs(~heiWin - ~heiClient)
  heiWin_ := ~heiWin
  widWin_ := ~widWin
  minVer_ := ~minVer - 1
  minHor_ := ~minHor - 1
endif
/*
if (~heiClient != ~heiClient_ || ~widClient != ~widClient_)
  ret := SetClientSize(~WinName, ~widClient, ~heiClient) // ��� ������ �������� ��� SetWindowSize   ERRRRRORR
  //heiWin := GetWindowHeight(~WinName); heiWin_ := ~heiWin
  //widWin := GetWindowWidth(~WinName); widWin_ := ~WidWin
  widBorder := Abs(~widWin - ~widClient); heiBorder := Abs(~heiWin - ~heiClient)
  heiClient_ := ~heiClient
  widClient_ := ~widClient
  minVer_ := ~minVer - 1
  minHor_ := ~minHor - 1
endif
*/
if (~FrameName != ~FrameName_)
  if (GetObject2dByName(~HWnd, #0, ~FrameName) != #0 && ~FrameName != '')
    xSpace := GetObjectOrg2dX(~HWnd, GetObject2dByName(~HWnd, #0, ~FrameName))
    ySpace := GetObjectOrg2dY(~HWnd, GetObject2dByName(~HWnd, #0, ~FrameName))
    widWin := GetObjectWidth2d(~HWnd, GetObject2dByName(~HWnd, #0, ~FrameName))
    heiWin := GetObjectHeight2d(~HWnd, GetObject2dByName(~HWnd, #0, ~FrameName))
  endif
  FrameName_ := ~FrameName
endif

if (~xWin != ~xWin_ || ~yWin != ~yWin_)
  ret := SetWindowOrg(~WinName, ~xWin, ~yWin)
  xWin_ := ~xWin
  yWin_ := ~yWin
endif

if (~xSpace != ~xSpace_ || ~ySpace != ~ySpace_)
  //ret := SetSpaceOrg2d(~HWnd, ~xSpace, ~ySpace)
  ret := SetSpaceOrg2d(~HWnd, ~xSpace * ~massh, ~ySpace * ~massh)
  xSpace_ := ~xSpace
  ySpace_ := ~ySpace
  minVer_ := ~minVer - 1
  minHor_ := ~minHor - 1
endif
if (~Transparent != ~Transparent_)
  ret := SetWindowTransparent(~WinName, ~Transparent)
  Transparent_ := ~Transparent
endif
if (~SetRegion != ~SetRegion_ || ~IsSmallCaptionShow != ~IsSmallCaptionShow_ || ~IsCaptionShow != ~IsCaptionShow_ || ~RegionObjectName != ~RegionObjectName_ || ~UpdateRegion == 1)
  HRegionObject := GetObject2dByName(~HWnd, #0, ~RegionObjectName)
  if (~HMasPoint != #0); Delete(~HMasPoint); endif
  HMasPoint := #0
  if (~SetRegion != 0)
    if (~HRegionObject != #0)
      dx := -GetSpaceOrg2dx(~HWnd) + GetSizeFrameWidth() - 1
      dy := -GetSpaceOrg2dy(~HWnd) + GetSizeFrameWidth() - 1
      if(~IsSmallCaptionShow)
        dy := ~dy + GetSmallTitleHeight()
      else
        if (~IsCaptionShow)
          dy := ~dy + GetTitleHeight()
        endif
      endif
      HMasPoint := new()
      i := 0
      while(~i < GetVectorNumPoints2d(~HWnd, ~HRegionObject))
        ret := vInsert(~HMasPoint, 'FLOAT')
        vSet(~HMasPoint, vGetCount(~HMasPoint) - 1, 'FLOAT', GetVectorPoint2dx(~HWnd, ~HRegionObject, ~i) + ~dx)
        ret := vInsert(~HMasPoint, 'FLOAT'); 
        vSet(~HMasPoint, vGetCount(~HMasPoint) - 1, 'FLOAT', GetVectorPoint2dy(~HWnd, ~HRegionObject, ~i) + ~dy)
        i := ~i + 1
      endwhile
    endif
  endif
  ret := SetWindowRegion(~HWnd, ~HMasPoint)
  UpdateRegion := 0
  SetRegion_ := ~SetRegion
  IsSmallCaptionShow_ := ~IsSmallCaptionShow
  IsCaptionShow_ := ~IsCaptionShow
  RegionObjectName_ := ~RegionObjectName
endif
if (~showWin != ~showWin_)
  if (~showWin == 0); ret := ShowWindow(~WinName, SW_HIDE);
  else ret := ShowWindow(~WinName, SW_SHOW); endif
  showWin_ := ~showWin
endif
if (~toTopWin == 1)
  ret := BringWindowToTop(~WinName)
  toTopWin := 0
endif
if (~WSHSCROLL != 0 && (~minHor != ~minHor_ || ~maxHor != ~maxHor_))
  ret := SetScrollRange(~WinName, 1, ~minHor, ~maxHor)
  minHor_ := ~minHor
  maxHor_ := ~maxHor
endif
if (~WSVSCROLL != 0 && (~minVer != ~minVer_ || ~maxVer != ~maxVer_))
  ret := SetScrollRange(~WinName, 0, ~minVer, ~maxVer)
  minVer_ := ~minVer
  maxVer_ := ~maxVer
endif
if (~ImageName != ~ImageName_)
  ret := ShowWindow(~WinName, SW_HIDE)
  ret := CloseWindow(~WinName)
  HWnd := #0
  SendMessage('', 'CreateWindow')
  init := 0
  ImageName_ := ~ImageName
endif
if (~massh != ~massh_)
  ret := SetScaleSpace2d(~HWnd, ~massh)
  ret := SetSpaceOrg2d(~HWnd, ~xSpace * ~massh, ~ySpace * ~massh)
  //ret := SetWindowSize(~WinName, ~widWin * ~massh, ~heiWin * ~massh)
  massh_ := ~massh
endif
if (~control == 1)
  xSpace := GetSpaceOrg2dX(~HWnd)
  ySpace := GetSpaceOrg2dY(~HWnd)
endif     
 system.dbm �          R 5 	              6 5 �          �?            �?            �?            �?            �?            �?            �?            �?  &           �?  '  !        �?  ( z  ! y # | { )  *        �?  +  -        �?  /  .        �?  0  1        �?  3  2        �?  4 z  ! y 5 | { 6 y  {   9  :        �?           �?6 5 �          �?                  7     7 , 5 7y      �   y  �       y  �            .        .            1        �?  3  -        �?  / y 5 y 6 � 5 �        y 5 �      S y 5 z    � + 5 �           y 5 � D             y 5 � E             y 5 � H             y 5 � I  y 5 { 6     7     7 , 5 �y      �               7     7 , 5 �      9     9  W           1        �?  3  -        �?  /     7 5 �y             & 7     ' 7 ,  !  ( 7 , y # y ) � ,  "        �?6 , 5 �        y # �  $  %      S 5 * % �      %            7 5 � $      S 5 �   Vq         �?  	    Uq         �?  
    5 i 
   
 3 s ! 5 s 
   
 � %                  $ 2: 5 � % z  FLOAT �   %  % �       �? z  FLOAT     $   3 	  � % z  FLOAT �   %  % �       �? z  FLOAT     $   4 
  �         �?   3 }    %             "    &     '  !  ( y # { )  *  + 7 5 & *          6 5 y           �   3 "y         @�    *  +  ,        �?6 5 <y  �             ,  7          7  -  / 7  .  0 7 , + 5 hy         �? -  . �    -  /  .  0  8          7  1  3 7  2  4 7 , + 5 �y            1  2 �    1  3  2  4 y  y  � 5 �y           �   y  �           z    z  CreateWindow  X             y  {   9  : 7 5 �    9 X        9     9  W   9  :          �?6 5 �   V     U     �S�&  �   �   �	  
 