
nothing.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010074 <_start>:
   10074:	00002197          	auipc	gp,0x2
   10078:	d4c18193          	addi	gp,gp,-692 # 11dc0 <__global_pointer$>
   1007c:	c3418513          	addi	a0,gp,-972 # 119f4 <_edata>
   10080:	c5018613          	addi	a2,gp,-944 # 11a10 <__BSS_END__>
   10084:	40a60633          	sub	a2,a2,a0
   10088:	00000593          	li	a1,0
   1008c:	274000ef          	jal	ra,10300 <memset>
   10090:	00000517          	auipc	a0,0x0
   10094:	16c50513          	addi	a0,a0,364 # 101fc <__libc_fini_array>
   10098:	120000ef          	jal	ra,101b8 <atexit>
   1009c:	1bc000ef          	jal	ra,10258 <__libc_init_array>
   100a0:	00012503          	lw	a0,0(sp)
   100a4:	00410593          	addi	a1,sp,4
   100a8:	00000613          	li	a2,0
   100ac:	0ec000ef          	jal	ra,10198 <main>
   100b0:	11c0006f          	j	101cc <exit>

000100b4 <_fini>:
   100b4:	00008067          	ret

000100b8 <deregister_tm_clones>:
   100b8:	c2818713          	addi	a4,gp,-984 # 119e8 <_global_impure_ptr>
   100bc:	c2818793          	addi	a5,gp,-984 # 119e8 <_global_impure_ptr>
   100c0:	00e78c63          	beq	a5,a4,100d8 <deregister_tm_clones+0x20>
   100c4:	00000337          	lui	t1,0x0
   100c8:	00030313          	mv	t1,t1
   100cc:	00030663          	beqz	t1,100d8 <deregister_tm_clones+0x20>
   100d0:	c2818513          	addi	a0,gp,-984 # 119e8 <_global_impure_ptr>
   100d4:	00030067          	jr	t1 # 0 <_start-0x10074>
   100d8:	00008067          	ret

000100dc <register_tm_clones>:
   100dc:	c2818593          	addi	a1,gp,-984 # 119e8 <_global_impure_ptr>
   100e0:	c2818793          	addi	a5,gp,-984 # 119e8 <_global_impure_ptr>
   100e4:	40f585b3          	sub	a1,a1,a5
   100e8:	4025d593          	srai	a1,a1,0x2
   100ec:	00200793          	li	a5,2
   100f0:	02f5c5b3          	div	a1,a1,a5
   100f4:	00058c63          	beqz	a1,1010c <register_tm_clones+0x30>
   100f8:	00000337          	lui	t1,0x0
   100fc:	00030313          	mv	t1,t1
   10100:	00030663          	beqz	t1,1010c <register_tm_clones+0x30>
   10104:	c2818513          	addi	a0,gp,-984 # 119e8 <_global_impure_ptr>
   10108:	00030067          	jr	t1 # 0 <_start-0x10074>
   1010c:	00008067          	ret

00010110 <__do_global_dtors_aux>:
   10110:	c341c703          	lbu	a4,-972(gp) # 119f4 <_edata>
   10114:	04071663          	bnez	a4,10160 <__do_global_dtors_aux+0x50>
   10118:	ff010113          	addi	sp,sp,-16
   1011c:	00812423          	sw	s0,8(sp)
   10120:	00112623          	sw	ra,12(sp)
   10124:	00078413          	mv	s0,a5
   10128:	f91ff0ef          	jal	ra,100b8 <deregister_tm_clones>
   1012c:	000007b7          	lui	a5,0x0
   10130:	00078793          	mv	a5,a5
   10134:	00078a63          	beqz	a5,10148 <__do_global_dtors_aux+0x38>
   10138:	00011537          	lui	a0,0x11
   1013c:	5b050513          	addi	a0,a0,1456 # 115b0 <__FRAME_END__>
   10140:	00000097          	auipc	ra,0x0
   10144:	000000e7          	jalr	zero # 0 <_start-0x10074>
   10148:	00100793          	li	a5,1
   1014c:	c2f18a23          	sb	a5,-972(gp) # 119f4 <_edata>
   10150:	00c12083          	lw	ra,12(sp)
   10154:	00812403          	lw	s0,8(sp)
   10158:	01010113          	addi	sp,sp,16
   1015c:	00008067          	ret
   10160:	00008067          	ret

