
.MODEL SMALL
.STACK 100h

.DATA

banner1 db "================================================================$"
banner2 db 0Dh,0Ah,"   _______ _____ ______ _____ _  _   __                     $"
banner3 db 0Dh,0Ah,"  / ____/ / ___// ____/|__  /| || | /_|                     $"
banner4 db 0Dh,0Ah," / /    \\__ \\ / __/    /_ < | || |_ |                     $"
banner5 db 0Dh,0Ah,"/ /___ ___/ // /___   ___/ /|__   _|| |                     $"
banner6 db 0Dh,0Ah,"\\____//____//_____/  /____/   |_|  |_|                     $"
banner7 db 0Dh,0Ah,"                  M a t h Q u i z   ( P v P )               $"
banner8 db 0Dh,0Ah,"================================================================$"
banner9 db 0Dh,0Ah,0Dh,0Ah,"        /\             .---.            +-----+        $"
banner10 db 0Dh,0Ah,"       /  \           |     |           |     |        $"
banner11 db 0Dh,0Ah,"      / 1  \          | VS  |           |  2  |        $"
banner12 db 0Dh,0Ah,"     /______\         |     |           |     |        $"
banner13 db 0Dh,0Ah,"                      '-----'           +-----+        $"
banner14 db 0Dh,0Ah,"                                                       $"
banner15 db 0Dh,0Ah,"      ? PLAYER 1      VS      PLAYER 2 |              $"
banner16 db 0Dh,0Ah,"       TRIANGLE                SQUARE                  $"
banner17 db 0Dh,0Ah,"                                                       $"
banner18 db 0Dh,0Ah,"================================================================$"
banner19 db 0Dh,0Ah,"================================================================$"

askN    db 0Dh,0Ah,0Dh,0Ah,"  >> Enter number of questions per player: $"
diffmsg db 0Dh,0Ah,0Dh,0Ah,"  +-------------------------------------------------------+$"
diffmsg2 db 0Dh,0Ah,"  |                  DIFFICULTY LEVEL                     |$"
diffmsg3 db 0Dh,0Ah,"  |-------------------------------------------------------|$"
diffmsg4 db 0Dh,0Ah,"  |  1 - EASY    (Small numbers, simple operations)       |$"
diffmsg5 db 0Dh,0Ah,"  |  2 - MEDIUM  (Moderate challenge)                     |$"
diffmsg6 db 0Dh,0Ah,"  |  3 - HARD    (Large numbers, complex operations)      |$"
diffmsg7 db 0Dh,0Ah,"  +-------------------------------------------------------+$"
diffmsg8 db 0Dh,0Ah,"  >> Select Difficulty (1-Easy, 2-Medium, 3-Hard): $"

opmsg1  db 0Dh,0Ah,0Dh,0Ah,"  +-------------------------------------------------------+$"
opmsg1b db 0Dh,0Ah,"  |                  MATH OPERATIONS                      |$"
opmsg1c db 0Dh,0Ah,"  |-------------------------------------------------------|$"
opmsg1d db 0Dh,0Ah,"  |  1 - Addition         (+)    5 - Powers        (^)    |$"
opmsg1e db 0Dh,0Ah,"  |  2 - Subtraction      (-)    6 - Square Roots  (v)    |$"
opmsg1f db 0Dh,0Ah,"  |  3 - Multiplication   (*)    7 - Factorials    (!)    |$"
opmsg1g db 0Dh,0Ah,"  |  4 - Division         (/)                             |$"
opmsg1h db 0Dh,0Ah,"  +-------------------------------------------------------+$"
opmsg2  db 0Dh,0Ah,"  >> Enter operation numbers (e.g., 123 for Add+Sub+Mul): $"

qhead   db 0Dh,0Ah,0Dh,0Ah,"  +-----------------------------------------------------+$"
qhead2  db 0Dh,0Ah,"  |    QUESTION #$"
p1turn  db "                                      |$"
p1turn2 db 0Dh,0Ah,"  |    ? PLAYER 1 TURN ?                                |$"
p1turn3 db 0Dh,0Ah,"  +-----------------------------------------------------+$"
p1turn4 db 0Dh,0Ah,"      /\  $"
p1turn5 db 0Dh,0Ah,"     /  \ $"
p1turn6 db 0Dh,0Ah,"    /____\ $"

p2turn  db "                                      |$"
p2turn2 db 0Dh,0Ah,"  |    | PLAYER 2 TURN |                                |$"
p2turn3 db 0Dh,0Ah,"  +-----------------------------------------------------+$"
p2turn4 db 0Dh,0Ah,"    +-----+ $"
p2turn5 db 0Dh,0Ah,"    |     | $"
p2turn6 db 0Dh,0Ah,"    +-----+ $"

eqsign  db " = $"
plus    db " + $"
minus   db " - $"
times   db " * $"
divide  db " / $"
powc    db " ^ $"
sqrt1   db " v($"
sqrt2   db ") = $"
factc   db "! = $"

okmsg   db 0Dh,0Ah,"    ? CORRECT!  ?? Time: $"
badmsg  db 0Dh,0Ah,"    ? WRONG!    ? Correct Answer: $"
suf_s   db " seconds)$"

