// Implementation of multiplication function for cortex M4
//
// The code is derived from the simulation code in the tests/asmM0.cc file.
//
// B. Haase, Endress + Hauser Conducta GmbH & Ko. KG
// Editted by C. Boel (stripped modulo calculation)
//
// public domain
//
// Code is now tested on the target and on the PC.

#include "attributesForCortexM4.inc"

	.code	16

	.file	"cortex_m4_sqr_256.s"

	.text
	.align	2

// ****************************************************
// Implementation of 256-bit square.
// uses packed non-redundant representation.
//
//
// implements the interface
//
// void
// square256_asm (uint32_t *pResult, const uint32_t *pVal1);
//
// in:
//    r0 == ptr to Result word
//    r1 == prt to value to square

	.global	square256_asm
	.type	square256_asm, %function
square256_asm:

// ######################
// ASM 256-bit Square for M4:
// ######################
 // START: 256-bit squaring for M4
 // r0 = result ptr, r1 = operand ptr.

   .syntax unified
    push {r0,r4,r5,r6,r7,r8,r9,r10,r11,r12,r14}
   .syntax divided
	 	mov r14, r0
    add SP,#-20

    .syntax unified
    ldr r0,[r1,#0]
    ldr r2,[r1,#4]
    ldr r3,[r1,#8]
    ldr r4,[r1,#12]
    ldr r5,[r1,#16]
    ldr r6,[r1,#20]
    umull r7,r8,r0,r2
    umull r9,r10,r0,r0
    umaal r7,r10,r0,r2
    umaal r8,r10,r2,r2
    str r9,[r14,#0] // z1
    str r7,[r14,#4] // z2
    umull r7,r9,r0,r4
    umull r11,r12,r0,r3
    adds r11,r11
    eor r14,r14
    umaal r8,r11,r8,r14
    umaal r10,r11,r10,r14
    str r8,[SP,#8] // z3
    umaal r7,r12,r2,r3
    adcs r7,r7
    umaal r7,r10,r7,r14
    str r7,[SP,#12] // z4
    add r10,r11
    ldr r7,[r1,#24]
    ldr r8,[r1,#28]
    umull r1,r11,r0,r6
    umaal r9,r12,r0,r5
    umaal r1,r12,r2,r5
    umaal r11,r12,r0,r7
    umlal r9,r14,r2,r4 // z5, z6?
    umaal r1,r14,r3,r4
    umaal r11,r14,r2,r6
    umaal r12,r14,r0,r8
    adcs r9,r9
    adcs r1,r1
    eor r0,r0
    umaal r9,r10,r3,r3
    str r9,[SP,#16] // z5
    umaal r1,r10,r1,r0
    umlal r11,r0,r3,r5
    umaal r0,r12,r2,r7
    umaal r12,r14,r2,r8
    adcs r11,r11
    umaal r10,r11,r4,r4 // z7, z8?
    eor r2,r2
    umlal r0,r2,r3,r6
    umaal r2,r12,r3,r7
    umaal r12,r14,r3,r8
    eor r3,r3
    umlal r0,r3,r4,r5
    umaal r2,r3,r4,r6
    umaal r3,r12,r4,r7
    umaal r12,r14,r4,r8
    adcs r0,r0
    eor r9,r9
    umaal r0,r11,r0,r9
    adcs r2,r2
    umlal r3,r9,r5,r6
    umaal r9,r12,r5,r7
    umaal r12,r14,r5,r8
    eor r4,r4
    umlal r12,r4,r6,r7
    umaal r4,r14,r6,r8
    umaal r2,r11,r5,r5 // z9, z10?
    eor r5,r5
    adcs r3,r3
    umaal r3,r11,r3,r5
    umlal r14,r5,r7,r8
    adcs r9,r9
    adcs r12,r12
    adcs r4,r4
    adcs r14,r14
    adcs r5,r5
    umaal r9,r11,r6,r6 // z11, z12?
    eor r6,r6
    umaal r11,r12,r11,r6
    umaal r4,r12,r7,r7 // z13, z14?
    umaal r12,r14,r12,r6
    umaal r5,r14,r8,r8 // z15, z16
    adcs r14,r6
		// Stack: z1-z5
		// r1 = z6
		// r10 = z7
		// r0 = z8
		// r2 = z9
		// r3 = z10
		// r9 = z11
		// r11= z12
		// r4 = z13
		// r12= z14
		// r5 = z15
		// r14= z16
		// Cutoff?
		ldr r6, [SP, #20] // Output pointer
		add r6, r6, #8
		ldr r7, [SP, #8]
		ldr r8, [SP, #12]
		stmia r6!, {r7,r8}
		ldr r7, [SP, #16]
		str r7, [r6], #4
		stmia r6!, {r1,r10}
		stmia r6!, {r0,r2,r3,r9,r11}
		stmia r6!, {r4,r12}
		stmia r6!, {r5,r14}
    add SP,#24
    pop {r4,r5,r6,r7,r8,r9,r10,r11,r12,r15} // bx lr in disguise

	.size	square256_asm, .-square256_asm
