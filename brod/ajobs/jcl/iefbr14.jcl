//BRODSCO  JOB (000),'SCOTT BROD',CLASS=A,MSGCLASS=D,                   00010000
//     MSGLEVEL=(1,1),NOTIFY=&SYSUID                                    00020000
//*.+....1....+....2....+....3....+....4....+....5....+....6....+....7..00030000
//JS010    EXEC PGM=IEFBR14                                             00040000
//TEST  DD DISP=SHR,DSN=BROD.AJOBS.JCL                                      0005
//