hr      db 0Dh,0Ah,0Dh,0Ah,"  ------------------------------------------------------------$"
hr2     db 0Dh,0Ah,"                         ?? FINAL RESULTS ??                    $"
hr3     db 0Dh,0Ah,"  ------------------------------------------------------------$"
final1  db 0Dh,0Ah,"                            ?? SCORE SUMMARY                   $"
p1score db 0Dh,0Ah,0Dh,0Ah,"    ? Player 1 (Triangle): $"
p2score db 0Dh,0Ah,"    | Player 2 (Square): $"
slash   db " / $"
winner1 db 0Dh,0Ah,0Dh,0Ah,"  ???? ? PLAYER 1 TRIANGLE WINS! ? ????$"
winner2 db 0Dh,0Ah,0Dh,0Ah,"  ???? | PLAYER 2 SQUARE WINS! | ????$"
tiegame db 0Dh,0Ah,0Dh,0Ah,"  ???? ? TIE BETWEEN TRIANGLE & SQUARE | ????$"

gradebest db 0Dh,0Ah,"           ?? Grade: EXCELLENT! ??$"
gradegood db 0Dh,0Ah,"           ? Grade: GOOD! ?$"
gradefair db 0Dh,0Ah,"           ? Grade: FAIR ?$"
gradeavg  db 0Dh,0Ah,"           ?? Grade: AVERAGE ??$"
gradepoor db 0Dh,0Ah,"           ?? Grade: KEEP PRACTICING! ??$"

totalm  db 0Dh,0Ah,0Dh,0Ah,"                           ?? TIME SUMMARY                    $"
p1time  db 0Dh,0Ah,"    ? Player 1 Triangle Time: $"
p2time  db 0Dh,0Ah,"    | Player 2 Square Time: $"
avgmsg  db 0Dh,0Ah,"Average Time per Question: $"
secunit db " seconds$"
nl      db 0Dh,0Ah,"$"


filename    db "mathquiz.sav",0
highP1Score dw 0            
highP2Score dw 0            
highP1Time  dw 9999         
highP2Time  dw 9999         
newRecord   db 0            
recordMsg   db 0Dh,0Ah,0Dh,0Ah,"  ?????? NEW RECORD ACHIEVED! ??????$"
highScoreMsg db 0Dh,0Ah,0Dh,0Ah,"                      ?? PREVIOUS BEST SCORES ??             $"
prevP1      db 0Dh,0Ah,"    ? Player 1 Triangle Best: $"
prevP2      db 0Dh,0Ah,"    | Player 2 Square Best: $"


tiebreaker  db 0            
tiebreakerQ dw 0            
tieround    dw 0            
maxTieRounds dw 3           
tiemsg1     db 0Dh,0Ah,0Dh,0Ah,"  ??? TIE DETECTED - SUDDEN DEATH MODE! ???$"
tiemsg2     db 0Dh,0Ah,"  ?? One question each - fastest correct answer wins! ??$"
tieroundmsg db 0Dh,0Ah,"  ?? SUDDEN DEATH ROUND $"
tieroundmsg2 db " - Each player gets one chance! ??$"
tiecontinue db 0Dh,0Ah,"  ?? Still tied! Continue with another round? (Y/N): $"
tiewinner   db 0Dh,0Ah,0Dh,0Ah,"  ?? SUDDEN DEATH WINNER: PLAYER $"
tiewinner2  db " $"
tieofficial db 0Dh,0Ah,0Dh,0Ah,"  ?? OFFICIAL TIE DECLARED! Both players equally matched! ??$"


inbuf   db 20,0,18 dup(0)


seed        dw 1
qcount      dw 0
qnum        dw 0
correct     dw 0
totalTicks  dw 0
currentOp   dw 0
currentPlayer dw 1    
difficulty  dw 2      
opMask      db 127    


p1correct   dw 0
p2correct   dw 0
p1totalTicks dw 0
p2totalTicks dw 0


questionData dw 100 dup(0)  
answerData   dw 50 dup(0)   
userAnswers  dw 50 dup(0)   


opA     dw 0
opB     dw 0
ans     dw 0
userAns dw 0


tStartCX dw 0
tStartDX dw 0
tEndCX   dw 0
tEndDX   dw 0
tTicks   dw 0

.CODE
MAIN PROC
    mov ax, @DATA
    mov ds, ax

    
    call GetTicks
    mov seed, dx

    
    call LoadHighScores

    
    call ShowBanner

    
    call ShowPreviousRecords

    
    call SelectDifficulty
    
    
    call SelectOperations

    
    lea dx, askN
    mov ah, 09h
    int 21h
    
    call ReadNumber
    mov qcount, ax
    
    
    cmp ax, 0
    jne ValidCount
    mov ax, 1
    mov qcount, ax
ValidCount:

    
    mov ax, 0
    mov qnum, ax
    mov correct, ax
    mov totalTicks, ax
    mov p1correct, ax
    mov p2correct, ax
    mov p1totalTicks, ax
    mov p2totalTicks, ax
    mov ax, 1
    mov currentPlayer, ax


