.syntax unified
.cpu cortex-m4

.global uint_1
uint_1: .quad 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.global uint_set
.type uint_set, %function

uint_set:
  str r1, [r0], #4
  mov r1, #0
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  bx lr

.global uint_bit
.type uint_bit, %function

uint_bit:
  ubfx r2, r1, #5, #27
  ldr r0, [r0, r2, lsl #2]
  ubfx r2, r1, #0, #5
  lsr r0, r0, r2
  and r0, r0, #1
  bx lr

.global uint_add3
.type uint_add3, %function

uint_add3:
  push {r4-r12}
  ldmia r2!, {r3-r7}
  ldmia r1!, {r8-r12}
  adds r3, r3, r8
  adcs r4, r4, r9
  adcs r5, r5, r10
  adcs r6, r6, r11
  adcs r7, r7, r12
  stmia r0!, {r3-r7}
  ldmia r2!, {r3-r7}
  ldmia r1!, {r8-r12}
  adcs r3, r3, r8
  adcs r4, r4, r9
  adcs r5, r5, r10
  adcs r6, r6, r11
  adcs r7, r7, r12
  stmia r0!, {r3-r7}
  ldmia r2, {r2-r7}
  ldmia r1, {r1,r8-r12}
  adcs r2, r2, r1
  adcs r3, r3, r8
  adcs r4, r4, r9
  adcs r5, r5, r10
  adcs r6, r6, r11
  adcs r7, r7, r12
  stmia r0!, {r2-r7}
  mov r0, #0
  it cs
  movcs r0, #1
  pop {r4-r12}
  bx lr

.global uint_sub3
.type uint_sub3, %function

uint_sub3:
  push {r4-r12}
  ldmia r1!, {r3-r7}
  ldmia r2!, {r8-r12}
  subs r3, r3, r8
  sbcs r4, r4, r9
  sbcs r5, r5, r10
  sbcs r6, r6, r11
  sbcs r7, r7, r12
  stmia r0!, {r3-r7}
  ldmia r1!, {r3-r7}
  ldmia r2!, {r8-r12}
  sbcs r3, r3, r8
  sbcs r4, r4, r9
  sbcs r5, r5, r10
  sbcs r6, r6, r11
  sbcs r7, r7, r12
  stmia r0!, {r3-r7}
  ldmia r1, {r1,r3-r7}
  ldmia r2, {r2,r8-r12}
  sbcs r2, r1, r2
  sbcs r3, r3, r8
  sbcs r4, r4, r9
  sbcs r5, r5, r10
  sbcs r6, r6, r11
  sbcs r7, r7, r12
  stmia r0, {r2-r7}
  mov r0, #0
  it cc
  movcc r0, #1
  pop {r4-r12}
  bx lr

.global uint_mul3_64
.type uint_mul3_64, %function

uint_mul3_64:
  push {r4-r12,r14}
  ldmia r1!, {r6-r12,r14}
  umull r3, r4, r6, r2
  umull r5, r6, r8, r2
  umlal r4, r5, r7, r2
  umull r7, r8, r10, r2
  umlal r6, r7, r9, r2
  umull r9, r10, r12, r2
  umlal r8, r9, r11, r2
  mov r11, #0
  umlal r10, r11, r14, r2
  stmia r0!, {r3-r10}
  ldmia r1, {r3-r10}
  umull r12, r14, r4, r2
  umlal r11, r12, r3, r2
  umull r1, r3, r6, r2
  umlal r14, r1, r5, r2
  stmia r0!, {r11,r12,r14}
  umull r4, r5, r8, r2
  umlal r3, r4, r7, r2
  mul r6, r10, r2
  umlal r5, r6, r9, r2
  stmia r0, {r1,r3-r6}
  pop {r4-r12,r14}
  bx lr
