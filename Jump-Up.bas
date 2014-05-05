'<Jump-up. A fun game written in GW-BASIC>
'Copyright (C) <2014>  <Navin Ipe>
'Contact: navinipe at gmail dot com

'This program is free software: you can redistribute it and/or modify
'it under the terms of the GNU General Public License as published by
'the Free Software Foundation, either version 3 of the License, or
'(at your option) any later version.

'This program is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.

'You should have received a copy of the GNU General Public License
'along with this program.  If not, see <http://www.gnu.org/licenses/>.

10 KEY OFF: SCREEN 2: SCREEN 0, 0, 0: COLOR 6, 1: CLS : COLOR 14
20 LOCATE 15, 25: INPUT "Enter your name "; NAM$
30 LOCATE 17, 25: PRINT "Playing in Level [1/2] : ": LEVEL$ = INPUT$(1)
40 LEVEL = VAL(LEVEL$): CLS
50 IF LEVEL = 1 THEN LEV = 40 ELSE LEVEL = 2: LEV = 25
60 PRINT : PRINT " J U M P - U P"
70 PRINT STRING$(80, CHR$(205))
80 PRINT TAB(56); "Copyright (C) Navin.K.Ipe"
90 PRINT : PRINT "  A Preface": PRINT STRING$(60, CHR$(196)): PRINT
100 PRINT "  In this game you will have to"
110 PRINT "    jump  when a bomb, is  rolled"
120 PRINT "      toward you.If it is a diamond"
130 PRINT "        that is rolled toward you,you"
140 PRINT "          will simply  have to  stay in"
150 PRINT "            your place to score your point"
160 PRINT "              press the [ "; CHR$(24); " ] key to jump up."
170 PRINT "                A time limit will end the game."
180 PRINT "                  You have three lives.A life is"
190 PRINT "                    used up when, you hit a bomb ."
200 PRINT : PRINT STRING$(60, CHR$(196))
210 PRINT : PRINT "     "; CHR$(174); " Press any key "; CHR$(175)
220 X$ = INPUT$(1)
230 CLS : LOCATE 10, 30: PRINT "BOMB - "; CHR$(236)
240 LOCATE 12, 30: PRINT "DIAMOND - "; CHR$(4)
250 LOCATE 14, 40: PRINT "_"; CHR$(1); "_"
260 LOCATE 15, 30: PRINT "YOURSELF - "; "I"
270 LOCATE 16, 40: PRINT "/ \"
280 LOCATE 18, 25: PRINT CHR$(174); " Press any key "; CHR$(175)
290 X$ = INPUT$(1)
300 SCREEN 2: SCREEN 0, 0, 0
310 '-------DRAWING ONE LINED BOX
320 COLOR 12: R = 11: C = 30: R2 = 13: C2 = 50: L = C2 - C
330 L = C2 - C: T = 50: LIFE = 4
340 LOCATE R, C: PRINT CHR$(218); STRING$(L, CHR$(196))
350 LOCATE R, C2: PRINT CHR$(191)
360 LOCATE R2, C: PRINT CHR$(192); STRING$(L, CHR$(196))
370 LOCATE R2, C2: PRINT CHR$(217)
380 LOCATE R + 1, C: PRINT CHR$(179): LOCATE R + 1, C2: PRINT CHR$(179)
390 LOCATE R2 - 1, C: PRINT CHR$(179): LOCATE R2 - 1, C2: PRINT CHR$(179)
400 TI = TIMER + .25: WHILE TI > TIMER: WEND
410 LOCATE R, C: PRINT " "; STRING$(L, " ")
420 LOCATE R, C2: PRINT " "
430 LOCATE R2, C: PRINT " "; STRING$(L, " ")
440 LOCATE R2, C2: PRINT " "
450 LOCATE R + 1, C: PRINT " ": LOCATE R + 1, C2: PRINT " "
460 LOCATE R2 - 1, C: PRINT " ": LOCATE R2 - 1, C2: PRINT " "
470 IF C2 = 55 THEN 500 ELSE 480
480 C = C - 1: C2 = C2 + 1: R = R - 1: R2 = R2 + 1: GOTO 330
490 '-------DRAWING DOUBLE LINED BOX
500 LOCATE 6, 19: PRINT CHR$(201); STRING$(43, CHR$(205)); CHR$(187)
510 LOCATE 18, 19: PRINT CHR$(200); STRING$(43, CHR$(205)); CHR$(188): R = 7
520 LOCATE R, 19: PRINT CHR$(186): LOCATE R, 63: PRINT CHR$(186)
530 IF R = 17 THEN 550 ELSE R = R + 1: GOTO 520
540 '-------PRINTING INFO
550 COLOR 10: LOCATE 3, 19: PRINT "TIME LEFT - "; T
560 COLOR 11: LOCATE 4, 19: PRINT "SCORE     - "; SCR
570 COLOR 13: LOCATE 20, 50: PRINT "LEVEL  - "; LEVEL
580 COLOR 14: LOCATE 21, 50: PRINT "PLAYER - "; NAM$
590 '-------THREE LIFE MEN PRINTED
600 TNA = 20: TNB = 21
610 LOCATE 15, TNA: PRINT "_"; CHR$(1); "_": LOCATE 16, TNB: PRINT "I": LOCATE 17, TNA: PRINT "/ \"
620 IF TNA > 25 THEN 630 ELSE TNA = TNA + 4: TNB = TNB + 4: GOTO 610
630 COLOR 10: LOCATE 13, 20: PRINT STRING$(43, CHR$(176))
635 COLOR 18: LOCATE 22, 10: PRINT "[ Press ENTER to start ]": COLOR 12
640 WHILE INKEY$ <> CHR$(13)
650 LOCATE 10, 35: PRINT "_"; CHR$(1); "_": LOCATE 11, 36: PRINT ""; CHR$(179); "": LOCATE 12, 35: PRINT "/ \": TI = TIMER + .25: WHILE TI > TIMER: WEND
660 LOCATE 10, 35: PRINT "_"; CHR$(1); "_": LOCATE 11, 36: PRINT ""; CHR$(179); "": LOCATE 12, 35: PRINT " "; CHR$(186); " "
670  TI = TIMER + .25: WHILE TI > TIMER: WEND: LOCATE 12, 35: PRINT "   "
680 WEND: LOCATE 12, 36: PRINT CHR$(186): COLOR 18: LOCATE 22, 10: PRINT STRING$(24, " ")
690 '---------------------------GAME START-----------------------------------
700 '---------RANDOM NUMBER
710 RANDOMIZE TIMER
720 R = INT(RND * 2 + 1)
730 IF R = 1 THEN B$ = CHR$(4) ELSE B$ = CHR$(236)
740 T = T - 1: LOCATE 3, 19: PRINT "TIME LEFT - "; T
750 '--------PRINTING B$ TILL MAN
760 C = 62: COLOR 9: COLOR 12
770 LOCATE 12, C: PRINT B$: TI = TIMER + .001: WHILE TI > TIMER: WEND
780 IF C = 36 THEN LOCATE 12, 37: PRINT "\": GOTO 800 ELSE FOR I = 1 TO LEV: NEXT I: GOTO 790
790 LOCATE 12, C: PRINT " ": C = C - 1: GOTO 770
800 '-------CHECK IF MAN JUMPED OR ESC IS PRESSED
810 X$ = INKEY$: IF X$ = CHR$(27) THEN GOTO 1090
820 IF T = 0 THEN 1080
830 IF X$ = CHR$(0) + CHR$(72) THEN 840 ELSE 850
840 IF B$ = CHR$(236) THEN GOTO 960 ELSE 960
850 IF B$ = CHR$(236) THEN 870 ELSE 860
860 FOR I = 200 TO 1100 STEP 10: SOUND I, .1: NEXT: SCR = SCR + 10: LOCATE 4, 32: PRINT SCR: GOTO 960
870 '-------ONE LIFE LESS
880 FOR I = 100 TO 200: SOUND 100, .1: NEXT: LIFE = LIFE - 1: LOCATE 12, 36: PRINT " "
890 IF LIFE = 3 THEN LOCATE 15, 28: PRINT "   " ELSE 910
900 LOCATE 16, 29: PRINT " ": LOCATE 17, 28: PRINT "   "
910 IF LIFE = 2 THEN LOCATE 15, 24: PRINT "   " ELSE 930
920 LOCATE 16, 25: PRINT " ": LOCATE 17, 24: PRINT "   "
930 IF LIFE = 1 THEN LOCATE 15, 20: PRINT "   " ELSE 950
940 LOCATE 16, 21: PRINT " ": LOCATE 17, 20: PRINT "   "
950 IF LIFE = 0 THEN GOTO 1090 ELSE 700
960 '-------CONTINUE
970 COLOR 12: LOCATE 10, 35: PRINT "_"; CHR$(1); "_"
980 IF X$ = CHR$(0) + CHR$(72) THEN 990 ELSE 1030
990 FOR I = 100 TO 2500 STEP 300: SOUND I, .2: NEXT I
1000 LOCATE 12, 35: PRINT "   ": LOCATE 10, 34: PRINT CHR$(196) + CHR$(196); "I"; CHR$(196) + CHR$(196): LOCATE 9, 35: PRINT "_"; CHR$(1); "_": LOCATE 11, 36: PRINT " "
1010  TI = TIMER + .25: WHILE TI > TIMER: WEND: LOCATE 9, 35: PRINT "     ": LOCATE 11, 36: PRINT "I": LOCATE 12, 35: PRINT "/ \": LOCATE 10, 35: PRINT "_"; CHR$(1); "_": LOCATE 10, 34: PRINT "     "
1020 LOCATE 10, 35: PRINT "_"; CHR$(1); "_"
1030 C = 34: LOCATE 12, 36: PRINT " "
1040 LOCATE 12, C: PRINT B$: FOR I = 1 TO LEV: NEXT I
1050 IF C = 34 THEN LOCATE 12, 35: PRINT "/"
1060 IF C = 20 THEN : LOCATE 12, 20: PRINT " ": GOTO 700 ELSE LOCATE 12, C: PRINT " "
1070 C = C - 1: GOTO 1040
1080 '---------ENDING THE GAME
1090 COLOR 10: LOCATE 14, 30: PRINT "------- GAMEOVER -------"
1100 LOCATE 15, 30: PRINT "------- GAMEOVER -------"
1110 LOCATE 16, 30: PRINT "------- GAMEOVER -------"
1120  TI = TIMER + .25: WHILE TI > TIMER: WEND
1130 FOR I = 200 TO 100 STEP -1: SOUND I, .1: NEXT I
1140 LOCATE 23, 1: X$ = INPUT$(1): SYSTEM

