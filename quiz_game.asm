
org 100h

.model small
.stack 100h
.data
    ; Menu
    menu db "QUIZ GAME", 13, 10, "--------------", 13, 10
         db "1. Start Game", 13, 10
         db "2. Quit", 13, 10
         db "Select option (1-2): $"

    ; Categories
    category_title db 13, 10, "SELECT CATEGORY:", 13, 10, "------------------", 13, 10
                   db "1. General Knowledge", 13, 10
                   db "2. Science & Tech", 13, 10
                   db "3. History", 13, 10
                   db "4. Sports", 13, 10
                   db "5. Movies & Entertainment", 13, 10
                   db "Choose a category (1-5): $"

    ; General Knowledge Questions
    gk_q1 db "1. What is the capital of France?",13,10
          db "A) London  B) Paris  C) Berlin",13,10,"$"
    gk_q2 db "2. How many colors are in a rainbow?",13,10
          db "A) 5  B) 7  C) 9",13,10,"$"
    gk_q3 db "3. Which planet is known as the Red Planet?",13,10
          db "A) Venus  B) Mars  C) Jupiter",13,10,"$"
    gk_q4 db "4. What is the largest mammal?",13,10
          db "A) Elephant  B) Blue Whale  C) Giraffe",13,10,"$"
    gk_q5 db "5. Which country gifted the Statue of Liberty to the US?",13,10
          db "A) England  B) France  C) Canada",13,10,"$"
    gk_ans db 'B','B','B','B','B'
    gk_correct_answers db "Correct answers: 1-B, 2-B, 3-B, 4-B, 5-B",13,10,"$"

    ; Science & Tech Questions
    st_q1 db "1. What does CPU stand for?",13,10
          db "A) Central Processing Unit  B) Computer Processing Unit  C) Central Processor Unit",13,10,"$"
    st_q2 db "2. Which gas is most abundant in Earth's atmosphere?",13,10
          db "A) Oxygen  B) Carbon Dioxide  C) Nitrogen",13,10,"$"
    st_q3 db "3. What is the chemical symbol for gold?",13,10
          db "A) Go  B) Au  C) Ag",13,10,"$"
    st_q4 db "4. Which planet is closest to the Sun?",13,10
          db "A) Venus  B) Earth  C) Mercury",13,10,"$"
    st_q5 db "5. What year was the first iPhone released?",13,10
          db "A) 2005  B) 2007  C) 2010",13,10,"$"
    st_ans db 'A','C','B','C','B'
    st_correct_answers db "Correct answers: 1-A, 2-C, 3-B, 4-C, 5-B",13,10,"$"

    ; History Questions
    his_q1 db "1. In which year did World War II end?",13,10
          db "A) 1943  B) 1945  C) 1947",13,10,"$"
    his_q2 db "2. Who was the first president of the United States?",13,10
          db "A) Thomas Jefferson  B) Abraham Lincoln  C) George Washington",13,10,"$"
    his_q3 db "3. Which ancient civilization built the pyramids?",13,10
          db "A) Greeks  B) Egyptians  C) Romans",13,10,"$"
    his_q4 db "4. When did the Titanic sink?",13,10
          db "A) 1905  B) 1912  C) 1920",13,10,"$"
    his_q5 db "5. Who wrote the Declaration of Independence?",13,10
          db "A) Benjamin Franklin  B) Thomas Jefferson  C) John Adams",13,10,"$"
    his_ans db 'B','C','B','B','B'
    his_correct_answers db "Correct answers: 1-B, 2-C, 3-B, 4-B, 5-B",13,10,"$"

    ; Sports Questions
    sp_q1 db "1. How many players are on a baseball team?",13,10
          db "A) 7  B) 9  C) 11",13,10,"$"
    sp_q2 db "2. Which country won the 2018 FIFA World Cup?",13,10
          db "A) Germany  B) Brazil  C) France",13,10,"$"
    sp_q3 db "3. In tennis, what is a zero score called?",13,10
          db "A) Love  B) Nil  C) Zero",13,10,"$"
    sp_q4 db "4. Which sport uses a shuttlecock?",13,10
          db "A) Tennis  B) Badminton  C) Squash",13,10,"$"
    sp_q5 db "5. How many rings are in the Olympic symbol?",13,10
          db "A) 3  B) 5  C) 7",13,10,"$"
    sp_ans db 'B','C','A','B','B'
    sp_correct_answers db "Correct answers: 1-B, 2-C, 3-A, 4-B, 5-B",13,10,"$"

    ; Movies & Entertainment Questions
    mov_q1 db "1. Who played Jack in Titanic?",13,10
          db "A) Brad Pitt  B) Leonardo DiCaprio  C) Tom Cruise",13,10,"$"
    mov_q2 db "2. Which movie features the song 'Let It Go'?",13,10
          db "A) Moana  B) Frozen  C) Tangled",13,10,"$"
    mov_q3 db "3. Who directed the Avengers movies?",13,10
          db "A) Steven Spielberg  B) James Cameron  C) Joss Whedon",13,10,"$"
    mov_q4 db "4. Which actor played Iron Man?",13,10
          db "A) Chris Evans  B) Robert Downey Jr.  C) Chris Hemsworth",13,10,"$"
    mov_q5 db "5. How many Harry Potter books are there?",13,10
          db "A) 5  B) 7  C) 9",13,10,"$"
    mov_ans db 'B','B','C','B','B'
    mov_correct_answers db "Correct answers: 1-B, 2-B, 3-C, 4-B, 5-B",13,10,"$"

    ; Messages
    correct db " Correct!",13,10,"$"
    wrong db " Wrong!",13,10,"$"
    score_msg db 13,10,"Your Score: $"
    out_of db "/5",13,10,"$"
    correct_ans_msg db 13,10,"Here are the correct answers:",13,10,"$"
    again_msg db 13,10,"Play again? (Y/N): $"
    invalid_msg db 13,10,"Invalid input! Try again.",13,10,"$"
    newline db 13,10,"$"

    ; Variables
    score db 0
    current_question db 0
    user_choice db ?
    category db ?

