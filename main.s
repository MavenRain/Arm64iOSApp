//
//  main.s
//  RetipCacheClient
//
//  Created by SolomonRain on 8/7/16.
//  Copyright © 2016 TheObiGLLC. All rights reserved.
//

.text
.globl _didFinishLaunching
.align	2
_didFinishLaunching:
	stp	x28, x27, [sp, #-32]!
	stp	x29, x30, [sp, #16]
	add	x29, sp, #16
    sub sp, sp, #64
    adrp x0, alloc@PAGE
    add x0, x0, alloc@PAGEOFF
    bl _sel_getUid
    mov x6, x0
    adrp x0, UIWindow@PAGE
    add x0, x0, UIWindow@PAGEOFF
    bl _objc_getClass
    mov x1, x6
	bl	_objc_msgSend
    mov x15, x0
	adrp	x0, UIScreen@PAGE
	add	x0, x0, UIScreen@PAGEOFF
	bl	_objc_getClass
    mov x6, x0
	adrp	x0, mainScreen@PAGE
	add	x0, x0, mainScreen@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    mov x0, x6
	bl	_objc_msgSend
    mov x14, x0
	adrp	x0, bounds@PAGE
	add	x0, x0, bounds@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    mov x0, x14
	bl	_objc_msgSend
    fmov d4, d2
    mov x14, x15
	adrp	x0, initWithFrame@PAGE
	add	x0, x0, initWithFrame@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    mov x0, x14
    fmov d2, d4
    ldr d0, [x29, #-96]
	bl	_objc_msgSend
    str	x0, [x29, #-56]
	adrp	x0, UIColor@PAGE
	add	x0, x0, UIColor@PAGEOFF
	bl	_objc_getClass
    mov x6, x0
	adrp	x0, greenColor@PAGE
	add	x0, x0, greenColor@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    mov x0, x6
	bl	_objc_msgSend
    mov x6, x0
    ldr x14, [x29, #-56]
	adrp	x0, setBackgroundColor@PAGE
	add	x0, x0, setBackgroundColor@PAGEOFF
	bl	_sel_getUid
    mov x2, x6
    mov x1, x0
    mov x0, x14
	bl	_objc_msgSend
	adrp	x0, UIViewController@PAGE
	add	x0, x0, UIViewController@PAGEOFF
	bl	_objc_getClass
    mov x14, x0
	adrp	x0, alloc@PAGE
	add	x0, x0, alloc@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    mov x0, x14
	bl	_objc_msgSend
    mov x14, x0
	adrp	x0, init@PAGE
	add	x0, x0, init@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    mov x0, x14
	bl	_objc_msgSend
    mov x14, x0
	ldr	x15, [x29, #-56]
	adrp	x0, setRootViewController@PAGE
	add	x0, x0, setRootViewController@PAGEOFF
	bl	_sel_getUid
    mov x2, x14
    mov x1, x0
    mov x0, x15
	bl	_objc_msgSend
	adrp	x0, makeKeyAndVisible@PAGE
	add	x0, x0, makeKeyAndVisible@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    ldr x0, [x29, #-56]
	bl	_objc_msgSend
    movz w8, #1
    movz w0, #1
	sub	sp, x29, #16
	ldp	x29, x30, [sp, #16]
	ldp	x28, x27, [sp], #32
	ret

	.globl	_main
	.align	2
_main:
	stp	x29, x30, [sp, #-16]!
	mov	 x29, sp
    adrp x0, NSAutoreleasePool@PAGE
    add x0, x0, NSAutoreleasePool@PAGEOFF
    bl _objc_getClass
    mov x7, x0
    adrp x0, alloc@PAGE
    add x0, x0, alloc@PAGEOFF
    bl _sel_getUid
    mov x1, x0
    mov x0, x7
    bl _objc_msgSend
    mov x7, x0
    adrp x0, init@PAGE
    add x0, x0, init@PAGEOFF
    bl _sel_getUid
    mov x1, x0
    mov x0, x7
    bl _objc_msgSend
    mov x13, x0
	adrp	x0, UIResponder@PAGE
	add	x0, x0, UIResponder@PAGEOFF
	bl	_objc_getClass
	adrp	x1, AppDelegate@PAGE
	add	x1, x1, AppDelegate@PAGEOFF
    movz x2, #0
	bl	_objc_allocateClassPair
    mov x7, x0
	adrp	x1, window@PAGE
	add	x1, x1, window@PAGEOFF
    movz x2, #0x8
    movz x3, #0
	bl	_class_addIvar
    mov x1, x7
    mov x18, x7
	adrp	x0, applicationDidFinishLaunchingWithOptions@PAGE
	add	x0, x0, applicationDidFinishLaunchingWithOptions@PAGEOFF
	bl	_sel_getUid
    mov x1, x0
    adrp x2, _didFinishLaunching@PAGE
    add x2, x2, _didFinishLaunching@PAGEOFF
	adrp	x3, typeDescription@PAGE
	add	x3, x3, typeDescription@PAGEOFF
    mov x0, x18
	bl	_class_replaceMethod
    mov x0, x18
	bl	_objc_registerClassPair
	adrp	x0, NSString@PAGE
	add	x0, x0, NSString@PAGEOFF
	bl	_objc_getClass
    mov x15, x0
	adrp	x0, stringWithUTF8String@PAGE
	add	x0, x0, stringWithUTF8String@PAGEOFF
	bl	_sel_getUid
	adrp	x2, AppDelegate@PAGE
	add	x2, x2, AppDelegate@PAGEOFF
    mov x1, x0
    mov x0, x15
	bl	_objc_msgSend
    mov x3, x0
	movz x2, #0
    movz w0, #0
    movz x1, #0
	bl	_UIApplicationMain
    adrp x0, drain@PAGE
    add x0, x0, drain@PAGEOFF
    bl _sel_getUid
    mov x1, x0
    mov x0, x13
    bl _objc_msgSend
    movz x0, #0
	mov	 sp, x29
	ldp	x29, x30, [sp], #16
	ret

	.section	__TEXT,__cstring,cstring_literals
UIWindow:
	.asciz	"UIWindow"

alloc:
	.asciz	"alloc"

UIScreen:
	.asciz	"UIScreen"

mainScreen:
	.asciz	"mainScreen"

bounds:
	.asciz	"bounds"

initWithFrame:
	.asciz	"initWithFrame:"

UIColor:
	.asciz	"UIColor"

greenColor:
	.asciz	"greenColor"

setBackgroundColor:
	.asciz	"setBackgroundColor:"

UIViewController:
	.asciz	"UIViewController"

init:
	.asciz	"init"

setRootViewController:
	.asciz	"setRootViewController:"

makeKeyAndVisible:
	.asciz	"makeKeyAndVisible"

UIResponder:
	.asciz	"UIResponder"

AppDelegate:
	.asciz	"AppDelegate"

window:
	.asciz	"window"

applicationDidFinishLaunchingWithOptions:
	.asciz	"application:didFinishLaunchingWithOptions:"

typeDescription:
	.asciz	"i@:??"

NSString:
	.asciz	"NSString"

stringWithUTF8String:
	.asciz	"stringWithUTF8String:"

NSAutoreleasePool:
    .asciz "NSAutoreleasePool"

drain:
    .asciz "drain"
























