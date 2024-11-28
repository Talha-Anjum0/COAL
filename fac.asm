; factorial.asm
org 100h          ; Origin for .COM files

section .data
    prompt db 'Enter a number (0-9): $'
    result_msg db 'Factorial is: $'
    result db 0    ; To store the final result
    newline db 0Dh, 0Ah, '$' ; New line for formatting

section .bss
    num resb 1     ; Buffer to store user input (one character)

section .text
start:
    ; Print prompt
    mov ah, 09h       ; DOS function: print string
    lea dx, [prompt]  ; Load address of prompt
    int 21h           ; Call DOS interrupt

    ; Read user input
    mov ah, 01h       ; DOS function: read character
    int 21h           ; Call DOS interrupt
    sub al, '0'       ; Convert ASCII to integer (0-9)
    mov bl, al        ; Store the number in BL
    mov [num], bl     ; Store the number in memory

    ; Initialize result to 1
    mov al, 1
    mov [result], al

    ; Calculate factorial
factorial_loop:
    cmp bl, 1         ; Compare BL with 1
    jle done          ; If BL <= 1, jump to done

    ; Multiply result by BL
    mov al, [result]  ; Load current result into AL
    mul bl            ; AL = AL * BL
    mov [result], al  ; Store new result

    ; Decrease BL and repeat
    dec bl            ; Decrement BL by 1
    jmp factorial_loop ; Repeat loop

done:
    ; Print result message
    mov ah, 09h       ; DOS function: print string
    lea dx, [result_msg] ; Load address of result message
    int 21h           ; Call DOS interrupt

    ; Convert result to ASCII and print
    mov al, [result]  ; Load result into AL
    add al, '0'       ; Convert to ASCII
    mov dl, al        ; Store ASCII character in DL
    mov ah, 02h       ; DOS function: print character
    int 21h           ; Call DOS interrupt

    ; Print newline
    mov ah, 09h       ; DOS function: print string
    lea dx, [newline] ; Load address of newline
    int 21h           ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch       ; DOS function: terminate program
    int 21h           ; Call DOS interrupt

