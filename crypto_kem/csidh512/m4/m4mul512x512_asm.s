#include "attributesForCortexM4.inc"

.syntax unified

.text

.global difference
.type	difference, %function
difference:
  push {r4-r12,r14}
  ldmia r0, {r3-r10}
  ldmia r1!, {r0,r11,r12,r14}
  subs r3, r3, r0
  sbcs r4, r4, r11
  sbcs r5, r5, r12
  sbcs r6, r6, r14
  ldmia r1, {r0,r11,r12,r14}
  sbcs r7, r7, r0
  sbcs r8, r8, r11
  sbcs r9, r9, r12
  sbcs r10, r10, r14
  mov r0, #0xFFFFFFFF
  adc r0, #0
  eor r3, r3, r0
  eor r4, r4, r0
  eor r5, r5, r0
  eor r6, r6, r0
  eor r7, r7, r0
  eor r8, r8, r0
  eor r9, r9, r0
  eor r10, r10, r0
  subs r3, r3, r0
  sbcs r4, r4, r0
  sbcs r5, r5, r0
  sbcs r6, r6, r0
  sbcs r7, r7, r0
  sbcs r8, r8, r0
  sbcs r9, r9, r0
  sbcs r10, r10, r0
  stmia r2, {r3-r10}
  pop {r4-r12,r14}
  bx lr

.global refine
.type	refine, %function
refine:
  push {r4-r12,r14}
  ldmia r0!, {r1-r8} // Source o[8-15], write o[16] back.
  mov r14, r0
  ldmia r0!, {r9-r12} // Source o[16-20], write o[21] back.
  adds r1, r1, r9
  adcs r2, r2, r10
  adcs r3, r3, r11
  adcs r4, r4, r12
  ldmia r0!, {r9-r12} // Source o[21-23].
  adcs r5, r5, r9
  adcs r6, r6, r10
  adcs r7, r7, r11
  adcs r8, r8, r12
  // stmia r14, {r1-r8} // Save o[16-23]

  ldmia r0, {r9-r12} // Source o[24-27]
  adcs r9, r9, #0
  adcs r10, r10, #0
  adcs r11, r11, #0
  adcs r12, r12, #0
  stmia r0!, {r9-r12}
  ldmia r0, {r9-r12}
  adcs r9, r9, #0
  adcs r10, r10, #0
  adcs r11, r11, #0
  adcs r12, r12, #0
  stmia r0, {r9-r12} // Save o[28-31]

  // Caret H in o[16] finished, now adding leftovers.
  sub r9, r14, #64 // o[0]
  sub r0, r14, #32 // o[8]
  ldmia r9!, {r10-r12,r14}
  adds r10, r1, r10
  adcs r11, r2, r11
  adcs r12, r3, r12
  adcs r14, r4, r14
  stmia r0!, {r10-r12,r14}
  ldmia r9!, {r10-r12,r14}
  adcs r10, r5, r10
  adcs r11, r6, r11
  adcs r12, r7, r12
  adcs r14, r8, r14
  stmia r0!, {r10-r12,r14}
  add r9, r9, #64 // o[24]
  ldmia r9!, {r10-r12,r14}
  adcs r1, r1, r10
  adcs r2, r2, r11
  adcs r3, r3, r12
  adcs r4, r4, r14
  stmia r0!, {r1-r4} // o[16-19]
  ldmia r9, {r1-r4}
  adcs r5, r5, r1
  adcs r6, r6, r2
  adcs r7, r7, r3
  adcs r8, r8, r4
  adcs r10, r10, #0
  adcs r11, r11, #0
  adcs r12, r12, #0
  adcs r14, r14, #0
  adcs r1, r1, #0
  adcs r2, r2, #0
  adcs r3, r3, #0
  adcs r4, r4, #0
  stmia r0!, {r5-r8,r10-r12,r14} // o[20-27]
  stmia r0, {r1-r4} // o[28-31]

  pop {r4-r12,r14}
  bx lr

