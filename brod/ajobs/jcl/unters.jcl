//BRODSCO  JOB (000),'SCOTT BROD',CLASS=A,MSGCLASS=D,                   00010000
//     MSGLEVEL=(1,1),NOTIFY=&SYSUID                                    00020000
//*.+....1....+....2....+....3....+....4....+....5....+....6....+....7..00030000
//UNTERSE EXEC PGM=TRSMAIN,PARM='UNPACK'
//SYSPRINT DD SYSOUT=*
//INFILE   DD DISP=SHR,DSN=SMPE.CAI.HOLDDATA.ALL.D051220.TRS
//OUTFILE DD DSN=SMPE.CAI.HOLDDATA.ALL.D051220,
//             UNIT=3390,SPACE=(CYL,(20,10),RLSE),VOL=SER=UV900A,
//             DISP=(NEW,CATLG,DELETE)