.code
main proc
    mov ax, @data
    mov ds, ax

start:
    ; Reset score
    call clear_screen
    mov score, 0

    ; Display main menu
    mov ah, 9
    mov dx, offset menu
    int 21h

    ; Get menu choice
menu_input:
    mov ah, 1
    int 21h
    cmp al, '1'
    je select_category
    cmp al, '2'
    je exit_program
    
    ; Invalid menu choice
    mov ah, 9
    mov dx, offset invalid_msg
    int 21h
    jmp menu_input

select_category:     
    call clear_screen
    ; Display categories
    mov ah, 9
    mov dx, offset category_title
    int 21h

    ; Get category choice
category_input:
    mov ah, 1
    int 21h
    mov category, al
    
    ; Validate category
    cmp al, '1'
    jb invalid_category
    cmp al, '5'
    ja invalid_category
    jmp play_quiz

invalid_category:
    mov ah, 9
    mov dx, offset invalid_msg
    int 21h
    jmp category_input

play_quiz:
    mov current_question, 0

quiz_loop:
    cmp current_question, 5
    je show_results

    ; Display question based on category
    call display_question

    ; Get user answer
    call get_answer

    ; Check answer
    call check_answer

    inc current_question
    jmp quiz_loop

show_results:
    call clear_screen
    ; Display score
    mov ah, 9
    mov dx, offset score_msg
    int 21h
    
    mov dl, score
    add dl, '0'
    mov ah, 2
    int 21h
    
    mov ah, 9
    mov dx, offset out_of
    int 21h

    ; Show correct answers
    mov ah, 9
    mov dx, offset correct_ans_msg
    int 21h

    ; Display correct answers based on category
    cmp category, '1'
    je show_gk_answers
    cmp category, '2'
    je show_st_answers
    cmp category, '3'
    je show_his_answers
    cmp category, '4'
    je show_sp_answers
    cmp category, '5'
    je show_mov_answers

show_gk_answers:
    mov dx, offset gk_correct_answers
    jmp display_answers
show_st_answers:
    mov dx, offset st_correct_answers
    jmp display_answers
show_his_answers:
    mov dx, offset his_correct_answers
    jmp display_answers
show_sp_answers:
    mov dx, offset sp_correct_answers
    jmp display_answers
show_mov_answers:
    mov dx, offset mov_correct_answers

display_answers:
    mov ah, 9
    int 21h

    ; Ask to play again
    mov ah, 9
    mov dx, offset again_msg
    int 21h

again_input:
    mov ah, 1
    int 21h
    
    cmp al, 'Y'
    je start
    cmp al, 'y'
    je start
    cmp al, 'N'
    je exit_program
    cmp al, 'n'
    je exit_program
    
    ; Invalid input
    mov ah, 9
    mov dx, offset invalid_msg
    int 21h
    jmp again_input

exit_program:
    mov ah, 4ch
    int 21h
main endp

display_question proc 
    call clear_screen
    mov ah, 9
    mov dx, offset newline
    int 21h

    mov bl, current_question
    cmp category, '1'
    je gk_questions
    cmp category, '2'
    je st_questions
    cmp category, '3'
    je his_questions
    cmp category, '4'
    je sp_questions
    cmp category, '5'
    je mov_questions

