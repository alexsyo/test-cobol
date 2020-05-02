       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. testcobol.
AUTHOR. Alexsyo.
DATE-WRITTEN.02/05/2020


ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT EnemyFile ASSIGN TO "enemies.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.


DATA DIVISION.
FILE SECTION.
FD EnemyFile.
01 Enemy.
       02 Name Pic X(10).
       02 Action PIC X(6).
       02 Attack PIC S99.
       02 Defence PIC S99.
       02 Health PIC S99.       

WORKING-STORAGE SECTION.
01 Player.
       02 Name PIC X(10).
       02 Action PIC X(6).
       02 Attack PIC S99 VALUE 3.
       02 Defence PIC S99 VALUE 2.
       02 Health PIC S99 VALUE 10.

01 EOF PIC X(1).


PROCEDURE DIVISION.
Main.
       DISPLAY "Enter your name: " WITH NO ADVANCING.
       ACCEPT Name OF Player.
       DISPLAY "Welcome " Name OF Player.

       OPEN INPUT EnemyFile.
           PERFORM UNTIL EOF = 'Y' OR Health OF Player <= 0
               Read EnemyFile Into Enemy
                   AT END MOVE 'Y' TO EOF
                   NOT AT END
                       PERFORM EnemyEncounter
               END-READ
           END-PERFORM
       CLOSE EnemyFile.
       STOP RUN.

EnemyEncounter.
       DISPLAY "You encounter a " Name OF Enemy.
       DISPLAY "Possible actions: attack, defend, rest".
       DISPLAY SPACE.
       PERFORM FOREVER
           PERFORM ExecuteAction
           IF Health OF Player <= 0 THEN
               DISPLAY "You Fainted"
               EXIT PERFORM
           ELSE IF Health OF Enemy <= 0 THEN
               DISPLAY Name OF Enemy " Fainted"
               EXIT PERFORM
       END-PERFORM.
       DISPLAY Space.


ExecuteAction.
       DISPLAY "What do you do? " WITH NO ADVANCING.
       Accept Action OF Player.
       DISPLAY SPACE.
       CALL 'EXECUTE_ACTION' USING Player, Enemy.
       CALL 'EXECUTE_ACTION' USING Enemy, Player.
       DISPLAY SPACE.

       Display Name OF Player " life is: " Health OF Player.
       Display Name OF Enemy " life is: " Health OF Enemy.
       DISPLAY SPACE.
       DISPLAY SPACE.
       DISPLAY SPACE.