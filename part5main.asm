;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
Start:

			cmp.w R5,R4   ; R4>R5

			jl less ; R4<R5

			jeq equal ; R4 = R5

			jmp greater

			jmp $;


less:
			mov.w #000Ah, &2000h
			mov.w #0009h, &2002h
			mov.w #0008h, &2004h
			mov.w #0007h, &2006h
			mov.w #0006h, &2008h

			add #0001h,R4


			jmp Start

equal:
			jmp $;


greater:
			mov.w #0001h, &2000h
			mov.w #0002h, &2002h
			mov.w #0003h, &2004h
			mov.w #0004h, &2006h
			mov.w #0005h, &2008h

			sub #0001h,R4

			jmp Start

			NOP

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
