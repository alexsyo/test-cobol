       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. testcobol.
AUTHOR. Alexsyo.
DATE-WRITTEN.02/05/2020


ENVIRONMENT DIVISION.


DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 InputMessage PIC X(10).

01 Player.
       02 Name PIC X(10).
       02 Action PIC X(6).
       02 Attack PIC 99 VALUE 3.
       02 Defence PIC 99 VALUE 1.
       02 Health PIC 99 VALUE 10.

01 Goblin.
       02 Name Pic X(10) VALUE "Goblin".
       02 Action PIC X(6) VALUE "attack".
       02 Attack PIC 99 VALUE 3.
       02 Defence PIC 99 VALUE 1.
       02 Health PIC 99 VALUE 10.


PROCEDURE DIVISION.
Main.
       DISPLAY "Enter your name: " WITH NO ADVANCING.
       ACCEPT Name OF Player.
       DISPLAY "Welcome " Name OF Player.
       DISPLAY "You encounter a Goblin".
       DISPLAY "Possible actions: attack, defend, rest".
       DISPLAY SPACE.
       PERFORM UNTIL Health OF Player IS ZERO
           Perform ExecuteAction
       END-PERFORM
       DISPLAY "You Fainted".
       STOP RUN.

ExecuteAction.
       DISPLAY "What do you do? " WITH NO ADVANCING.
       Accept Action OF Player.
       DISPLAY SPACE.
       CALL 'EXECUTE_ACTION' USING Player, Goblin.
       CALL 'EXECUTE_ACTION' USING Goblin, Player.
       DISPLAY SPACE.

       Display Name OF Player " life is: " Health OF Player.
       Display Name OF Goblin " life is: " Health OF Goblin.
       DISPLAY SPACE.
       DISPLAY SPACE.
       DISPLAY SPACE.