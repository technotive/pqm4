.syntax unified
.cpu cortex-m4

.global uint_1
uint_1: .quad 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.global uint_set
.type uint_set, %function

.macro batch_set
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
  str r1, [r0], #4
.endm

uint_set:
  str r1, [r0], #4
  mov r1, #0
  batch_set
  batch_set
  batch_set
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

.macro m4add
  ldr r4, [r2], #4
  ldr r3, [r1], #4
  adcs r3, r3, r4
  str r3, [r0], #4
.endm

uint_add3:
  push {r4}
  ldr r3, [r1], #4
  ldr r4, [r2], #4
  adds r3, r3, r4
  str r3, [r0], #4
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  m4add
  mov r0, #0
  it cs
  movcs r0, #1
  pop {r4}
  bx lr

.global uint_sub3
.type uint_sub3, %function

.macro m4sub, o
  ldr r4, [r2], #4
  ldr r3, [r1], #4
  sbcs r3, r3, r4
  str r3, [r0], #4
.endm

uint_sub3:
  push {r4}
  ldr r3, [r1], #4
  ldr r4, [r2], #4
  subs r3, r3, r4
  str r3, [r0], #4
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  m4sub
  mov r0, #0
  it cc
  movcc r0, #1
  pop {r4}
  bx lr

.global uint_mul3_64
.type uint_mul3_64, %function

uint_mul3_64:
  push {r4-r12}
  ldr r3, [r1, #0]
  umull r3, r4, r3, r2
  str r3, [r0], #4
  ldr r12, [r1, #8]
  umull r5, r6, r12, r2
  ldr r12, [r1, #16]
  umull r7, r8, r12, r2
  ldr r12, [r1, #24]
  umull r9, r10, r12, r2
  ldr r12, [r1, #32]
  ldr r3, [r1, #4]
  umull r11, r12, r12, r2
  umlal r4, r5, r3, r2
  ldr r3, [r1, #12]
  stmia r0!, {r4, r5}
  umlal r6, r7, r3, r2
  ldr r3, [r1, #20]
  stmia r0!, {r6, r7}
  umlal r8, r9, r3, r2
  ldr r3, [r1, #28]
  stmia r0!, {r8, r9}
  umlal r10, r11, r3, r2
  stmia r0!, {r10, r11}
  ldr r11, [r1, #40]
  umull r3, r4, r11, r2
  ldr r11, [r1, #48]
  umull r5, r6, r11, r2
  ldr r11, [r1, #56]
  umull r7, r8, r11, r2
  ldr r11, [r1, #36]
  umlal r12, r3, r11, r2
  ldr r11, [r1, #44]
  stmia r0! {r12, r3}
  umlal r4, r5, r11, r2
  ldr r11, [r1, #52]
  stmia r0!, {r4, r5}
  umlal r6, r7, r11, r2
  ldr r11, [r1, #60]
  stmia r0!, {r6, r7}
  umlal r8, r9, r11, r2
  str r8, [r0]
  pop {r4-r12}
  bx lr