00010164 <frame_dummy>:
   10164:	000007b7          	lui	a5,0x0
   10168:	00078793          	mv	a5,a5
   1016c:	02078463          	beqz	a5,10194 <frame_dummy+0x30>
   10170:	00011537          	lui	a0,0x11
   10174:	ff010113          	addi	sp,sp,-16
   10178:	c3818593          	addi	a1,gp,-968 # 119f8 <object.5437>
   1017c:	5b050513          	addi	a0,a0,1456 # 115b0 <__FRAME_END__>
   10180:	00112623          	sw	ra,12(sp)
   10184:	00000097          	auipc	ra,0x0
   10188:	000000e7          	jalr	zero # 0 <_start-0x10074>
   1018c:	00c12083          	lw	ra,12(sp)
   10190:	01010113          	addi	sp,sp,16
   10194:	f49ff06f          	j	100dc <register_tm_clones>

00010198 <main>:
   10198:	ff010113          	addi	sp,sp,-16
   1019c:	00812623          	sw	s0,12(sp)
   101a0:	01010413          	addi	s0,sp,16
   101a4:	00000793          	li	a5,0
   101a8:	00078513          	mv	a0,a5
   101ac:	00c12403          	lw	s0,12(sp)
   101b0:	01010113          	addi	sp,sp,16
   101b4:	00008067          	ret

000101b8 <atexit>:
   101b8:	00050593          	mv	a1,a0
   101bc:	00000693          	li	a3,0
   101c0:	00000613          	li	a2,0
   101c4:	00000513          	li	a0,0
   101c8:	2140006f          	j	103dc <__register_exitproc>

000101cc <exit>:
   101cc:	ff010113          	addi	sp,sp,-16
   101d0:	00000593          	li	a1,0
   101d4:	00812423          	sw	s0,8(sp)
   101d8:	00112623          	sw	ra,12(sp)
   101dc:	00050413          	mv	s0,a0
   101e0:	278000ef          	jal	ra,10458 <__call_exitprocs>
   101e4:	c281a503          	lw	a0,-984(gp) # 119e8 <_global_impure_ptr>
   101e8:	03c52783          	lw	a5,60(a0)
   101ec:	00078463          	beqz	a5,101f4 <exit+0x28>
   101f0:	000780e7          	jalr	a5 # 0 <_start-0x10074>
   101f4:	00040513          	mv	a0,s0
   101f8:	36c000ef          	jal	ra,10564 <_exit>

000101fc <__libc_fini_array>:
   101fc:	ff010113          	addi	sp,sp,-16
   10200:	000117b7          	lui	a5,0x11
   10204:	00812423          	sw	s0,8(sp)
   10208:	00011437          	lui	s0,0x11
   1020c:	5b878713          	addi	a4,a5,1464 # 115b8 <__init_array_end>
   10210:	5bc40413          	addi	s0,s0,1468 # 115bc <__fini_array_end>
   10214:	40e40433          	sub	s0,s0,a4
   10218:	00912223          	sw	s1,4(sp)
   1021c:	00112623          	sw	ra,12(sp)
   10220:	40245413          	srai	s0,s0,0x2
   10224:	5b878493          	addi	s1,a5,1464
   10228:	00041c63          	bnez	s0,10240 <__libc_fini_array+0x44>
   1022c:	00812403          	lw	s0,8(sp)
   10230:	00c12083          	lw	ra,12(sp)
   10234:	00412483          	lw	s1,4(sp)
   10238:	01010113          	addi	sp,sp,16
   1023c:	e79ff06f          	j	100b4 <_fini>
   10240:	fff40413          	addi	s0,s0,-1
   10244:	00241793          	slli	a5,s0,0x2
   10248:	00f487b3          	add	a5,s1,a5
   1024c:	0007a783          	lw	a5,0(a5)
   10250:	000780e7          	jalr	a5
   10254:	fd5ff06f          	j	10228 <__libc_fini_array+0x2c>