QuizLoop:
    mov ax, qnum
    mov bx, qcount
    shl bx, 1           
    cmp ax, bx
    jae QuizDone        
    
    
    inc qnum
    
    
    call GenerateQuestion
    call AskQuestion
    call CheckAnswer
    
    
    mov ax, currentPlayer
    cmp ax, 1
    je  SwitchToP2
    mov ax, 1
    jmp SwitchDone
SwitchToP2:
    mov ax, 2
SwitchDone:
    mov currentPlayer, ax
    
    
    jmp QuizLoop

QuizDone:
    
    mov ax, p1correct
    mov bx, p2correct
    cmp ax, bx
    jne NoTie
    
    
    call TieBreakerMode
    
    
    mov ax, p1correct
    mov bx, p2correct
    cmp ax, bx
    je  StillTied       
    
NoTie:
    call ShowResults
    jmp AfterResults

StillTied:
    call ShowResults

AfterResults:
    
    call SaveHighScores
    
    
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    
    
    mov ax, 4C00h
    int 21h
MAIN ENDP



ShowBanner PROC
    lea dx, banner1
    mov ah, 09h
    int 21h
    lea dx, banner2
    mov ah, 09h
    int 21h
    lea dx, banner3
    mov ah, 09h
    int 21h
    lea dx, banner4
    mov ah, 09h
    int 21h
    lea dx, banner5
    mov ah, 09h
    int 21h
    lea dx, banner6
    mov ah, 09h
    int 21h
    lea dx, banner7
    mov ah, 09h
    int 21h
    lea dx, banner8
    mov ah, 09h
    int 21h
    lea dx, banner9
    mov ah, 09h
    int 21h
    lea dx, banner10
    mov ah, 09h
    int 21h
    lea dx, banner11
    mov ah, 09h
    int 21h
    lea dx, banner12
    mov ah, 09h
    int 21h
    lea dx, banner13
    mov ah, 09h
    int 21h
    lea dx, banner14
    mov ah, 09h
    int 21h
    lea dx, banner15
    mov ah, 09h
    int 21h
    lea dx, banner16
    mov ah, 09h
    int 21h
    lea dx, banner17
    mov ah, 09h
    int 21h
    lea dx, banner18
    mov ah, 09h
    int 21h
    ret
ShowBanner ENDP

ReadNumber PROC
    
    mov al, 20
    mov inbuf, al
    mov al, 0
    mov inbuf+1, al
    
    lea dx, inbuf
    mov ah, 0Ah
    int 21h
    
   
    lea si, inbuf+2
    call Atoi16
    ret
ReadNumber ENDP

GenerateQuestion PROC
    
SelectOp:
    call Random
    mov bx, 7
    xor dx, dx
    div bx              
    
    
    mov al, 1
    mov cl, dl
    shl al, cl          
    mov bl, opMask
    test bl, al
    jz  SelectOp        
    
    mov currentOp, dx   

    cmp dx, 0
    je  GenAdd
    cmp dx, 1
    je  GenSub
    cmp dx, 2
    je  GenMul
    cmp dx, 3
    je  GenDiv
    cmp dx, 4
    je  GenPow
    cmp dx, 5
    je  GenSqrt
    jmp GenFact

GenAdd:
    mov ax, difficulty
    cmp ax, 1
    je  GenAddEasy
    cmp ax, 3
    je  GenAddHard

    call Random2D       
    mov opA, ax
    call Random2D       
    mov opB, ax
    jmp GenAddCalc
GenAddEasy:
    call Random         
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10          
    mov opA, dx
    call Random
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10          
    mov opB, dx
    jmp GenAddCalc
GenAddHard:
    call Random         
    mov bx, 9000
    xor dx, dx
    div bx
    add dx, 1000        
    mov opA, dx
    call Random
    mov bx, 6000        
    xor dx, dx
    div bx
    add dx, 1000        
    mov opB, dx
GenAddCalc:
    mov ax, opA
    add ax, opB
    mov ans, ax
    ret

GenSub:
    mov ax, difficulty
    cmp ax, 1
    je  GenSubEasy
    cmp ax, 3
    je  GenSubHard
    
    call Random2D       
    mov opA, ax
    call Random2D       
    mov opB, ax
    jmp GenSubCalc
GenSubEasy:
    call Random         
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10          
    mov opA, dx
    call Random
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10          
    mov opB, dx
    jmp GenSubCalc
GenSubHard:
    call Random         
    mov bx, 9000
    xor dx, dx
    div bx
    add dx, 1000        
    mov opA, dx
    call Random
    mov bx, 8000
    xor dx, dx
    div bx
    add dx, 1000        
    mov opB, dx
GenSubCalc:
    
    mov ax, opA
    cmp ax, opB
    jae SubOK
    xchg ax, opB
    mov opA, ax
SubOK:
    mov ax, opA
    sub ax, opB
    mov ans, ax
    ret

GenMul:
    
    call Random       
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10       
    mov opA, dx
    
    call Random       
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10        
    mov opB, dx
    
    mov ax, opA
    mul opB
    mov ans, ax
    ret

