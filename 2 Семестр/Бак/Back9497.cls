SB0  u      Back   h     FLOAT�   hmax     FLOAT    k     FLOAT    err     FLOAT�   t     FLOAT    u1     FLOAT�   u2     FLOAT�   k2     FLOAT    kran     FLOAT�   sliv     FLOAT�   voz     FLOAT�   k3     FLOAT    u3     FLOAT�   b     FLOAT�  
 �//Reg

//P
if (h != hmax && k != 0)//k - �����������
  err := hmax - h//����������
  u1:=err * k * t//���������
endif
if (k == 0)
  u1 := 0
endif
//I
u2 := u2+u1* k2 * t
if (k2 == 0)
  u2 := 0
endif
//D
u3 := ((kran - sliv - voz)* t + u1 + u2) * k3

//BASE
h := h + (kran - sliv - voz)* t + u1 + u2 + u3
b := 0
if (h < 0)
  sliv := 0
  voz := 0
endif
if (h >= hmax)
  kran :=0
endif
if (h >= 100)
    b:=1
endif 
 system.dbm �        7            7 + 5 !                              6 5 2                                    6 5 P               	   
                      	   
                                         : 5 �           	           
      9 5 �                      Y@9 5 �        �?     ��6     
 