00010258 <__libc_init_array>:
   10258:	ff010113          	addi	sp,sp,-16
   1025c:	000117b7          	lui	a5,0x11
   10260:	00812423          	sw	s0,8(sp)
   10264:	00011437          	lui	s0,0x11
   10268:	5b478713          	addi	a4,a5,1460 # 115b4 <__frame_dummy_init_array_entry>
   1026c:	5b440413          	addi	s0,s0,1460 # 115b4 <__frame_dummy_init_array_entry>
   10270:	40e40433          	sub	s0,s0,a4
   10274:	00912223          	sw	s1,4(sp)
   10278:	01212023          	sw	s2,0(sp)
   1027c:	00112623          	sw	ra,12(sp)
   10280:	40245413          	srai	s0,s0,0x2
   10284:	00000493          	li	s1,0
   10288:	5b478913          	addi	s2,a5,1460
   1028c:	04849263          	bne	s1,s0,102d0 <__libc_init_array+0x78>
   10290:	e25ff0ef          	jal	ra,100b4 <_fini>
   10294:	000117b7          	lui	a5,0x11
   10298:	00011437          	lui	s0,0x11
   1029c:	5b478713          	addi	a4,a5,1460 # 115b4 <__frame_dummy_init_array_entry>
   102a0:	5b840413          	addi	s0,s0,1464 # 115b8 <__init_array_end>
   102a4:	40e40433          	sub	s0,s0,a4
   102a8:	40245413          	srai	s0,s0,0x2
   102ac:	00000493          	li	s1,0
   102b0:	5b478913          	addi	s2,a5,1460
   102b4:	02849a63          	bne	s1,s0,102e8 <__libc_init_array+0x90>
   102b8:	00c12083          	lw	ra,12(sp)
   102bc:	00812403          	lw	s0,8(sp)
   102c0:	00412483          	lw	s1,4(sp)
   102c4:	00012903          	lw	s2,0(sp)
   102c8:	01010113          	addi	sp,sp,16
   102cc:	00008067          	ret
   102d0:	00249793          	slli	a5,s1,0x2
   102d4:	00f907b3          	add	a5,s2,a5
   102d8:	0007a783          	lw	a5,0(a5)
   102dc:	00148493          	addi	s1,s1,1
   102e0:	000780e7          	jalr	a5
   102e4:	fa9ff06f          	j	1028c <__libc_init_array+0x34>
   102e8:	00249793          	slli	a5,s1,0x2
   102ec:	00f907b3          	add	a5,s2,a5
   102f0:	0007a783          	lw	a5,0(a5)
   102f4:	00148493          	addi	s1,s1,1
   102f8:	000780e7          	jalr	a5
   102fc:	fb9ff06f          	j	102b4 <__libc_init_array+0x5c>

00010300 <memset>:
   10300:	00f00313          	li	t1,15
   10304:	00050713          	mv	a4,a0
   10308:	02c37e63          	bgeu	t1,a2,10344 <memset+0x44>
   1030c:	00f77793          	andi	a5,a4,15
   10310:	0a079063          	bnez	a5,103b0 <memset+0xb0>
   10314:	08059263          	bnez	a1,10398 <memset+0x98>
   10318:	ff067693          	andi	a3,a2,-16
   1031c:	00f67613          	andi	a2,a2,15
   10320:	00e686b3          	add	a3,a3,a4
   10324:	00b72023          	sw	a1,0(a4)
   10328:	00b72223          	sw	a1,4(a4)
   1032c:	00b72423          	sw	a1,8(a4)
   10330:	00b72623          	sw	a1,12(a4)
   10334:	01070713          	addi	a4,a4,16
   10338:	fed766e3          	bltu	a4,a3,10324 <memset+0x24>
   1033c:	00061463          	bnez	a2,10344 <memset+0x44>
   10340:	00008067          	ret
   10344:	40c306b3          	sub	a3,t1,a2
   10348:	00269693          	slli	a3,a3,0x2
   1034c:	00000297          	auipc	t0,0x0
   10350:	005686b3          	add	a3,a3,t0
   10354:	00c68067          	jr	12(a3)
   10358:	00b70723          	sb	a1,14(a4)
   1035c:	00b706a3          	sb	a1,13(a4)
   10360:	00b70623          	sb	a1,12(a4)
   10364:	00b705a3          	sb	a1,11(a4)
   10368:	00b70523          	sb	a1,10(a4)
   1036c:	00b704a3          	sb	a1,9(a4)
   10370:	00b70423          	sb	a1,8(a4)
   10374:	00b703a3          	sb	a1,7(a4)
   10378:	00b70323          	sb	a1,6(a4)
   1037c:	00b702a3          	sb	a1,5(a4)
   10380:	00b70223          	sb	a1,4(a4)
   10384:	00b701a3          	sb	a1,3(a4)
   10388:	00b70123          	sb	a1,2(a4)
   1038c:	00b700a3          	sb	a1,1(a4)
   10390:	00b70023          	sb	a1,0(a4)
   10394:	00008067          	ret
   10398:	0ff5f593          	andi	a1,a1,255
   1039c:	00859693          	slli	a3,a1,0x8
   103a0:	00d5e5b3          	or	a1,a1,a3
   103a4:	01059693          	slli	a3,a1,0x10
   103a8:	00d5e5b3          	or	a1,a1,a3
   103ac:	f6dff06f          	j	10318 <memset+0x18>
   103b0:	00279693          	slli	a3,a5,0x2
   103b4:	00000297          	auipc	t0,0x0
   103b8:	005686b3          	add	a3,a3,t0
   103bc:	00008293          	mv	t0,ra
   103c0:	fa0680e7          	jalr	-96(a3)
   103c4:	00028093          	mv	ra,t0
   103c8:	ff078793          	addi	a5,a5,-16
   103cc:	40f70733          	sub	a4,a4,a5
   103d0:	00f60633          	add	a2,a2,a5
   103d4:	f6c378e3          	bgeu	t1,a2,10344 <memset+0x44>
   103d8:	f3dff06f          	j	10314 <memset+0x14>