GenDiv:
    
    call Random2D       
    mov cx, ax
    
    call Random       
    mov bx, 90
    xor dx, dx
    div bx
    add dx, 10        
    mov opB, dx
    
    mov ax, dx
    mul cx              
    mov opA, ax
    mov ans, cx         
    ret

GenPow:
    
    call Random
    mov bx, 8
    xor dx, dx
    div bx
    add dx, 10        
    mov opA, dx
    
    call Random
    mov bx, 3
    xor dx, dx
    div bx
    add dx, 2         
    mov opB, dx
    
    
    mov ax, 1
    mov bx, opA
    mov cx, opB
PowLoop:
    mul bx
    loop PowLoop
    mov ans, ax
    ret

GenSqrt:
    
    call Random
    mov bx, 25
    xor dx, dx
    div bx
    add dx, 10        
    mov opA, dx       
    mul dx            
    mov opB, ax       
    mov ax, opA
    mov ans, ax       
    ret

GenFact:
    
    call Random
    mov bx, 6
    xor dx, dx
    div bx
    add dx, 5         
    mov opA, dx
    
    
    mov ax, 1
    mov cx, opA
FactLoop:
    mul cx
    loop FactLoop
    mov ans, ax
    ret
GenerateQuestion ENDP

AskQuestion PROC
    
    lea dx, qhead
    mov ah, 09h
    int 21h
    lea dx, qhead2
    mov ah, 09h
    int 21h
    mov ax, qnum        
    call PrintU16
    
    
    mov ax, currentPlayer
    cmp ax, 1
    je  ShowP1Turn
    lea dx, p2turn
    mov ah, 09h
    int 21h
    lea dx, p2turn2
    mov ah, 09h
    int 21h
    lea dx, p2turn3
    mov ah, 09h
    int 21h
    lea dx, p2turn4
    mov ah, 09h
    int 21h
    lea dx, p2turn5
    mov ah, 09h
    int 21h
    lea dx, p2turn6
    mov ah, 09h
    int 21h
    jmp ShowTurnDone
ShowP1Turn:
    lea dx, p1turn
    mov ah, 09h
    int 21h
    lea dx, p1turn2
    mov ah, 09h
    int 21h
    lea dx, p1turn3
    mov ah, 09h
    int 21h
    lea dx, p1turn4
    mov ah, 09h
    int 21h
    lea dx, p1turn5
    mov ah, 09h
    int 21h
    lea dx, p1turn6
    mov ah, 09h
    int 21h
ShowTurnDone:
    
    ;
    mov bx, currentOp
    
    cmp bx, 0
    je  AskAdd
    cmp bx, 1
    je  AskSub
    cmp bx, 2
    je  AskMul
    cmp bx, 3
    je  AskDiv
    cmp bx, 4
    je  AskPow
    cmp bx, 5
    je  AskSqrt
    cmp bx, 6
    je  AskFact
    jmp AskAdd      

AskAdd:
    mov ax, opA
    call PrintU16
    lea dx, plus
    mov ah, 09h
    int 21h
    mov ax, opB
    call PrintU16
    jmp AskEnd

AskSub:
    mov ax, opA
    call PrintU16
    lea dx, minus
    mov ah, 09h
    int 21h
    mov ax, opB
    call PrintU16
    jmp AskEnd

AskMul:
    mov ax, opA
    call PrintU16
    lea dx, times
    mov ah, 09h
    int 21h
    mov ax, opB
    call PrintU16
    jmp AskEnd

AskDiv:
    mov ax, opA
    call PrintU16
    lea dx, divide
    mov ah, 09h
    int 21h
    mov ax, opB
    call PrintU16
    jmp AskEnd

AskPow:
    mov ax, opA
    call PrintU16
    lea dx, powc
    mov ah, 09h
    int 21h
    mov ax, opB
    call PrintU16
    jmp AskEnd

AskSqrt:
    lea dx, sqrt1
    mov ah, 09h
    int 21h
    mov ax, opB
    call PrintU16
    lea dx, sqrt2
    mov ah, 09h
    int 21h
    jmp AskInput

AskFact:
    mov ax, opA
    call PrintU16
    lea dx, factc
    mov ah, 09h
    int 21h
    jmp AskInput

AskEnd:
    lea dx, eqsign
    mov ah, 09h
    int 21h

AskInput:
    
    call GetTicks
    mov tStartCX, cx
    mov tStartDX, dx
    
    
    call ReadNumber
    mov userAns, ax
    
    
    call GetTicks
    mov tEndCX, cx
    mov tEndDX, dx
    
    ret
AskQuestion ENDP

CheckAnswer PROC
    
    mov ax, tEndDX
    sub ax, tStartDX
    
    jns TimeOK
    
    neg ax              
   
    cmp ax, 1092        
    jbe TimeOK
    mov ax, 18          
TimeOK:
    mov tTicks, ax
    
    
    mov ax, currentPlayer
    cmp ax, 1
    je  AddToP1Time
    mov bx, p2totalTicks
    add bx, tTicks
    mov p2totalTicks, bx
    jmp TimeAdded
AddToP1Time:
    mov bx, p1totalTicks
    add bx, tTicks
    mov p1totalTicks, bx
