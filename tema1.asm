%include "io.inc"

section .data
    %include "input.inc"
    errorString: db "Baza incorecta",0 ; error message

section .text
global CMAIN
CMAIN:
    mov ebp, esp ; for correct debugging
    
    ; initialize to zero
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    mov eax, dword [numar] ; number to convert
    mov ebx, dword [baza] ; base
    
    ; we make sure base is between 2 and 16
    ; otherwise we print error message
    cmp ebx, 2
    jl incorrect_base
    cmp ebx, 16
    jg incorrect_base
    
    ; if the base is in range we convert the number
    jmp base_compute ; compute number in specified base
    
incorrect_base:
    PRINT_STRING errorString
    jmp end_of_program ; skip the rest of program
    
base_compute: ; repetitive divisions
    xor edx, edx ; edx needs to be zero; it can have the remainder of division in it
    div ebx ; do the division
    push edx ; store the remainder
    inc ecx ; we need to know how many steps it took to finish    
    cmp eax, 0 ; we divide while dividend is not zero
    jg base_compute
    
base_print:
    pop eax ; return the remainder in LIFO order
    cmp eax, 10 ; different interpretations of the remainder
    jl number_digit ; if remainder is < 10, then it is interpreted as number
    jmp letter_digit ; if remainder is >= 10, then it is interpreted as letter

number_digit: ; a digit is treated exactly how it is
    mov edx, '0' ; code ASCII for '0'
    add edx, eax ; code ASCII for all digits, depending on eax
    jmp print_digit ; skip letter digit interpretation
    
letter_digit: ; a digit is treated as a letter
    mov edx, 'a' ; code ASCII for 'a'
    sub eax, 10 ; we have max 6 letter, for the remainder from 10 to 15
    add edx, eax ; code ASCII for all letter digits needed, depending on eax

print_digit:
    PRINT_CHAR edx ; printing de digit
    dec ecx ; loop takes the same number of steps as the repetitive divisions
    cmp ecx, 0
    jg base_print
    
end_of_program:
    ret