000103dc <__register_exitproc>:
   103dc:	c281a703          	lw	a4,-984(gp) # 119e8 <_global_impure_ptr>
   103e0:	00050313          	mv	t1,a0
   103e4:	14872783          	lw	a5,328(a4)
   103e8:	00079663          	bnez	a5,103f4 <__register_exitproc+0x18>
   103ec:	14c70793          	addi	a5,a4,332
   103f0:	14f72423          	sw	a5,328(a4)
   103f4:	0047a703          	lw	a4,4(a5)
   103f8:	01f00813          	li	a6,31
   103fc:	fff00513          	li	a0,-1
   10400:	04e84a63          	blt	a6,a4,10454 <__register_exitproc+0x78>
   10404:	00271893          	slli	a7,a4,0x2
   10408:	02030c63          	beqz	t1,10440 <__register_exitproc+0x64>
   1040c:	01178533          	add	a0,a5,a7
   10410:	08c52423          	sw	a2,136(a0)
   10414:	1887a803          	lw	a6,392(a5)
   10418:	00100613          	li	a2,1
   1041c:	00e61633          	sll	a2,a2,a4
   10420:	00c86833          	or	a6,a6,a2
   10424:	1907a423          	sw	a6,392(a5)
   10428:	10d52423          	sw	a3,264(a0)
   1042c:	00200693          	li	a3,2
   10430:	00d31863          	bne	t1,a3,10440 <__register_exitproc+0x64>
   10434:	18c7a683          	lw	a3,396(a5)
   10438:	00c6e633          	or	a2,a3,a2
   1043c:	18c7a623          	sw	a2,396(a5)
   10440:	00170713          	addi	a4,a4,1
   10444:	00e7a223          	sw	a4,4(a5)
   10448:	011787b3          	add	a5,a5,a7
   1044c:	00b7a423          	sw	a1,8(a5)
   10450:	00000513          	li	a0,0
   10454:	00008067          	ret