TimeAdded:
    
   
    mov ax, userAns
    mov bx, ans
    cmp ax, bx
    je  AnswerCorrect
    
    
    lea dx, badmsg
    mov ah, 09h
    int 21h
    mov ax, ans
    call PrintU16
    mov dl, ' '
    mov ah, 02h
    int 21h
    jmp ShowTime

AnswerCorrect:
    lea dx, okmsg
    mov ah, 09h
    int 21h
    
    mov ax, currentPlayer
    cmp ax, 1
    je  IncP1Score
    inc p2correct
    jmp ShowTime
IncP1Score:
    inc p1correct

ShowTime:
    
    mov ax, tTicks
    cmp ax, 0
    je  TimeZero
    
    mov bx, 10
    mul bx              
    mov bx, 182         
    xor dx, dx
    div bx              
    cmp ax, 0
    jne ShowSeconds
TimeZero:
    mov ax, 1           
ShowSeconds:
    call PrintU16
    lea dx, suf_s
    mov ah, 09h
    int 21h
    ret
CheckAnswer ENDP

ShowResults PROC
    
    lea dx, hr
    mov ah, 09h
    int 21h
    lea dx, hr2
    mov ah, 09h
    int 21h
    lea dx, hr3
    mov ah, 09h
    int 21h
    
   
    lea dx, final1
    mov ah, 09h
    int 21h
    
    
    lea dx, p1score
    mov ah, 09h
    int 21h
    mov ax, p1correct
    call PrintU16
    lea dx, slash
    mov ah, 09h
    int 21h
    mov ax, qcount
    call PrintU16
    
   
    lea dx, p2score
    mov ah, 09h
    int 21h
    mov ax, p2correct
    call PrintU16
    lea dx, slash
    mov ah, 09h
    int 21h
    mov ax, qcount
    call PrintU16
    
    
    mov ax, p1correct
    mov bx, p2correct
    cmp ax, bx
    ja  P1Wins
    jb  P2Wins
    lea dx, tiegame
    jmp ShowWinner
P1Wins:
    lea dx, winner1
    jmp ShowWinner
P2Wins:
    lea dx, winner2
ShowWinner:
    mov ah, 09h
    int 21h
    
    
    call ShowPlayerGrades
    
    
    lea dx, totalm
    mov ah, 09h
    int 21h
    
    
    lea dx, p1time
    mov ah, 09h
    int 21h
    mov ax, p1totalTicks
    cmp ax, 0
    je  P1TimeZero
    mov bx, 10
    mul bx             
    mov bx, 182         
    xor dx, dx
    div bx             
    cmp ax, 0
    jne ShowP1Time
P1TimeZero:
    mov ax, qcount      
ShowP1Time:
    call PrintU16
    lea dx, secunit
    mov ah, 09h
    int 21h
    
    
    lea dx, p2time
    mov ah, 09h
    int 21h
    mov ax, p2totalTicks
    cmp ax, 0
    je  P2TimeZero
    mov bx, 10
    mul bx              
    mov bx, 182         
    xor dx, dx
    div bx             
    cmp ax, 0
    jne ShowP2Time
P2TimeZero:
    mov ax, qcount      
ShowP2Time:
    call PrintU16
    lea dx, secunit
    mov ah, 09h
    int 21h
    
    
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    
    ret
ShowResults ENDP



SelectDifficulty PROC
    lea dx, diffmsg
    mov ah, 09h
    int 21h
    lea dx, diffmsg2
    mov ah, 09h
    int 21h
    lea dx, diffmsg3
    mov ah, 09h
    int 21h
    lea dx, diffmsg4
    mov ah, 09h
    int 21h
    lea dx, diffmsg5
    mov ah, 09h
    int 21h
    lea dx, diffmsg6
    mov ah, 09h
    int 21h
    lea dx, diffmsg7
    mov ah, 09h
    int 21h
    lea dx, diffmsg8
    mov ah, 09h
    int 21h
    call ReadNumber
    cmp ax, 1
    jb  SetDefaultDiff
    cmp ax, 3
    ja  SetDefaultDiff
    mov difficulty, ax
    ret
SetDefaultDiff:
    mov ax, 2           ; default to medium
    mov difficulty, ax
    ret
SelectDifficulty ENDP

SelectOperations PROC
    
    lea dx, opmsg1
    mov ah, 09h
    int 21h
    lea dx, opmsg1b
    mov ah, 09h
    int 21h
    lea dx, opmsg1c
    mov ah, 09h
    int 21h
    lea dx, opmsg1d
    mov ah, 09h
    int 21h
    lea dx, opmsg1e
    mov ah, 09h
    int 21h
    lea dx, opmsg1f
    mov ah, 09h
    int 21h
    lea dx, opmsg1g
    mov ah, 09h
    int 21h
    lea dx, opmsg1h
    mov ah, 09h
    int 21h
    lea dx, opmsg2
    mov ah, 09h
    int 21h
    
    
    call ReadNumber
    cmp ax, 0
    je  SetDefaultOps  
    
    
    mov opMask, 0      
    mov bx, ax          
    
