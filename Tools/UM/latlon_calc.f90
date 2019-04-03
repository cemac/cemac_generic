CWuhu Feng, CEMAC, 3 April 2019
C Unified Model NXXX      
      PRINT *,'UM N number (which can be N48 -> N96 -> N144 -> N216)?'
      READ(*,*)N
      LON=2*N
      LAT=1.5*N
      PRINT *,'LON=',LON,'LATcan be +1',LAT,'resolution km',110*180./LAT
      END
