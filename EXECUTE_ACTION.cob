       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. EXECUTE_ACTION.
DATA DIVISION.
LINKAGE SECTION.
01 LAction PIC X(10).
01 LAttacker.
       02 LName PIC X(10).
       02 LAction PIC X(6).
       02 LAttack PIC S99.
       02 LDefence PIC S99.
       02 LHealth PIC S99.

01 LDefender.
       02 LName PIC X(10).
       02 LAction PIC X(6).
       02 LAttack PIC S99.
       02 LDefence PIC S99.
       02 LHealth PIC S99.

PROCEDURE DIVISION USING LAttacker, LDefender.
DISPLAY LName OF LAttacker LAction OF LAttacker.

EVALUATE LAction OF LAttacker
       WHEN "attack"
           COMPUTE LHealth OF LDefender = LHealth OF LDefender - (LAttack OF LAttacker - LDefence OF LDefender)
           COMPUTE LDefence OF LAttacker = LDefence OF LAttacker - 1
           IF LDefence OF LAttacker < 0 THEN SET LDefence OF LAttacker TO ZERO
       WHEN "defend"
           COMPUTE LDefence OF LAttacker = LDefence OF LAttacker + 1
       WHEN "rest"
           COMPUTE LHealth OF LAttacker = LHealth OF LAttacker + 10
END-EVALUATE

EXIT PROGRAM.