ParseOps:
    cmp bx, 0
    je  OpsDone
    
    
    mov ax, bx
    mov dx, 0
    mov cx, 10
    div cx              
    mov bx, ax          
    
    
    cmp dx, 1
    jb  ParseOps        
    cmp dx, 7
    ja  ParseOps        
    
    
    dec dx              
    mov al, 1
    mov cl, dl
    shl al, cl          
    or  opMask, al      
    
    jmp ParseOps

SetDefaultOps:
    mov opMask, 127     
OpsDone:
   
    cmp opMask, 0
    jne OpsMaskOK
    mov opMask, 127     
OpsMaskOK:
    ret
SelectOperations ENDP

ShowPlayerGrades PROC
    
    lea dx, p1score
    mov ah, 09h
    int 21h
    mov ax, p1correct
    call PrintU16
    lea dx, slash
    mov ah, 09h
    int 21h
    mov ax, qcount
    call PrintU16
    
    
    mov ax, p1correct
    mov bx, 100
    mul bx              
    mov bx, qcount
    cmp bx, 0
    je  SkipP1Grade
    xor dx, dx
    div bx              
    call GetGradeString
    mov ah, 09h
    int 21h

SkipP1Grade:
    
    lea dx, p2score
    mov ah, 09h
    int 21h
    mov ax, p2correct
    call PrintU16
    lea dx, slash
    mov ah, 09h
    int 21h
    mov ax, qcount
    call PrintU16
    
   
    mov ax, p2correct
    mov bx, 100
    mul bx              
    mov bx, qcount
    cmp bx, 0
    je  SkipP2Grade
    xor dx, dx
    div bx              
    call GetGradeString
    mov ah, 09h
    int 21h

SkipP2Grade:
    ret
ShowPlayerGrades ENDP

GetGradeString PROC
    
    cmp ax, 90
    jae GetGradeBest
    cmp ax, 80
    jae GetGradeGood
    cmp ax, 70
    jae GetGradeFair
    cmp ax, 60
    jae GetGradeAvg
    lea dx, gradepoor
    ret
GetGradeBest:
    lea dx, gradebest
    ret
GetGradeGood:
    lea dx, gradegood
    ret
GetGradeFair:
    lea dx, gradefair
    ret
GetGradeAvg:
    lea dx, gradeavg
    ret
GetGradeString ENDP



LoadHighScores PROC
    
    mov highP1Score, 0
    mov highP2Score, 0
    mov highP1Time, 9999
    mov highP2Time, 9999
    
    
    lea dx, filename
    mov ax, 3D00h       
    int 21h
    jc  LoadDone        
    
    mov bx, ax          
    
    
    mov ah, 3Fh         
    mov cx, 8           
    lea dx, highP1Score 
    int 21h
    
    
    mov ah, 3Eh
    int 21h
    
LoadDone:
    ret
LoadHighScores ENDP

SaveHighScores PROC
    
    call CheckNewRecords
    
    
    lea dx, filename
    mov ah, 3Ch         
    mov cx, 0           
    int 21h
    jc  SaveDone        
    
    mov bx, ax          
    
    
    mov ah, 40h         
    mov cx, 8           
    lea dx, highP1Score 
    int 21h
    
    
    mov ah, 3Eh
    int 21h
    
SaveDone:
    ret
SaveHighScores ENDP

CheckNewRecords PROC
    mov newRecord, 0    
    
    
    mov ax, p1correct
    cmp ax, highP1Score
    jbe CheckP1Time
    mov highP1Score, ax
    mov newRecord, 1
    
CheckP1Time:
    
    mov ax, p1totalTicks
    cmp ax, highP1Time
    jae CheckP2Score
    mov highP1Time, ax
    mov newRecord, 1
    
CheckP2Score:
   
    mov ax, p2correct
    cmp ax, highP2Score
    jbe CheckP2Time
    mov highP2Score, ax
    mov newRecord, 1
    
CheckP2Time:
   
    mov ax, p2totalTicks
    cmp ax, highP2Time
    jae CheckDone
    mov highP2Time, ax
    mov newRecord, 1
    
CheckDone:
    
    cmp newRecord, 1
    jne NoNewRecord
    lea dx, recordMsg
    mov ah, 09h
    int 21h
    
NoNewRecord:
    ret
CheckNewRecords ENDP

ShowPreviousRecords PROC
   
    mov ax, highP1Score
    add ax, highP2Score
    cmp ax, 0
    je  NoPreviousRecords
    
    lea dx, highScoreMsg
    mov ah, 09h
    int 21h
    
    lea dx, prevP1
    mov ah, 09h
    int 21h
    mov ax, highP1Score
    call PrintU16
    lea dx, slash
    mov ah, 09h
    int 21h
    mov ax, qcount
    call PrintU16
    
    lea dx, prevP2
    mov ah, 09h
    int 21h
    mov ax, highP2Score
    call PrintU16
    lea dx, slash
    mov ah, 09h
    int 21h
    mov ax, qcount
    call PrintU16
    
    lea dx, nl
    mov ah, 09h
    int 21h
    
NoPreviousRecords:
    ret
ShowPreviousRecords ENDP



