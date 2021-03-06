CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C   FFTPACK 5.0 
C
C   Authors:  Paul N. Swarztrauber and Richard A. Valent
C
C   $Id$
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      SUBROUTINE MSNTF1(LOT,JUMP,N,INC,X,WSAVE,DSUM,XH,WORK,IER)
      REAL       X(INC,*)       ,WSAVE(*)   ,XH(LOT,*)
      DOUBLE PRECISION           DSUM(*)
      IER = 0
      LJ = (LOT-1)*JUMP+1
      IF (N-2) 101,102,103
 102  SSQRT3 = 1./SQRT(3.)
      DO 112 M=1,LJ,JUMP
         XHOLD = SSQRT3*(X(M,1)+X(M,2))
         X(M,2) = SSQRT3*(X(M,1)-X(M,2))
         X(M,1) = XHOLD
  112 CONTINUE
  101  GO TO 200
  103 NP1 = N+1
      NS2 = N/2
      DO 104 K=1,NS2
         KC = NP1-K
         M1 = 0
         DO 114 M=1,LJ,JUMP
         M1 = M1 + 1
         T1 = X(M,K)-X(M,KC)
         T2 = WSAVE(K)*(X(M,K)+X(M,KC))
         XH(M1,K+1) = T1+T2
         XH(M1,KC+1) = T2-T1
  114    CONTINUE
  104 CONTINUE
      MODN = MOD(N,2)
      IF (MODN .EQ. 0) GO TO 124
      M1 = 0
      DO 123 M=1,LJ,JUMP
         M1 = M1 + 1
         XH(M1,NS2+2) = 4.*X(M,NS2+1)
  123 CONTINUE
  124 DO 127 M=1,LOT
         XH(M,1) = 0.
  127 CONTINUE 
      LNXH = LOT-1 + LOT*(NP1-1) + 1
      LNSV = NP1 + INT(LOG(REAL(NP1))/LOG(2.)) + 4
      LNWK = LOT*NP1
C
      CALL RFFTMF(LOT,1,NP1,LOT,XH,LNXH,WSAVE(NS2+1),LNSV,WORK,
     1            LNWK,IER1)     
      IF (IER1 .NE. 0) THEN
        IER = 20
        CALL XERFFT ('MSNTF1',-5)
        GO TO 200
      ENDIF
C
      IF(MOD(NP1,2) .NE. 0) GO TO 30
      DO 20 M=1,LOT
      XH(M,NP1) = XH(M,NP1)+XH(M,NP1)
   20 CONTINUE
   30 SFNP1 = 1./FLOAT(NP1)
      M1 = 0
      DO 125 M=1,LJ,JUMP
         M1 = M1+1
         X(M,1) = .5*XH(M1,1)
         DSUM(M1) = X(M,1)
  125 CONTINUE
      DO 105 I=3,N,2
         M1 = 0
         DO 115 M=1,LJ,JUMP
            M1 = M1+1
            X(M,I-1) = .5*XH(M1,I)
            DSUM(M1) = DSUM(M1)+.5*XH(M1,I-1)
            X(M,I) = DSUM(M1)
  115    CONTINUE
  105 CONTINUE
      IF (MODN .NE. 0) GO TO 200
      M1 = 0
      DO 116 M=1,LJ,JUMP
         M1 = M1+1
         X(M,N) = .5*XH(M1,N+1)
  116 CONTINUE
  200 CONTINUE
      RETURN
      END