.global M //More interleaving
.type	M, %function
M:
  push {r4-r12,r14}
  ldmia r1, {r3-r12,r14} //m[0-10]
  eor r3, r3, r2
  eor r4, r4, r2
  eor r5, r5, r2
  eor r6, r6, r2
  eor r7, r7, r2
  eor r8, r8, r2
  eor r9, r9, r2
  eor r10, r10, r2
  eor r11, r11, r2
  eor r12, r12, r2
  eor r14, r14, r2
  subs r3, r3, r2
  sbcs r4, r4, r2
  sbcs r5, r5, r2
  sbcs r6, r6, r2
  sbcs r7, r7, r2
  sbcs r8, r8, r2
  sbcs r9, r9, r2
  sbcs r10, r10, r2
  sbcs r11, r11, r2
  sbcs r12, r12, r2
  sbcs r14, r14, r2
  add r1, r1, #24
  stmia r1!, {r9-r12,r14}
  //Quickfix
  mov r14, #0
  sbc r14, r14, #0
  rsb r14, r14, #0
  mul r2, r2, r14
  //Done: Heck if I know why this happens ;-;
  ldmia r1, {r9-r12,r14}
  eor r9, r9, r2
  eor r10, r10, r2
  eor r11, r11, r2
  eor r12, r12, r2
  eor r14, r14, r2
  sbcs r9, r9, r2
  sbcs r10, r10, r2
  sbcs r11, r11, r2
  sbcs r12, r12, r2
  sbcs r14, r14, r2
  stmia r1, {r9-r12,r14}
  sub r1, r1, #20
  ldmia r0, {r9-r12,r14}
  subs r9, r9, r3
  sbcs r10, r10, r4
  sbcs r11, r11, r5
  sbcs r12, r12, r6
  sbcs r14, r14, r7
  stmia r0!, {r9-r12,r14}
  ldmia r0, {r3-r7}
  ldmia r1!, {r9-r12}
  sbcs r3, r3, r8
  sbcs r4, r4, r9
  sbcs r5, r5, r10
  sbcs r6, r6, r11
  sbcs r7, r7, r12
  stmia r0!, {r3-r7}
  ldmia r0, {r3-r8}
  ldmia r1, {r1,r9-r12,r14}
  sbcs r3, r3, r1
  sbcs r4, r4, r9
  sbcs r5, r5, r10
  sbcs r6, r6, r11
  sbcs r7, r7, r12
  sbcs r8, r8, r14
  stmia r0!, {r3-r8}
  ldmia r0, {r3-r10}
  sbcs r3, r3, r2
  sbcs r4, r4, r2
  sbcs r5, r5, r2
  sbcs r6, r6, r2
  sbcs r7, r7, r2
  sbcs r8, r8, r2
  sbcs r9, r9, r2
  sbcs r10, r10, r2
  stmia r0, {r3-r10}
  pop {r4-r12,r14}
  bx lr

// Montgomery Reduction Functions

.macro stepp2
  ldmia r0, {r10-r12,r14} // t[0-3]
  ldmia r1!, {r6-r9} // p[0-3]

  mul r4, r10, r2 // u
  // Lock r0-r4

  mov r5, #0
  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9

  stmia r0!, {r10-r12,r14}
  ldmia r0, {r10-r12,r14}
  ldmia r1!, {r6-r9}

  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9

  stmia r0!, {r10-r12,r14}
  ldmia r0, {r10-r12,r14}
  ldmia r1!, {r6-r9}

  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9

  stmia r0!, {r10-r12,r14}
  ldmia r0, {r10-r12,r14}
  ldmia r1!, {r6-r9}

  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9
  stmia r0!, {r10-r12,r14}

  add r5, r5, r3
  mov r3, #0

  ldr r6, [r0]
  adds r6, r6, r5
  adcs r3, #0 // Carry overflow handle
  str r6, [r0]
.endm

.global mmul
.type	mmul, %function
mmul:
  push {r4-r12,r14}
  push {r3}
  mov r3, #0
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  sub r0, #60
  sub r1, #64
  stepp2

  ldr r6, [r0, #4]
  adc r6, r6, r3
  str r6, [r0, #4]

  // ldmia r0, {r5-r6}
  // adcs r5, r5, r4
  // adcs r6, #0
  // stmia r0!, {r5-r6}

  sub r0, #60
  sub r1, #64

  // Last pass
  pop {r3}

  ldmia r0!, {r10-r12,r14}
  ldmia r1!, {r6-r9}

  mul r4, r10, r2 // u
  // Lock r0-r4

  mov r5, #0
  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9

  stmia r3!, {r11-r12,r14}
  ldmia r0!, {r10-r12,r14}
  ldmia r1!, {r6-r9}

  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9

  stmia r3!, {r10-r12,r14}
  ldmia r0!, {r10-r12,r14}
  ldmia r1!, {r6-r9}

  umaal r10, r5, r4, r6
  umaal r11, r5, r4, r7
  umaal r12, r5, r4, r8
  umaal r14, r5, r4, r9

  stmia r3!, {r10-r12,r14}
  ldmia r0!, {r2,r10-r12,r14}
  ldmia r1!, {r6-r9}

  umaal r2, r5, r4, r6
  umaal r10, r5, r4, r7
  umaal r11, r5, r4, r8
  umaal r12, r5, r4, r9

  adds r14, r14, r5
  stmia r3!, {r2,r10-r12,r14}

  pop {r4-r12,r14}
  bx lr