TieBreakerMode PROC
    
    lea dx, tiemsg1
    mov ah, 09h
    int 21h
    lea dx, tiemsg2
    mov ah, 09h
    int 21h
    
    
    mov tiebreaker, 1
    mov tieround, 1
    
    
    lea dx, tieroundmsg
    mov ah, 09h
    int 21h
    mov ax, 1
    call PrintU16
    lea dx, tieroundmsg2
    mov ah, 09h
    int 21h
    
   
    mov currentPlayer, 1
    mov qnum, 1
    call GenerateQuestion
    call AskQuestion
    
   
    mov ax, userAns
    mov bx, ans
    mov cx, 0           
    cmp ax, bx
    jne P1Wrong
    mov cx, 1           
P1Wrong:
    
    push cx             
    mov ax, tTicks
    push ax            
    
    
    cmp cx, 1
    je  ShowP1Correct2
    lea dx, badmsg
    mov ah, 09h
    int 21h
    mov ax, ans
    call PrintU16
    lea dx, nl
    mov ah, 09h
    int 21h
    jmp P1Done
ShowP1Correct2:
    lea dx, okmsg
    mov ah, 09h
    int 21h
    mov ax, tTicks
    cmp ax, 0
    je  P1TimeZero3
    mov bx, 10
    mul bx
    mov bx, 182
    xor dx, dx
    div bx
    cmp ax, 0
    jne ShowP1Time3
P1TimeZero3:
    mov ax, 1
ShowP1Time3:
    call PrintU16
    lea dx, suf_s
    mov ah, 09h
    int 21h
P1Done:
    
    
    mov currentPlayer, 2
    mov qnum, 2
    call GenerateQuestion
    call AskQuestion
    
    
    mov ax, userAns
    mov bx, ans
    mov dx, 0           
    cmp ax, bx
    jne P2Wrong
    mov dx, 1           
P2Wrong:
    
    push dx             
    
    
    cmp dx, 1
    je  ShowP2Correct2
    lea dx, badmsg
    mov ah, 09h
    int 21h
    mov ax, ans
    call PrintU16
    lea dx, nl
    mov ah, 09h
    int 21h
    jmp P2Done
ShowP2Correct2:
    lea dx, okmsg
    mov ah, 09h
    int 21h
    mov ax, tTicks
    cmp ax, 0
    je  P2TimeZero3
    mov bx, 10
    mul bx
    mov bx, 182
    xor dx, dx
    div bx
    cmp ax, 0
    jne ShowP2Time3
P2TimeZero3:
    mov ax, 1
ShowP2Time3:
    call PrintU16
    lea dx, suf_s
    mov ah, 09h
    int 21h
P2Done:
    
   
    pop dx              
    
    pop bx              
    pop cx             
    
    
   
    cmp cx, 1
    jne CheckP1WrongCase
    cmp dx, 0
    je  P1WinsImmediate
   
    jmp CompareTimes
    
CheckP1WrongCase:
    
    cmp dx, 1
    je  P2WinsImmediate
    
    jmp CompareTimes
    
P1WinsImmediate:
    mov currentPlayer, 1
    jmp TieWinnerFound
    
P2WinsImmediate:
    mov currentPlayer, 2
    jmp TieWinnerFound
    
CompareTimes:
    
    mov ax, tTicks      
    cmp bx, ax          
    jb  P1WinsFaster    
    ja  P2WinsFaster    
    
    jmp AskContinue
    
P1WinsFaster:
    mov currentPlayer, 1
    jmp TieWinnerFound
    
P2WinsFaster:
    mov currentPlayer, 2
    jmp TieWinnerFound

AskContinue:
    
    lea dx, tiecontinue
    mov ah, 09h
    int 21h
    
    
    mov ah, 01h
    int 21h
    mov bl, al
    
    
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h
    
   
    cmp bl, 'y'
    je  ContinueRound
    cmp bl, 'Y'
    je  ContinueRound
    
   
    jmp DeclareOfficialTie

ContinueRound:
    
    inc tieround
    
    lea dx, tieroundmsg
    mov ah, 09h
    int 21h
    mov ax, tieround
    call PrintU16
    lea dx, tieroundmsg2
    mov ah, 09h
    int 21h
    
    
    mov currentPlayer, 1
    mov qnum, 1
    call GenerateQuestion
    call AskQuestion
    
    
    mov ax, userAns
    mov bx, ans
    mov cx, 0           
    cmp ax, bx
    jne P1WrongNext
    mov cx, 1           
P1WrongNext:
   
    push cx             
    mov ax, tTicks
    push ax             
    
   
    cmp cx, 1
    je  ShowP1CorrectNext
    lea dx, badmsg
    mov ah, 09h
    int 21h
    mov ax, ans
    call PrintU16
    lea dx, nl
    mov ah, 09h
    int 21h
    jmp P1DoneNext
ShowP1CorrectNext:
    lea dx, okmsg
    mov ah, 09h
    int 21h
    mov ax, tTicks
    cmp ax, 0
    je  P1TimeZeroNext
    mov bx, 10
    mul bx
    mov bx, 182
    xor dx, dx
    div bx
    cmp ax, 0
    jne ShowP1TimeNext
