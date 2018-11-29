	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"uint.c"
	.section	.rodata
	.align	2
	.type	primes, %object
	.size	primes, 296
primes:
	.word	3
	.word	5
	.word	7
	.word	11
	.word	13
	.word	17
	.word	19
	.word	23
	.word	29
	.word	31
	.word	37
	.word	41
	.word	43
	.word	47
	.word	53
	.word	59
	.word	61
	.word	67
	.word	71
	.word	73
	.word	79
	.word	83
	.word	89
	.word	97
	.word	101
	.word	103
	.word	107
	.word	109
	.word	113
	.word	127
	.word	131
	.word	137
	.word	139
	.word	149
	.word	151
	.word	157
	.word	163
	.word	167
	.word	173
	.word	179
	.word	181
	.word	191
	.word	193
	.word	197
	.word	199
	.word	211
	.word	223
	.word	227
	.word	229
	.word	233
	.word	239
	.word	241
	.word	251
	.word	257
	.word	263
	.word	269
	.word	271
	.word	277
	.word	281
	.word	283
	.word	293
	.word	307
	.word	311
	.word	313
	.word	317
	.word	331
	.word	337
	.word	347
	.word	349
	.word	353
	.word	359
	.word	367
	.word	373
	.word	587
	.global	uint_1
	.align	2
	.type	uint_1, %object
	.size	uint_1, 64
uint_1:
	.word	1
	.space	60
	.text
	.align	2
	.global	uint_set
	.type	uint_set, %function
uint_set:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r1, #0
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	bls	.L3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	uint_set, .-uint_set
	.align	2
	.global	uint_bit
	.type	uint_bit, %function
uint_bit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, r3, lsr #5
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-12]
	and	r3, r3, #31
	mov	r3, r2, lsr r3
	and	r3, r3, #1
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	uint_bit, .-uint_bit
	.align	2
	.global	uint_add3
	.type	uint_add3, %function
uint_add3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L7
.L8:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r1, [r3, r2, asl #2]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	sub	r3, fp, #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	m4_add_overflow
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	ldr	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	mov	r2, r3
	bl	m4_add_overflow
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	orr	r3, r3, r2
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L7:
	ldr	r3, [fp, #-12]
	cmp	r3, #15
	bls	.L8
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	uint_add3, .-uint_add3
	.align	2
	.global	uint_sub3
	.type	uint_sub3, %function
uint_sub3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L11
.L12:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r1, [r3, r2, asl #2]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	sub	r3, fp, #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	m4_sub_overflow
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	ldr	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	mov	r2, r3
	bl	m4_sub_overflow
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	orr	r3, r3, r2
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L11:
	ldr	r3, [fp, #-12]
	cmp	r3, #15
	bls	.L12
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	uint_sub3, .-uint_sub3
	.align	2
	.global	uint_mul3_64
	.type	uint_mul3_64, %function
uint_mul3_64:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, fp}
	add	fp, sp, #20
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L15
.L16:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-28]
	ldr	r3, [r3, r2, asl #2]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, [fp, #-48]
	mov	r4, #0
	mul	ip, r3, r2
	mul	r0, r1, r4
	add	r0, ip, r0
	umull	r5, r6, r1, r3
	add	r3, r0, r6
	mov	r6, r3
	ldr	r3, [fp, #-24]
	mov	r4, #0
	adds	r3, r3, r5
	adc	r4, r4, r6
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	mov	r7, r4
	mov	r8, #0
	mov	r3, r7
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-28]
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L15:
	ldr	r3, [fp, #-28]
	cmp	r3, #15
	bls	.L16
	sub	sp, fp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp}
	bx	lr
	.size	uint_mul3_64, .-uint_mul3_64
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