gk_questions:
    cmp bl, 0
    je show_gk1
    cmp bl, 1
    je show_gk2
    cmp bl, 2
    je show_gk3
    cmp bl, 3
    je show_gk4
    cmp bl, 4
    je show_gk5

show_gk1:
    mov dx, offset gk_q1
    jmp display_it
show_gk2:
    mov dx, offset gk_q2
    jmp display_it
show_gk3:
    mov dx, offset gk_q3
    jmp display_it
show_gk4:
    mov dx, offset gk_q4
    jmp display_it
show_gk5:
    mov dx, offset gk_q5
    jmp display_it

st_questions:
    cmp bl, 0
    je show_st1
    cmp bl, 1
    je show_st2
    cmp bl, 2
    je show_st3
    cmp bl, 3
    je show_st4
    cmp bl, 4
    je show_st5

show_st1:
    mov dx, offset st_q1
    jmp display_it
show_st2:
    mov dx, offset st_q2
    jmp display_it
show_st3:
    mov dx, offset st_q3
    jmp display_it
show_st4:
    mov dx, offset st_q4
    jmp display_it
show_st5:
    mov dx, offset st_q5
    jmp display_it

his_questions:
    cmp bl, 0
    je show_his1
    cmp bl, 1
    je show_his2
    cmp bl, 2
    je show_his3
    cmp bl, 3
    je show_his4
    cmp bl, 4
    je show_his5

show_his1:
    mov dx, offset his_q1
    jmp display_it
show_his2:
    mov dx, offset his_q2
    jmp display_it
show_his3:
    mov dx, offset his_q3
    jmp display_it
show_his4:
    mov dx, offset his_q4
    jmp display_it
show_his5:
    mov dx, offset his_q5
    jmp display_it

sp_questions:
    cmp bl, 0
    je show_sp1
    cmp bl, 1
    je show_sp2
    cmp bl, 2
    je show_sp3
    cmp bl, 3
    je show_sp4
    cmp bl, 4
    je show_sp5

show_sp1:
    mov dx, offset sp_q1
    jmp display_it
show_sp2:
    mov dx, offset sp_q2
    jmp display_it
show_sp3:
    mov dx, offset sp_q3
    jmp display_it
show_sp4:
    mov dx, offset sp_q4
    jmp display_it
show_sp5:
    mov dx, offset sp_q5
    jmp display_it

mov_questions:
    cmp bl, 0
    je show_mov1
    cmp bl, 1
    je show_mov2
    cmp bl, 2
    je show_mov3
    cmp bl, 3
    je show_mov4
    cmp bl, 4
    je show_mov5

show_mov1:
    mov dx, offset mov_q1
    jmp display_it
show_mov2:
    mov dx, offset mov_q2
    jmp display_it
show_mov3:
    mov dx, offset mov_q3
    jmp display_it
show_mov4:
    mov dx, offset mov_q4
    jmp display_it
show_mov5:
    mov dx, offset mov_q5

display_it:
    mov ah, 9
    int 21h
    ret
display_question endp

get_answer proc
answer_input:
    mov ah, 1
    int 21h
    mov user_choice, al

    ; Convert to uppercase if lowercase
    cmp al, 'a'
    jb check_valid
    cmp al, 'z'
    ja check_valid
    sub al, 32
    mov user_choice, al

check_valid:
    cmp user_choice, 'A'
    jb invalid_answer
    cmp user_choice, 'C'
    ja invalid_answer
    ret

invalid_answer:
    mov ah, 9
    mov dx, offset invalid_msg
    int 21h
    jmp answer_input
get_answer endp

check_answer proc
    mov bl, current_question
    cmp category, '1'
    je check_gk
    cmp category, '2'
    je check_st
    cmp category, '3'
    je check_his
    cmp category, '4'
    je check_sp
    cmp category, '5'
    je check_mov

check_gk:
    mov al, gk_ans[bx]
    jmp compare
check_st:
    mov al, st_ans[bx]
    jmp compare
check_his:
    mov al, his_ans[bx]
    jmp compare
check_sp:
    mov al, sp_ans[bx]
    jmp compare
check_mov:
    mov al, mov_ans[bx]

compare:
    cmp user_choice, al
    jne wrong_ans
    ; Correct answer
    mov ah, 9
    mov dx, offset correct
    int 21h
    inc score
    ret
wrong_ans:
    mov ah, 9
    mov dx, offset wrong
    int 21h
    ret
check_answer endp   
clear_screen proc
    mov ah, 0        
    mov al, 3        
    int 10h          
    ret
clear_screen endp
end main

ret