00010458 <__call_exitprocs>:
   10458:	fd010113          	addi	sp,sp,-48
   1045c:	01312e23          	sw	s3,28(sp)
   10460:	c281a983          	lw	s3,-984(gp) # 119e8 <_global_impure_ptr>
   10464:	01412c23          	sw	s4,24(sp)
   10468:	01512a23          	sw	s5,20(sp)
   1046c:	01612823          	sw	s6,16(sp)
   10470:	02112623          	sw	ra,44(sp)
   10474:	02812423          	sw	s0,40(sp)
   10478:	02912223          	sw	s1,36(sp)
   1047c:	03212023          	sw	s2,32(sp)
   10480:	01712623          	sw	s7,12(sp)
   10484:	00050a93          	mv	s5,a0
   10488:	00058a13          	mv	s4,a1
   1048c:	00100b13          	li	s6,1
   10490:	1489a483          	lw	s1,328(s3)
   10494:	00048c63          	beqz	s1,104ac <__call_exitprocs+0x54>
   10498:	0044a403          	lw	s0,4(s1)
   1049c:	fff40913          	addi	s2,s0,-1
   104a0:	00241413          	slli	s0,s0,0x2
   104a4:	00848433          	add	s0,s1,s0
   104a8:	02095863          	bgez	s2,104d8 <__call_exitprocs+0x80>
   104ac:	02c12083          	lw	ra,44(sp)
   104b0:	02812403          	lw	s0,40(sp)
   104b4:	02412483          	lw	s1,36(sp)
   104b8:	02012903          	lw	s2,32(sp)
   104bc:	01c12983          	lw	s3,28(sp)
   104c0:	01812a03          	lw	s4,24(sp)
   104c4:	01412a83          	lw	s5,20(sp)
   104c8:	01012b03          	lw	s6,16(sp)
   104cc:	00c12b83          	lw	s7,12(sp)
   104d0:	03010113          	addi	sp,sp,48
   104d4:	00008067          	ret
   104d8:	000a0c63          	beqz	s4,104f0 <__call_exitprocs+0x98>
   104dc:	10442783          	lw	a5,260(s0)
   104e0:	01478863          	beq	a5,s4,104f0 <__call_exitprocs+0x98>
   104e4:	fff90913          	addi	s2,s2,-1
   104e8:	ffc40413          	addi	s0,s0,-4
   104ec:	fbdff06f          	j	104a8 <__call_exitprocs+0x50>
   104f0:	0044a703          	lw	a4,4(s1)
   104f4:	00442783          	lw	a5,4(s0)
   104f8:	fff70713          	addi	a4,a4,-1
   104fc:	03271c63          	bne	a4,s2,10534 <__call_exitprocs+0xdc>
   10500:	0124a223          	sw	s2,4(s1)
   10504:	fe0780e3          	beqz	a5,104e4 <__call_exitprocs+0x8c>
   10508:	1884a683          	lw	a3,392(s1)
   1050c:	012b1733          	sll	a4,s6,s2
   10510:	0044ab83          	lw	s7,4(s1)
   10514:	00d776b3          	and	a3,a4,a3
   10518:	02069263          	bnez	a3,1053c <__call_exitprocs+0xe4>
   1051c:	000780e7          	jalr	a5
   10520:	0044a783          	lw	a5,4(s1)
   10524:	f77796e3          	bne	a5,s7,10490 <__call_exitprocs+0x38>
   10528:	1489a783          	lw	a5,328(s3)
   1052c:	fa978ce3          	beq	a5,s1,104e4 <__call_exitprocs+0x8c>
   10530:	f61ff06f          	j	10490 <__call_exitprocs+0x38>
   10534:	00042223          	sw	zero,4(s0)
   10538:	fcdff06f          	j	10504 <__call_exitprocs+0xac>
   1053c:	18c4a683          	lw	a3,396(s1)
   10540:	08442583          	lw	a1,132(s0)
   10544:	00d77733          	and	a4,a4,a3
   10548:	00071863          	bnez	a4,10558 <__call_exitprocs+0x100>
   1054c:	000a8513          	mv	a0,s5
   10550:	000780e7          	jalr	a5
   10554:	fcdff06f          	j	10520 <__call_exitprocs+0xc8>
   10558:	00058513          	mv	a0,a1
   1055c:	000780e7          	jalr	a5
   10560:	fc1ff06f          	j	10520 <__call_exitprocs+0xc8>

00010564 <_exit>:
   10564:	00000593          	li	a1,0
   10568:	00000613          	li	a2,0
   1056c:	00000693          	li	a3,0
   10570:	00000713          	li	a4,0
   10574:	00000793          	li	a5,0
   10578:	05d00893          	li	a7,93
   1057c:	00000073          	ecall
   10580:	02055263          	bgez	a0,105a4 <_exit+0x40>
   10584:	ff010113          	addi	sp,sp,-16
   10588:	00812423          	sw	s0,8(sp)
   1058c:	00050413          	mv	s0,a0
   10590:	00112623          	sw	ra,12(sp)
   10594:	40800433          	neg	s0,s0
   10598:	010000ef          	jal	ra,105a8 <__errno>
   1059c:	00852023          	sw	s0,0(a0)
   105a0:	0000006f          	j	105a0 <_exit+0x3c>
   105a4:	0000006f          	j	105a4 <_exit+0x40>

000105a8 <__errno>:
   105a8:	c301a503          	lw	a0,-976(gp) # 119f0 <_impure_ptr>
   105ac:	00008067          	ret