P1TimeZeroNext:
    mov ax, 1
ShowP1TimeNext:
    call PrintU16
    lea dx, suf_s
    mov ah, 09h
    int 21h
P1DoneNext:
    
    
    mov currentPlayer, 2
    mov qnum, 2
    call GenerateQuestion
    call AskQuestion
    

    mov ax, userAns
    mov bx, ans
    mov dx, 0           
    cmp ax, bx
    jne P2WrongNext
    mov dx, 1           
P2WrongNext:
    
    push dx             
    
    
    cmp dx, 1
    je  ShowP2CorrectNext
    lea dx, badmsg
    mov ah, 09h
    int 21h
    mov ax, ans
    call PrintU16
    lea dx, nl
    mov ah, 09h
    int 21h
    jmp P2DoneNext
ShowP2CorrectNext:
    lea dx, okmsg
    mov ah, 09h
    int 21h
    mov ax, tTicks
    cmp ax, 0
    je  P2TimeZeroNext
    mov bx, 10
    mul bx
    mov bx, 182
    xor dx, dx
    div bx
    cmp ax, 0
    jne ShowP2TimeNext
P2TimeZeroNext:
    mov ax, 1
ShowP2TimeNext:
    call PrintU16
    lea dx, suf_s
    mov ah, 09h
    int 21h
P2DoneNext:
    
    
   
    pop dx              
    
    pop bx              
    pop cx              
    
    
    
    cmp cx, 1
    jne CheckP1WrongCaseNext
    cmp dx, 0
    je  P1WinsImmediateNext
    
    jmp CompareTimesNext
    
CheckP1WrongCaseNext:
    
    cmp dx, 1
    je  P2WinsImmediateNext
    
    jmp CompareTimesNext
    
P1WinsImmediateNext:
    mov currentPlayer, 1
    jmp TieWinnerFound
    
P2WinsImmediateNext:
    mov currentPlayer, 2
    jmp TieWinnerFound
    
CompareTimesNext:
    
    mov ax, tTicks      
    cmp bx, ax          
    jb  P1WinsFasterNext   
    ja  P2WinsFasterNext   
    
    jmp AskContinue
    
P1WinsFasterNext:
    mov currentPlayer, 1
    jmp TieWinnerFound
    
P2WinsFasterNext:
    mov currentPlayer, 2
    jmp TieWinnerFound
    
TieWinnerFound:
    
    lea dx, tiewinner
    mov ah, 09h
    int 21h
    mov ax, currentPlayer
    call PrintU16
    
    
    mov ax, currentPlayer
    cmp ax, 1
    je  ShowTriangleWin
    lea dx, tiewinner2
    mov ah, 09h
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov dl, 166         
    mov ah, 02h
    int 21h
    jmp TieSymbolDone
ShowTriangleWin:
    lea dx, tiewinner2
    mov ah, 09h
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov dl, 30         
    mov ah, 02h
    int 21h
TieSymbolDone:
    lea dx, nl
    mov ah, 09h
    int 21h
    
    
    mov ax, currentPlayer
    cmp ax, 1
    je  TieP1Wins
    inc p2correct
    jmp TieDone
TieP1Wins:
    inc p1correct
    jmp TieDone
    
DeclareOfficialTie:
    
    lea dx, tieofficial
    mov ah, 09h
    int 21h
    
TieDone:
    mov tiebreaker, 0
    ret
TieBreakerMode ENDP



GetTicks PROC
    mov ah, 00h
    int 1Ah
    ret
GetTicks ENDP

Random PROC
    mov ax, seed
    mov bx, 25173
    mul bx
    add ax, 13849
    mov seed, ax
    ret
Random ENDP

Random1D PROC          
    call Random
    mov bx, 900
    xor dx, dx
    div bx
    mov ax, dx
    add ax, 100
    ret
Random1D ENDP

Random2D PROC          
    call Random
    mov bx, 900
    xor dx, dx
    div bx
    mov ax, dx
    add ax, 100
    ret
Random2D ENDP

PrintU16 PROC
    push ax
    push bx
    push cx
    push dx
    
    xor cx, cx
    mov bx, 10
    
    cmp ax, 0
    jne pu_loop
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp pu_done

pu_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz pu_loop

pu_out:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop pu_out

pu_done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintU16 ENDP

Atoi16 PROC
    push bx
    push cx
    push dx
    push si
    
    xor ax, ax          
    xor bx, bx          
    
atoi_loop:
    mov bl, [si]        
    inc si              
    
    cmp bl, 0Dh         
    je  atoi_done
    cmp bl, 0Ah         
    je  atoi_done
    cmp bl, 0           
    je  atoi_done
    cmp bl, ' '         
    je  atoi_done
    cmp bl, '0'         
    jb  atoi_done
    cmp bl, '9'         
    ja  atoi_done
    
    
    sub bl, '0'         
    
    
    mov cx, ax          
    mov dx, 10
    mul dx              
    
   
    mov dl, bl
    add ax, dx
    
    jmp atoi_loop

atoi_done:
    pop si
    pop dx
    pop cx
    pop bx
    ret
Atoi16 ENDP

END MAIN
