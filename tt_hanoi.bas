DIM SHARED stack(3, 4) AS INTEGER
DIM SHARED top(3) AS INTEGER
DIM SHARED piece(4) AS STRING
DIM SHARED openpiece AS INTEGER
DIM operation AS INTEGER
DIM SHARED moves AS INTEGER

piece(1) = " 1 "
piece(2) = "  2  "
piece(3) = "   3   "
piece(4) = "    4    "
openpiece = 0

FOR i = 1 TO 3
    FOR j = 1 TO 4
        stack(i, j) = 0
    NEXT j

    top(i) = 0
NEXT i

push 1, 4
push 1, 3
push 1, 2
push 1, 1
moves = 0

WHILE top(3) < 4
    drawstack

    operation = 0

    WHILE operation = 0
        LOCATE 12, 2
        IF openpiece = 0 THEN
            INPUT "Remove piece  "; selected
        ELSE
            INPUT "Place onto rod"; selected
        END IF

        operation = doable(selected)
    WEND
WEND

drawstack
LOCATE 12, 2
PRINT "Congratulations! You have solved the Tower of Hanoi!"

SUB push (stackno, value)
top(stackno) = top(stackno) + 1
stack(stackno, top(stackno)) = value
moves = moves + 1
openpiece = 0
END SUB

FUNCTION pop (stackno)
pop = stack(stackno, top(stackno))
stack(stackno, top(stackno)) = 0
top(stackno) = top(stackno) - 1
END FUNCTION

SUB drawpiece (pieceno)
COLOR 0, 0
FOR i = 1 TO (5 - pieceno)
    PRINT " ";
NEXT i

IF pieceno = 0 THEN
    COLOR 0, 6
    PRINT " ";
ELSE
    COLOR 0, pieceno
    PRINT piece(pieceno);
END IF

COLOR 0, 0
FOR i = 1 TO (5 - pieceno)
    PRINT " ";
NEXT i

COLOR 0, 0
PRINT " ";

COLOR 15, 0
END SUB

SUB drawbase (stackno)
COLOR 0, 6
FOR i = 1 TO 4
    PRINT " ";
NEXT

PRINT stackno;

FOR i = 1 TO 4
    PRINT " ";
NEXT

COLOR 0, 0
PRINT " ";

COLOR 15, 0
END SUB

SUB drawstack ()
FOR i = 1 TO 6
    LOCATE i + 1, 2

    FOR j = 1 TO 3
        IF i = 1 THEN
            drawpiece 0
        ELSE
            IF i = 6 THEN
                drawbase j
            ELSE
                drawpiece (stack(j, 6 - i))
            END IF
        END IF
    NEXT j
NEXT i

COLOR 15, 0
LOCATE 9, 2
PRINT "Open ";
IF openpiece = 0 THEN
    PRINT "(none)         ";
ELSE
    drawpiece openpiece
END IF
LOCATE 10, 2
PRINT "Moves ";
PRINT moves;
END SUB

FUNCTION doable (userinput)
doable = 0
IF openpiece = 0 THEN
    FOR i = 1 TO 3
        IF top(i) > 0 THEN
            IF stack(i, top(i)) = userinput THEN
                doable = 1
                openpiece = pop(i)
            END IF
        END IF
    NEXT
ELSE
    IF userinput >= 1 AND userinput <= 3 THEN
        IF stack(userinput, top(userinput)) > openpiece OR top(userinput) = 0 THEN
            doable = 1
            push userinput, openpiece
        END IF
    END IF
END IF
END FUNCTION

