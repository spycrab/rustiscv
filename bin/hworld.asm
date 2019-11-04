
hworld.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010074 <register_fini>:
   10074:	000007b7          	lui	a5,0x0
   10078:	00078793          	mv	a5,a5
   1007c:	00078863          	beqz	a5,1008c <register_fini+0x18>
   10080:	00011537          	lui	a0,0x11
   10084:	91850513          	addi	a0,a0,-1768 # 10918 <__libc_fini_array>
   10088:	2980206f          	j	12320 <atexit>
   1008c:	00008067          	ret

00010090 <_start>:
   10090:	00005197          	auipc	gp,0x5
   10094:	d0818193          	addi	gp,gp,-760 # 14d98 <__global_pointer$>
   10098:	04418513          	addi	a0,gp,68 # 14ddc <_edata>
   1009c:	09c18613          	addi	a2,gp,156 # 14e34 <__BSS_END__>
   100a0:	40a60633          	sub	a2,a2,a0
   100a4:	00000593          	li	a1,0
   100a8:	1a4000ef          	jal	ra,1024c <memset>
   100ac:	00002517          	auipc	a0,0x2
   100b0:	27450513          	addi	a0,a0,628 # 12320 <atexit>
   100b4:	00050863          	beqz	a0,100c4 <_start+0x34>
   100b8:	00001517          	auipc	a0,0x1
   100bc:	86050513          	addi	a0,a0,-1952 # 10918 <__libc_fini_array>
   100c0:	260020ef          	jal	ra,12320 <atexit>
   100c4:	0ec000ef          	jal	ra,101b0 <__libc_init_array>
   100c8:	00012503          	lw	a0,0(sp)
   100cc:	00410593          	addi	a1,sp,4
   100d0:	00000613          	li	a2,0
   100d4:	07c000ef          	jal	ra,10150 <main>
   100d8:	0a80006f          	j	10180 <exit>

000100dc <__do_global_dtors_aux>:
   100dc:	0541c703          	lbu	a4,84(gp) # 14dec <completed.5490>
   100e0:	04071463          	bnez	a4,10128 <__do_global_dtors_aux+0x4c>
   100e4:	ff010113          	addi	sp,sp,-16
   100e8:	00812423          	sw	s0,8(sp)
   100ec:	00078413          	mv	s0,a5
   100f0:	000007b7          	lui	a5,0x0
   100f4:	00112623          	sw	ra,12(sp)
   100f8:	00078793          	mv	a5,a5
   100fc:	00078a63          	beqz	a5,10110 <__do_global_dtors_aux+0x34>
   10100:	00014537          	lui	a0,0x14
   10104:	58450513          	addi	a0,a0,1412 # 14584 <__FRAME_END__>
   10108:	00000097          	auipc	ra,0x0
   1010c:	000000e7          	jalr	zero # 0 <register_fini-0x10074>
   10110:	00100793          	li	a5,1
   10114:	00c12083          	lw	ra,12(sp)
   10118:	04f18a23          	sb	a5,84(gp) # 14dec <completed.5490>
   1011c:	00812403          	lw	s0,8(sp)
   10120:	01010113          	addi	sp,sp,16
   10124:	00008067          	ret
   10128:	00008067          	ret

0001012c <frame_dummy>:
   1012c:	000007b7          	lui	a5,0x0
   10130:	00078793          	mv	a5,a5
   10134:	00078c63          	beqz	a5,1014c <frame_dummy+0x20>
   10138:	00014537          	lui	a0,0x14
   1013c:	05818593          	addi	a1,gp,88 # 14df0 <object.5495>
   10140:	58450513          	addi	a0,a0,1412 # 14584 <__FRAME_END__>
   10144:	00000317          	auipc	t1,0x0
   10148:	00000067          	jr	zero # 0 <register_fini-0x10074>
   1014c:	00008067          	ret

00010150 <main>:
   10150:	ff010113          	addi	sp,sp,-16
   10154:	00112623          	sw	ra,12(sp)
   10158:	00812423          	sw	s0,8(sp)
   1015c:	01010413          	addi	s0,sp,16
   10160:	000137b7          	lui	a5,0x13
   10164:	57478513          	addi	a0,a5,1396 # 13574 <__modsi3+0x30>
   10168:	290000ef          	jal	ra,103f8 <puts>
   1016c:	00000013          	nop
   10170:	00c12083          	lw	ra,12(sp)
   10174:	00812403          	lw	s0,8(sp)
   10178:	01010113          	addi	sp,sp,16
   1017c:	00008067          	ret

00010180 <exit>:
   10180:	ff010113          	addi	sp,sp,-16
   10184:	00000593          	li	a1,0
   10188:	00812423          	sw	s0,8(sp)
   1018c:	00112623          	sw	ra,12(sp)
   10190:	00050413          	mv	s0,a0
   10194:	2fc000ef          	jal	ra,10490 <__call_exitprocs>
   10198:	0301a503          	lw	a0,48(gp) # 14dc8 <_global_impure_ptr>
   1019c:	03c52783          	lw	a5,60(a0)
   101a0:	00078463          	beqz	a5,101a8 <exit+0x28>
   101a4:	000780e7          	jalr	a5
   101a8:	00040513          	mv	a0,s0
   101ac:	7c5020ef          	jal	ra,13170 <_exit>

000101b0 <__libc_init_array>:
   101b0:	ff010113          	addi	sp,sp,-16
   101b4:	00812423          	sw	s0,8(sp)
   101b8:	01212023          	sw	s2,0(sp)
   101bc:	00014437          	lui	s0,0x14
   101c0:	00014937          	lui	s2,0x14
   101c4:	58840793          	addi	a5,s0,1416 # 14588 <__init_array_start>
   101c8:	58890913          	addi	s2,s2,1416 # 14588 <__init_array_start>
   101cc:	40f90933          	sub	s2,s2,a5
   101d0:	00112623          	sw	ra,12(sp)
   101d4:	00912223          	sw	s1,4(sp)
   101d8:	40295913          	srai	s2,s2,0x2
   101dc:	02090063          	beqz	s2,101fc <__libc_init_array+0x4c>
   101e0:	58840413          	addi	s0,s0,1416
   101e4:	00000493          	li	s1,0
   101e8:	00042783          	lw	a5,0(s0)
   101ec:	00148493          	addi	s1,s1,1
   101f0:	00440413          	addi	s0,s0,4
   101f4:	000780e7          	jalr	a5
   101f8:	fe9918e3          	bne	s2,s1,101e8 <__libc_init_array+0x38>
   101fc:	00014437          	lui	s0,0x14
   10200:	00014937          	lui	s2,0x14
   10204:	58840793          	addi	a5,s0,1416 # 14588 <__init_array_start>
   10208:	59090913          	addi	s2,s2,1424 # 14590 <__init_array_end>
   1020c:	40f90933          	sub	s2,s2,a5
   10210:	40295913          	srai	s2,s2,0x2
   10214:	02090063          	beqz	s2,10234 <__libc_init_array+0x84>
   10218:	58840413          	addi	s0,s0,1416
   1021c:	00000493          	li	s1,0
   10220:	00042783          	lw	a5,0(s0)
   10224:	00148493          	addi	s1,s1,1
   10228:	00440413          	addi	s0,s0,4
   1022c:	000780e7          	jalr	a5
   10230:	fe9918e3          	bne	s2,s1,10220 <__libc_init_array+0x70>
   10234:	00c12083          	lw	ra,12(sp)
   10238:	00812403          	lw	s0,8(sp)
   1023c:	00412483          	lw	s1,4(sp)
   10240:	00012903          	lw	s2,0(sp)
   10244:	01010113          	addi	sp,sp,16
   10248:	00008067          	ret

0001024c <memset>:
   1024c:	00f00313          	li	t1,15
   10250:	00050713          	mv	a4,a0
   10254:	02c37e63          	bgeu	t1,a2,10290 <memset+0x44>
   10258:	00f77793          	andi	a5,a4,15
   1025c:	0a079063          	bnez	a5,102fc <memset+0xb0>
   10260:	08059263          	bnez	a1,102e4 <memset+0x98>
   10264:	ff067693          	andi	a3,a2,-16
   10268:	00f67613          	andi	a2,a2,15
   1026c:	00e686b3          	add	a3,a3,a4
   10270:	00b72023          	sw	a1,0(a4)
   10274:	00b72223          	sw	a1,4(a4)
   10278:	00b72423          	sw	a1,8(a4)
   1027c:	00b72623          	sw	a1,12(a4)
   10280:	01070713          	addi	a4,a4,16
   10284:	fed766e3          	bltu	a4,a3,10270 <memset+0x24>
   10288:	00061463          	bnez	a2,10290 <memset+0x44>
   1028c:	00008067          	ret
   10290:	40c306b3          	sub	a3,t1,a2
   10294:	00269693          	slli	a3,a3,0x2
   10298:	00000297          	auipc	t0,0x0
   1029c:	005686b3          	add	a3,a3,t0
   102a0:	00c68067          	jr	12(a3)
   102a4:	00b70723          	sb	a1,14(a4)
   102a8:	00b706a3          	sb	a1,13(a4)
   102ac:	00b70623          	sb	a1,12(a4)
   102b0:	00b705a3          	sb	a1,11(a4)
   102b4:	00b70523          	sb	a1,10(a4)
   102b8:	00b704a3          	sb	a1,9(a4)
   102bc:	00b70423          	sb	a1,8(a4)
   102c0:	00b703a3          	sb	a1,7(a4)
   102c4:	00b70323          	sb	a1,6(a4)
   102c8:	00b702a3          	sb	a1,5(a4)
   102cc:	00b70223          	sb	a1,4(a4)
   102d0:	00b701a3          	sb	a1,3(a4)
   102d4:	00b70123          	sb	a1,2(a4)
   102d8:	00b700a3          	sb	a1,1(a4)
   102dc:	00b70023          	sb	a1,0(a4)
   102e0:	00008067          	ret
   102e4:	0ff5f593          	andi	a1,a1,255
   102e8:	00859693          	slli	a3,a1,0x8
   102ec:	00d5e5b3          	or	a1,a1,a3
   102f0:	01059693          	slli	a3,a1,0x10
   102f4:	00d5e5b3          	or	a1,a1,a3
   102f8:	f6dff06f          	j	10264 <memset+0x18>
   102fc:	00279693          	slli	a3,a5,0x2
   10300:	00000297          	auipc	t0,0x0
   10304:	005686b3          	add	a3,a3,t0
   10308:	00008293          	mv	t0,ra
   1030c:	fa0680e7          	jalr	-96(a3)
   10310:	00028093          	mv	ra,t0
   10314:	ff078793          	addi	a5,a5,-16
   10318:	40f70733          	sub	a4,a4,a5
   1031c:	00f60633          	add	a2,a2,a5
   10320:	f6c378e3          	bgeu	t1,a2,10290 <memset+0x44>
   10324:	f3dff06f          	j	10260 <memset+0x14>

00010328 <_puts_r>:
   10328:	fc010113          	addi	sp,sp,-64
   1032c:	02812c23          	sw	s0,56(sp)
   10330:	00050413          	mv	s0,a0
   10334:	00058513          	mv	a0,a1
   10338:	02912a23          	sw	s1,52(sp)
   1033c:	02112e23          	sw	ra,60(sp)
   10340:	00058493          	mv	s1,a1
   10344:	0c0000ef          	jal	ra,10404 <strlen>
   10348:	000137b7          	lui	a5,0x13
   1034c:	58078793          	addi	a5,a5,1408 # 13580 <__modsi3+0x3c>
   10350:	02f12423          	sw	a5,40(sp)
   10354:	00100793          	li	a5,1
   10358:	02f12623          	sw	a5,44(sp)
   1035c:	03842703          	lw	a4,56(s0)
   10360:	02010793          	addi	a5,sp,32
   10364:	00150693          	addi	a3,a0,1
   10368:	00f12a23          	sw	a5,20(sp)
   1036c:	00200793          	li	a5,2
   10370:	02912023          	sw	s1,32(sp)
   10374:	02a12223          	sw	a0,36(sp)
   10378:	00d12e23          	sw	a3,28(sp)
   1037c:	00f12c23          	sw	a5,24(sp)
   10380:	00842583          	lw	a1,8(s0)
   10384:	06070063          	beqz	a4,103e4 <_puts_r+0xbc>
   10388:	00c59783          	lh	a5,12(a1)
   1038c:	01279713          	slli	a4,a5,0x12
   10390:	02074263          	bltz	a4,103b4 <_puts_r+0x8c>
   10394:	0645a703          	lw	a4,100(a1)
   10398:	000026b7          	lui	a3,0x2
   1039c:	00d7e7b3          	or	a5,a5,a3
   103a0:	ffffe6b7          	lui	a3,0xffffe
   103a4:	fff68693          	addi	a3,a3,-1 # ffffdfff <__BSS_END__+0xfffe91cb>
   103a8:	00d77733          	and	a4,a4,a3
   103ac:	00f59623          	sh	a5,12(a1)
   103b0:	06e5a223          	sw	a4,100(a1)
   103b4:	01410613          	addi	a2,sp,20
   103b8:	00040513          	mv	a0,s0
   103bc:	5b8000ef          	jal	ra,10974 <__sfvwrite_r>
   103c0:	03c12083          	lw	ra,60(sp)
   103c4:	03812403          	lw	s0,56(sp)
   103c8:	00a03533          	snez	a0,a0
   103cc:	40a00533          	neg	a0,a0
   103d0:	ff557513          	andi	a0,a0,-11
   103d4:	03412483          	lw	s1,52(sp)
   103d8:	00a50513          	addi	a0,a0,10
   103dc:	04010113          	addi	sp,sp,64
   103e0:	00008067          	ret
   103e4:	00040513          	mv	a0,s0
   103e8:	00b12623          	sw	a1,12(sp)
   103ec:	4ec000ef          	jal	ra,108d8 <__sinit>
   103f0:	00c12583          	lw	a1,12(sp)
   103f4:	f95ff06f          	j	10388 <_puts_r+0x60>

000103f8 <puts>:
   103f8:	00050593          	mv	a1,a0
   103fc:	0381a503          	lw	a0,56(gp) # 14dd0 <_impure_ptr>
   10400:	f29ff06f          	j	10328 <_puts_r>

00010404 <strlen>:
   10404:	00357793          	andi	a5,a0,3
   10408:	00050713          	mv	a4,a0
   1040c:	04079c63          	bnez	a5,10464 <strlen+0x60>
   10410:	7f7f86b7          	lui	a3,0x7f7f8
   10414:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__BSS_END__+0x7f7e314b>
   10418:	fff00593          	li	a1,-1
   1041c:	00072603          	lw	a2,0(a4)
   10420:	00470713          	addi	a4,a4,4
   10424:	00d677b3          	and	a5,a2,a3
   10428:	00d787b3          	add	a5,a5,a3
   1042c:	00c7e7b3          	or	a5,a5,a2
   10430:	00d7e7b3          	or	a5,a5,a3
   10434:	feb784e3          	beq	a5,a1,1041c <strlen+0x18>
   10438:	ffc74683          	lbu	a3,-4(a4)
   1043c:	ffd74603          	lbu	a2,-3(a4)
   10440:	ffe74783          	lbu	a5,-2(a4)
   10444:	40a70733          	sub	a4,a4,a0
   10448:	04068063          	beqz	a3,10488 <strlen+0x84>
   1044c:	02060a63          	beqz	a2,10480 <strlen+0x7c>
   10450:	00f03533          	snez	a0,a5
   10454:	00e50533          	add	a0,a0,a4
   10458:	ffe50513          	addi	a0,a0,-2
   1045c:	00008067          	ret
   10460:	fa0688e3          	beqz	a3,10410 <strlen+0xc>
   10464:	00074783          	lbu	a5,0(a4)
   10468:	00170713          	addi	a4,a4,1
   1046c:	00377693          	andi	a3,a4,3
   10470:	fe0798e3          	bnez	a5,10460 <strlen+0x5c>
   10474:	40a70733          	sub	a4,a4,a0
   10478:	fff70513          	addi	a0,a4,-1
   1047c:	00008067          	ret
   10480:	ffd70513          	addi	a0,a4,-3
   10484:	00008067          	ret
   10488:	ffc70513          	addi	a0,a4,-4
   1048c:	00008067          	ret

00010490 <__call_exitprocs>:
   10490:	fd010113          	addi	sp,sp,-48
   10494:	01412c23          	sw	s4,24(sp)
   10498:	0301aa03          	lw	s4,48(gp) # 14dc8 <_global_impure_ptr>
   1049c:	03212023          	sw	s2,32(sp)
   104a0:	02112623          	sw	ra,44(sp)
   104a4:	148a2903          	lw	s2,328(s4)
   104a8:	02812423          	sw	s0,40(sp)
   104ac:	02912223          	sw	s1,36(sp)
   104b0:	01312e23          	sw	s3,28(sp)
   104b4:	01512a23          	sw	s5,20(sp)
   104b8:	01612823          	sw	s6,16(sp)
   104bc:	01712623          	sw	s7,12(sp)
   104c0:	01812423          	sw	s8,8(sp)
   104c4:	04090063          	beqz	s2,10504 <__call_exitprocs+0x74>
   104c8:	00050b13          	mv	s6,a0
   104cc:	00058b93          	mv	s7,a1
   104d0:	00100a93          	li	s5,1
   104d4:	fff00993          	li	s3,-1
   104d8:	00492483          	lw	s1,4(s2)
   104dc:	fff48413          	addi	s0,s1,-1
   104e0:	02044263          	bltz	s0,10504 <__call_exitprocs+0x74>
   104e4:	00249493          	slli	s1,s1,0x2
   104e8:	009904b3          	add	s1,s2,s1
   104ec:	040b8463          	beqz	s7,10534 <__call_exitprocs+0xa4>
   104f0:	1044a783          	lw	a5,260(s1)
   104f4:	05778063          	beq	a5,s7,10534 <__call_exitprocs+0xa4>
   104f8:	fff40413          	addi	s0,s0,-1
   104fc:	ffc48493          	addi	s1,s1,-4
   10500:	ff3416e3          	bne	s0,s3,104ec <__call_exitprocs+0x5c>
   10504:	02c12083          	lw	ra,44(sp)
   10508:	02812403          	lw	s0,40(sp)
   1050c:	02412483          	lw	s1,36(sp)
   10510:	02012903          	lw	s2,32(sp)
   10514:	01c12983          	lw	s3,28(sp)
   10518:	01812a03          	lw	s4,24(sp)
   1051c:	01412a83          	lw	s5,20(sp)
   10520:	01012b03          	lw	s6,16(sp)
   10524:	00c12b83          	lw	s7,12(sp)
   10528:	00812c03          	lw	s8,8(sp)
   1052c:	03010113          	addi	sp,sp,48
   10530:	00008067          	ret
   10534:	00492783          	lw	a5,4(s2)
   10538:	0044a683          	lw	a3,4(s1)
   1053c:	fff78793          	addi	a5,a5,-1
   10540:	04878e63          	beq	a5,s0,1059c <__call_exitprocs+0x10c>
   10544:	0004a223          	sw	zero,4(s1)
   10548:	fa0688e3          	beqz	a3,104f8 <__call_exitprocs+0x68>
   1054c:	18892783          	lw	a5,392(s2)
   10550:	008a9733          	sll	a4,s5,s0
   10554:	00492c03          	lw	s8,4(s2)
   10558:	00f777b3          	and	a5,a4,a5
   1055c:	02079263          	bnez	a5,10580 <__call_exitprocs+0xf0>
   10560:	000680e7          	jalr	a3
   10564:	00492703          	lw	a4,4(s2)
   10568:	148a2783          	lw	a5,328(s4)
   1056c:	01871463          	bne	a4,s8,10574 <__call_exitprocs+0xe4>
   10570:	f8f904e3          	beq	s2,a5,104f8 <__call_exitprocs+0x68>
   10574:	f80788e3          	beqz	a5,10504 <__call_exitprocs+0x74>
   10578:	00078913          	mv	s2,a5
   1057c:	f5dff06f          	j	104d8 <__call_exitprocs+0x48>
   10580:	18c92783          	lw	a5,396(s2)
   10584:	0844a583          	lw	a1,132(s1)
   10588:	00f77733          	and	a4,a4,a5
   1058c:	00071c63          	bnez	a4,105a4 <__call_exitprocs+0x114>
   10590:	000b0513          	mv	a0,s6
   10594:	000680e7          	jalr	a3
   10598:	fcdff06f          	j	10564 <__call_exitprocs+0xd4>
   1059c:	00892223          	sw	s0,4(s2)
   105a0:	fa9ff06f          	j	10548 <__call_exitprocs+0xb8>
   105a4:	00058513          	mv	a0,a1
   105a8:	000680e7          	jalr	a3
   105ac:	fb9ff06f          	j	10564 <__call_exitprocs+0xd4>

000105b0 <__fp_lock>:
   105b0:	00000513          	li	a0,0
   105b4:	00008067          	ret

000105b8 <_cleanup_r>:
   105b8:	000125b7          	lui	a1,0x12
   105bc:	39058593          	addi	a1,a1,912 # 12390 <_fclose_r>
   105c0:	10d0006f          	j	10ecc <_fwalk_reent>

000105c4 <__sinit.part.0>:
   105c4:	fe010113          	addi	sp,sp,-32
   105c8:	000107b7          	lui	a5,0x10
   105cc:	00112e23          	sw	ra,28(sp)
   105d0:	00812c23          	sw	s0,24(sp)
   105d4:	00912a23          	sw	s1,20(sp)
   105d8:	01212823          	sw	s2,16(sp)
   105dc:	01312623          	sw	s3,12(sp)
   105e0:	01412423          	sw	s4,8(sp)
   105e4:	01512223          	sw	s5,4(sp)
   105e8:	01612023          	sw	s6,0(sp)
   105ec:	00452403          	lw	s0,4(a0)
   105f0:	5b878793          	addi	a5,a5,1464 # 105b8 <_cleanup_r>
   105f4:	02f52e23          	sw	a5,60(a0)
   105f8:	2ec50713          	addi	a4,a0,748
   105fc:	00300793          	li	a5,3
   10600:	2ee52423          	sw	a4,744(a0)
   10604:	2ef52223          	sw	a5,740(a0)
   10608:	2e052023          	sw	zero,736(a0)
   1060c:	00400793          	li	a5,4
   10610:	00050913          	mv	s2,a0
   10614:	00f42623          	sw	a5,12(s0)
   10618:	00800613          	li	a2,8
   1061c:	00000593          	li	a1,0
   10620:	06042223          	sw	zero,100(s0)
   10624:	00042023          	sw	zero,0(s0)
   10628:	00042223          	sw	zero,4(s0)
   1062c:	00042423          	sw	zero,8(s0)
   10630:	00042823          	sw	zero,16(s0)
   10634:	00042a23          	sw	zero,20(s0)
   10638:	00042c23          	sw	zero,24(s0)
   1063c:	05c40513          	addi	a0,s0,92
   10640:	c0dff0ef          	jal	ra,1024c <memset>
   10644:	00012b37          	lui	s6,0x12
   10648:	00892483          	lw	s1,8(s2)
   1064c:	00012ab7          	lui	s5,0x12
   10650:	00012a37          	lui	s4,0x12
   10654:	000129b7          	lui	s3,0x12
   10658:	000b0b13          	mv	s6,s6
   1065c:	064a8a93          	addi	s5,s5,100 # 12064 <__swrite>
   10660:	0eca0a13          	addi	s4,s4,236 # 120ec <__sseek>
   10664:	15498993          	addi	s3,s3,340 # 12154 <__sclose>
   10668:	000107b7          	lui	a5,0x10
   1066c:	03642023          	sw	s6,32(s0)
   10670:	03542223          	sw	s5,36(s0)
   10674:	03442423          	sw	s4,40(s0)
   10678:	03342623          	sw	s3,44(s0)
   1067c:	00842e23          	sw	s0,28(s0)
   10680:	00978793          	addi	a5,a5,9 # 10009 <register_fini-0x6b>
   10684:	00f4a623          	sw	a5,12(s1)
   10688:	00800613          	li	a2,8
   1068c:	00000593          	li	a1,0
   10690:	0604a223          	sw	zero,100(s1)
   10694:	0004a023          	sw	zero,0(s1)
   10698:	0004a223          	sw	zero,4(s1)
   1069c:	0004a423          	sw	zero,8(s1)
   106a0:	0004a823          	sw	zero,16(s1)
   106a4:	0004aa23          	sw	zero,20(s1)
   106a8:	0004ac23          	sw	zero,24(s1)
   106ac:	05c48513          	addi	a0,s1,92
   106b0:	b9dff0ef          	jal	ra,1024c <memset>
   106b4:	00c92403          	lw	s0,12(s2)
   106b8:	000207b7          	lui	a5,0x20
   106bc:	0364a023          	sw	s6,32(s1)
   106c0:	0354a223          	sw	s5,36(s1)
   106c4:	0344a423          	sw	s4,40(s1)
   106c8:	0334a623          	sw	s3,44(s1)
   106cc:	0094ae23          	sw	s1,28(s1)
   106d0:	01278793          	addi	a5,a5,18 # 20012 <__BSS_END__+0xb1de>
   106d4:	00f42623          	sw	a5,12(s0)
   106d8:	06042223          	sw	zero,100(s0)
   106dc:	00042023          	sw	zero,0(s0)
   106e0:	00042223          	sw	zero,4(s0)
   106e4:	00042423          	sw	zero,8(s0)
   106e8:	00042823          	sw	zero,16(s0)
   106ec:	00042a23          	sw	zero,20(s0)
   106f0:	00042c23          	sw	zero,24(s0)
   106f4:	05c40513          	addi	a0,s0,92
   106f8:	00800613          	li	a2,8
   106fc:	00000593          	li	a1,0
   10700:	b4dff0ef          	jal	ra,1024c <memset>
   10704:	01c12083          	lw	ra,28(sp)
   10708:	03642023          	sw	s6,32(s0)
   1070c:	03542223          	sw	s5,36(s0)
   10710:	03442423          	sw	s4,40(s0)
   10714:	03342623          	sw	s3,44(s0)
   10718:	00842e23          	sw	s0,28(s0)
   1071c:	01812403          	lw	s0,24(sp)
   10720:	00100793          	li	a5,1
   10724:	02f92c23          	sw	a5,56(s2)
   10728:	01412483          	lw	s1,20(sp)
   1072c:	01012903          	lw	s2,16(sp)
   10730:	00c12983          	lw	s3,12(sp)
   10734:	00812a03          	lw	s4,8(sp)
   10738:	00412a83          	lw	s5,4(sp)
   1073c:	00012b03          	lw	s6,0(sp)
   10740:	02010113          	addi	sp,sp,32
   10744:	00008067          	ret

00010748 <__fp_unlock>:
   10748:	00000513          	li	a0,0
   1074c:	00008067          	ret

00010750 <__sfmoreglue>:
   10750:	ff010113          	addi	sp,sp,-16
   10754:	fff58613          	addi	a2,a1,-1
   10758:	00812423          	sw	s0,8(sp)
   1075c:	00161413          	slli	s0,a2,0x1
   10760:	00c40433          	add	s0,s0,a2
   10764:	00241413          	slli	s0,s0,0x2
   10768:	00c40433          	add	s0,s0,a2
   1076c:	00341413          	slli	s0,s0,0x3
   10770:	01212023          	sw	s2,0(sp)
   10774:	00058913          	mv	s2,a1
   10778:	07440593          	addi	a1,s0,116
   1077c:	00912223          	sw	s1,4(sp)
   10780:	00112623          	sw	ra,12(sp)
   10784:	7fc000ef          	jal	ra,10f80 <_malloc_r>
   10788:	00050493          	mv	s1,a0
   1078c:	02050063          	beqz	a0,107ac <__sfmoreglue+0x5c>
   10790:	00c50513          	addi	a0,a0,12
   10794:	0004a023          	sw	zero,0(s1)
   10798:	0124a223          	sw	s2,4(s1)
   1079c:	00a4a423          	sw	a0,8(s1)
   107a0:	06840613          	addi	a2,s0,104
   107a4:	00000593          	li	a1,0
   107a8:	aa5ff0ef          	jal	ra,1024c <memset>
   107ac:	00c12083          	lw	ra,12(sp)
   107b0:	00812403          	lw	s0,8(sp)
   107b4:	00012903          	lw	s2,0(sp)
   107b8:	00048513          	mv	a0,s1
   107bc:	00412483          	lw	s1,4(sp)
   107c0:	01010113          	addi	sp,sp,16
   107c4:	00008067          	ret

000107c8 <__sfp>:
   107c8:	fe010113          	addi	sp,sp,-32
   107cc:	01212823          	sw	s2,16(sp)
   107d0:	0301a903          	lw	s2,48(gp) # 14dc8 <_global_impure_ptr>
   107d4:	01312623          	sw	s3,12(sp)
   107d8:	00112e23          	sw	ra,28(sp)
   107dc:	03892783          	lw	a5,56(s2)
   107e0:	00812c23          	sw	s0,24(sp)
   107e4:	00912a23          	sw	s1,20(sp)
   107e8:	00050993          	mv	s3,a0
   107ec:	0a078663          	beqz	a5,10898 <__sfp+0xd0>
   107f0:	2e090913          	addi	s2,s2,736
   107f4:	fff00493          	li	s1,-1
   107f8:	00492783          	lw	a5,4(s2)
   107fc:	00892403          	lw	s0,8(s2)
   10800:	fff78793          	addi	a5,a5,-1
   10804:	0007d863          	bgez	a5,10814 <__sfp+0x4c>
   10808:	0800006f          	j	10888 <__sfp+0xc0>
   1080c:	06840413          	addi	s0,s0,104
   10810:	06978c63          	beq	a5,s1,10888 <__sfp+0xc0>
   10814:	00c41703          	lh	a4,12(s0)
   10818:	fff78793          	addi	a5,a5,-1
   1081c:	fe0718e3          	bnez	a4,1080c <__sfp+0x44>
   10820:	ffff07b7          	lui	a5,0xffff0
   10824:	00178793          	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffdb1cd>
   10828:	06042223          	sw	zero,100(s0)
   1082c:	00042023          	sw	zero,0(s0)
   10830:	00042223          	sw	zero,4(s0)
   10834:	00042423          	sw	zero,8(s0)
   10838:	00f42623          	sw	a5,12(s0)
   1083c:	00042823          	sw	zero,16(s0)
   10840:	00042a23          	sw	zero,20(s0)
   10844:	00042c23          	sw	zero,24(s0)
   10848:	00800613          	li	a2,8
   1084c:	00000593          	li	a1,0
   10850:	05c40513          	addi	a0,s0,92
   10854:	9f9ff0ef          	jal	ra,1024c <memset>
   10858:	02042823          	sw	zero,48(s0)
   1085c:	02042a23          	sw	zero,52(s0)
   10860:	04042223          	sw	zero,68(s0)
   10864:	04042423          	sw	zero,72(s0)
   10868:	01c12083          	lw	ra,28(sp)
   1086c:	00040513          	mv	a0,s0
   10870:	01812403          	lw	s0,24(sp)
   10874:	01412483          	lw	s1,20(sp)
   10878:	01012903          	lw	s2,16(sp)
   1087c:	00c12983          	lw	s3,12(sp)
   10880:	02010113          	addi	sp,sp,32
   10884:	00008067          	ret
   10888:	00092403          	lw	s0,0(s2)
   1088c:	00040c63          	beqz	s0,108a4 <__sfp+0xdc>
   10890:	00040913          	mv	s2,s0
   10894:	f65ff06f          	j	107f8 <__sfp+0x30>
   10898:	00090513          	mv	a0,s2
   1089c:	d29ff0ef          	jal	ra,105c4 <__sinit.part.0>
   108a0:	f51ff06f          	j	107f0 <__sfp+0x28>
   108a4:	00400593          	li	a1,4
   108a8:	00098513          	mv	a0,s3
   108ac:	ea5ff0ef          	jal	ra,10750 <__sfmoreglue>
   108b0:	00a92023          	sw	a0,0(s2)
   108b4:	00050413          	mv	s0,a0
   108b8:	fc051ce3          	bnez	a0,10890 <__sfp+0xc8>
   108bc:	00c00793          	li	a5,12
   108c0:	00f9a023          	sw	a5,0(s3)
   108c4:	fa5ff06f          	j	10868 <__sfp+0xa0>

000108c8 <_cleanup>:
   108c8:	0301a503          	lw	a0,48(gp) # 14dc8 <_global_impure_ptr>
   108cc:	000125b7          	lui	a1,0x12
   108d0:	39058593          	addi	a1,a1,912 # 12390 <_fclose_r>
   108d4:	5f80006f          	j	10ecc <_fwalk_reent>

000108d8 <__sinit>:
   108d8:	03852783          	lw	a5,56(a0)
   108dc:	00078463          	beqz	a5,108e4 <__sinit+0xc>
   108e0:	00008067          	ret
   108e4:	ce1ff06f          	j	105c4 <__sinit.part.0>

000108e8 <__sfp_lock_acquire>:
   108e8:	00008067          	ret

000108ec <__sfp_lock_release>:
   108ec:	00008067          	ret

000108f0 <__sinit_lock_acquire>:
   108f0:	00008067          	ret

000108f4 <__sinit_lock_release>:
   108f4:	00008067          	ret

000108f8 <__fp_lock_all>:
   108f8:	0381a503          	lw	a0,56(gp) # 14dd0 <_impure_ptr>
   108fc:	000105b7          	lui	a1,0x10
   10900:	5b058593          	addi	a1,a1,1456 # 105b0 <__fp_lock>
   10904:	5240006f          	j	10e28 <_fwalk>

00010908 <__fp_unlock_all>:
   10908:	0381a503          	lw	a0,56(gp) # 14dd0 <_impure_ptr>
   1090c:	000105b7          	lui	a1,0x10
   10910:	74858593          	addi	a1,a1,1864 # 10748 <__fp_unlock>
   10914:	5140006f          	j	10e28 <_fwalk>

00010918 <__libc_fini_array>:
   10918:	ff010113          	addi	sp,sp,-16
   1091c:	00812423          	sw	s0,8(sp)
   10920:	000147b7          	lui	a5,0x14
   10924:	00014437          	lui	s0,0x14
   10928:	59040413          	addi	s0,s0,1424 # 14590 <__init_array_end>
   1092c:	59478793          	addi	a5,a5,1428 # 14594 <__fini_array_end>
   10930:	408787b3          	sub	a5,a5,s0
   10934:	00912223          	sw	s1,4(sp)
   10938:	00112623          	sw	ra,12(sp)
   1093c:	4027d493          	srai	s1,a5,0x2
   10940:	02048063          	beqz	s1,10960 <__libc_fini_array+0x48>
   10944:	ffc78793          	addi	a5,a5,-4
   10948:	00878433          	add	s0,a5,s0
   1094c:	00042783          	lw	a5,0(s0)
   10950:	fff48493          	addi	s1,s1,-1
   10954:	ffc40413          	addi	s0,s0,-4
   10958:	000780e7          	jalr	a5
   1095c:	fe0498e3          	bnez	s1,1094c <__libc_fini_array+0x34>
   10960:	00c12083          	lw	ra,12(sp)
   10964:	00812403          	lw	s0,8(sp)
   10968:	00412483          	lw	s1,4(sp)
   1096c:	01010113          	addi	sp,sp,16
   10970:	00008067          	ret

00010974 <__sfvwrite_r>:
   10974:	00862783          	lw	a5,8(a2)
   10978:	32078e63          	beqz	a5,10cb4 <__sfvwrite_r+0x340>
   1097c:	00c5d783          	lhu	a5,12(a1)
   10980:	fd010113          	addi	sp,sp,-48
   10984:	02812423          	sw	s0,40(sp)
   10988:	01412c23          	sw	s4,24(sp)
   1098c:	01512a23          	sw	s5,20(sp)
   10990:	02112623          	sw	ra,44(sp)
   10994:	02912223          	sw	s1,36(sp)
   10998:	03212023          	sw	s2,32(sp)
   1099c:	01312e23          	sw	s3,28(sp)
   109a0:	01612823          	sw	s6,16(sp)
   109a4:	01712623          	sw	s7,12(sp)
   109a8:	01812423          	sw	s8,8(sp)
   109ac:	01912223          	sw	s9,4(sp)
   109b0:	01a12023          	sw	s10,0(sp)
   109b4:	0087f713          	andi	a4,a5,8
   109b8:	00060a13          	mv	s4,a2
   109bc:	00050a93          	mv	s5,a0
   109c0:	00058413          	mv	s0,a1
   109c4:	08070663          	beqz	a4,10a50 <__sfvwrite_r+0xdc>
   109c8:	0105a703          	lw	a4,16(a1)
   109cc:	08070263          	beqz	a4,10a50 <__sfvwrite_r+0xdc>
   109d0:	0027f713          	andi	a4,a5,2
   109d4:	000a2483          	lw	s1,0(s4)
   109d8:	08070c63          	beqz	a4,10a70 <__sfvwrite_r+0xfc>
   109dc:	02442783          	lw	a5,36(s0)
   109e0:	01c42583          	lw	a1,28(s0)
   109e4:	80000b37          	lui	s6,0x80000
   109e8:	00000993          	li	s3,0
   109ec:	00000913          	li	s2,0
   109f0:	c00b4b13          	xori	s6,s6,-1024
   109f4:	00098613          	mv	a2,s3
   109f8:	000a8513          	mv	a0,s5
   109fc:	04090263          	beqz	s2,10a40 <__sfvwrite_r+0xcc>
   10a00:	00090693          	mv	a3,s2
   10a04:	012b7463          	bgeu	s6,s2,10a0c <__sfvwrite_r+0x98>
   10a08:	000b0693          	mv	a3,s6
   10a0c:	000780e7          	jalr	a5
   10a10:	28a05863          	blez	a0,10ca0 <__sfvwrite_r+0x32c>
   10a14:	008a2783          	lw	a5,8(s4)
   10a18:	00a989b3          	add	s3,s3,a0
   10a1c:	40a90933          	sub	s2,s2,a0
   10a20:	40a78533          	sub	a0,a5,a0
   10a24:	00aa2423          	sw	a0,8(s4)
   10a28:	20050a63          	beqz	a0,10c3c <__sfvwrite_r+0x2c8>
   10a2c:	02442783          	lw	a5,36(s0)
   10a30:	01c42583          	lw	a1,28(s0)
   10a34:	00098613          	mv	a2,s3
   10a38:	000a8513          	mv	a0,s5
   10a3c:	fc0912e3          	bnez	s2,10a00 <__sfvwrite_r+0x8c>
   10a40:	0004a983          	lw	s3,0(s1)
   10a44:	0044a903          	lw	s2,4(s1)
   10a48:	00848493          	addi	s1,s1,8
   10a4c:	fa9ff06f          	j	109f4 <__sfvwrite_r+0x80>
   10a50:	00040593          	mv	a1,s0
   10a54:	000a8513          	mv	a0,s5
   10a58:	76c010ef          	jal	ra,121c4 <__swsetup_r>
   10a5c:	3c051263          	bnez	a0,10e20 <__sfvwrite_r+0x4ac>
   10a60:	00c45783          	lhu	a5,12(s0)
   10a64:	000a2483          	lw	s1,0(s4)
   10a68:	0027f713          	andi	a4,a5,2
   10a6c:	f60718e3          	bnez	a4,109dc <__sfvwrite_r+0x68>
   10a70:	0017f713          	andi	a4,a5,1
   10a74:	24071463          	bnez	a4,10cbc <__sfvwrite_r+0x348>
   10a78:	00842c83          	lw	s9,8(s0)
   10a7c:	00042503          	lw	a0,0(s0)
   10a80:	80000b37          	lui	s6,0x80000
   10a84:	ffeb4b93          	xori	s7,s6,-2
   10a88:	00000c13          	li	s8,0
   10a8c:	00000913          	li	s2,0
   10a90:	fffb4b13          	not	s6,s6
   10a94:	0e090e63          	beqz	s2,10b90 <__sfvwrite_r+0x21c>
   10a98:	2007f713          	andi	a4,a5,512
   10a9c:	24070c63          	beqz	a4,10cf4 <__sfvwrite_r+0x380>
   10aa0:	000c8d13          	mv	s10,s9
   10aa4:	2f996863          	bltu	s2,s9,10d94 <__sfvwrite_r+0x420>
   10aa8:	4807f713          	andi	a4,a5,1152
   10aac:	08070a63          	beqz	a4,10b40 <__sfvwrite_r+0x1cc>
   10ab0:	01442983          	lw	s3,20(s0)
   10ab4:	01042583          	lw	a1,16(s0)
   10ab8:	00190713          	addi	a4,s2,1
   10abc:	00199693          	slli	a3,s3,0x1
   10ac0:	013686b3          	add	a3,a3,s3
   10ac4:	01f6d993          	srli	s3,a3,0x1f
   10ac8:	40b50d33          	sub	s10,a0,a1
   10acc:	00d989b3          	add	s3,s3,a3
   10ad0:	4019d993          	srai	s3,s3,0x1
   10ad4:	01a70733          	add	a4,a4,s10
   10ad8:	00098613          	mv	a2,s3
   10adc:	00e9f663          	bgeu	s3,a4,10ae8 <__sfvwrite_r+0x174>
   10ae0:	00070993          	mv	s3,a4
   10ae4:	00070613          	mv	a2,a4
   10ae8:	4007f793          	andi	a5,a5,1024
   10aec:	2e078a63          	beqz	a5,10de0 <__sfvwrite_r+0x46c>
   10af0:	00060593          	mv	a1,a2
   10af4:	000a8513          	mv	a0,s5
   10af8:	488000ef          	jal	ra,10f80 <_malloc_r>
   10afc:	00050c93          	mv	s9,a0
   10b00:	30050863          	beqz	a0,10e10 <__sfvwrite_r+0x49c>
   10b04:	01042583          	lw	a1,16(s0)
   10b08:	000d0613          	mv	a2,s10
   10b0c:	4e1000ef          	jal	ra,117ec <memcpy>
   10b10:	00c45783          	lhu	a5,12(s0)
   10b14:	b7f7f793          	andi	a5,a5,-1153
   10b18:	0807e793          	ori	a5,a5,128
   10b1c:	00f41623          	sh	a5,12(s0)
   10b20:	01ac8533          	add	a0,s9,s10
   10b24:	41a987b3          	sub	a5,s3,s10
   10b28:	01942823          	sw	s9,16(s0)
   10b2c:	00a42023          	sw	a0,0(s0)
   10b30:	01342a23          	sw	s3,20(s0)
   10b34:	00090c93          	mv	s9,s2
   10b38:	00f42423          	sw	a5,8(s0)
   10b3c:	00090d13          	mv	s10,s2
   10b40:	000d0613          	mv	a2,s10
   10b44:	000c0593          	mv	a1,s8
   10b48:	5c1000ef          	jal	ra,11908 <memmove>
   10b4c:	00842703          	lw	a4,8(s0)
   10b50:	00042783          	lw	a5,0(s0)
   10b54:	00090993          	mv	s3,s2
   10b58:	41970cb3          	sub	s9,a4,s9
   10b5c:	01a787b3          	add	a5,a5,s10
   10b60:	01942423          	sw	s9,8(s0)
   10b64:	00f42023          	sw	a5,0(s0)
   10b68:	00000913          	li	s2,0
   10b6c:	008a2603          	lw	a2,8(s4)
   10b70:	013c0c33          	add	s8,s8,s3
   10b74:	413609b3          	sub	s3,a2,s3
   10b78:	013a2423          	sw	s3,8(s4)
   10b7c:	0c098063          	beqz	s3,10c3c <__sfvwrite_r+0x2c8>
   10b80:	00842c83          	lw	s9,8(s0)
   10b84:	00042503          	lw	a0,0(s0)
   10b88:	00c45783          	lhu	a5,12(s0)
   10b8c:	f00916e3          	bnez	s2,10a98 <__sfvwrite_r+0x124>
   10b90:	0004ac03          	lw	s8,0(s1)
   10b94:	0044a903          	lw	s2,4(s1)
   10b98:	00848493          	addi	s1,s1,8
   10b9c:	ef9ff06f          	j	10a94 <__sfvwrite_r+0x120>
   10ba0:	0044a983          	lw	s3,4(s1)
   10ba4:	0004ac03          	lw	s8,0(s1)
   10ba8:	00848493          	addi	s1,s1,8
   10bac:	fe098ae3          	beqz	s3,10ba0 <__sfvwrite_r+0x22c>
   10bb0:	00098613          	mv	a2,s3
   10bb4:	00a00593          	li	a1,10
   10bb8:	000c0513          	mv	a0,s8
   10bbc:	35d000ef          	jal	ra,11718 <memchr>
   10bc0:	12050463          	beqz	a0,10ce8 <__sfvwrite_r+0x374>
   10bc4:	00150513          	addi	a0,a0,1
   10bc8:	41850b33          	sub	s6,a0,s8
   10bcc:	000b0793          	mv	a5,s6
   10bd0:	00098b93          	mv	s7,s3
   10bd4:	0137f463          	bgeu	a5,s3,10bdc <__sfvwrite_r+0x268>
   10bd8:	00078b93          	mv	s7,a5
   10bdc:	00042503          	lw	a0,0(s0)
   10be0:	01042783          	lw	a5,16(s0)
   10be4:	01442683          	lw	a3,20(s0)
   10be8:	00a7f863          	bgeu	a5,a0,10bf8 <__sfvwrite_r+0x284>
   10bec:	00842903          	lw	s2,8(s0)
   10bf0:	01268933          	add	s2,a3,s2
   10bf4:	09794263          	blt	s2,s7,10c78 <__sfvwrite_r+0x304>
   10bf8:	1adbce63          	blt	s7,a3,10db4 <__sfvwrite_r+0x440>
   10bfc:	02442783          	lw	a5,36(s0)
   10c00:	01c42583          	lw	a1,28(s0)
   10c04:	000c0613          	mv	a2,s8
   10c08:	000a8513          	mv	a0,s5
   10c0c:	000780e7          	jalr	a5
   10c10:	00050913          	mv	s2,a0
   10c14:	08a05663          	blez	a0,10ca0 <__sfvwrite_r+0x32c>
   10c18:	412b0b33          	sub	s6,s6,s2
   10c1c:	00100513          	li	a0,1
   10c20:	180b0063          	beqz	s6,10da0 <__sfvwrite_r+0x42c>
   10c24:	008a2603          	lw	a2,8(s4)
   10c28:	012c0c33          	add	s8,s8,s2
   10c2c:	412989b3          	sub	s3,s3,s2
   10c30:	41260933          	sub	s2,a2,s2
   10c34:	012a2423          	sw	s2,8(s4)
   10c38:	08091a63          	bnez	s2,10ccc <__sfvwrite_r+0x358>
   10c3c:	00000513          	li	a0,0
   10c40:	02c12083          	lw	ra,44(sp)
   10c44:	02812403          	lw	s0,40(sp)
   10c48:	02412483          	lw	s1,36(sp)
   10c4c:	02012903          	lw	s2,32(sp)
   10c50:	01c12983          	lw	s3,28(sp)
   10c54:	01812a03          	lw	s4,24(sp)
   10c58:	01412a83          	lw	s5,20(sp)
   10c5c:	01012b03          	lw	s6,16(sp)
   10c60:	00c12b83          	lw	s7,12(sp)
   10c64:	00812c03          	lw	s8,8(sp)
   10c68:	00412c83          	lw	s9,4(sp)
   10c6c:	00012d03          	lw	s10,0(sp)
   10c70:	03010113          	addi	sp,sp,48
   10c74:	00008067          	ret
   10c78:	000c0593          	mv	a1,s8
   10c7c:	00090613          	mv	a2,s2
   10c80:	489000ef          	jal	ra,11908 <memmove>
   10c84:	00042783          	lw	a5,0(s0)
   10c88:	00040593          	mv	a1,s0
   10c8c:	000a8513          	mv	a0,s5
   10c90:	012787b3          	add	a5,a5,s2
   10c94:	00f42023          	sw	a5,0(s0)
   10c98:	271010ef          	jal	ra,12708 <_fflush_r>
   10c9c:	f6050ee3          	beqz	a0,10c18 <__sfvwrite_r+0x2a4>
   10ca0:	00c41783          	lh	a5,12(s0)
   10ca4:	0407e793          	ori	a5,a5,64
   10ca8:	00f41623          	sh	a5,12(s0)
   10cac:	fff00513          	li	a0,-1
   10cb0:	f91ff06f          	j	10c40 <__sfvwrite_r+0x2cc>
   10cb4:	00000513          	li	a0,0
   10cb8:	00008067          	ret
   10cbc:	00000b13          	li	s6,0
   10cc0:	00000513          	li	a0,0
   10cc4:	00000c13          	li	s8,0
   10cc8:	00000993          	li	s3,0
   10ccc:	ec098ae3          	beqz	s3,10ba0 <__sfvwrite_r+0x22c>
   10cd0:	ee051ee3          	bnez	a0,10bcc <__sfvwrite_r+0x258>
   10cd4:	00098613          	mv	a2,s3
   10cd8:	00a00593          	li	a1,10
   10cdc:	000c0513          	mv	a0,s8
   10ce0:	239000ef          	jal	ra,11718 <memchr>
   10ce4:	ee0510e3          	bnez	a0,10bc4 <__sfvwrite_r+0x250>
   10ce8:	00198793          	addi	a5,s3,1
   10cec:	00078b13          	mv	s6,a5
   10cf0:	ee1ff06f          	j	10bd0 <__sfvwrite_r+0x25c>
   10cf4:	01042783          	lw	a5,16(s0)
   10cf8:	04a7e863          	bltu	a5,a0,10d48 <__sfvwrite_r+0x3d4>
   10cfc:	01442983          	lw	s3,20(s0)
   10d00:	05396463          	bltu	s2,s3,10d48 <__sfvwrite_r+0x3d4>
   10d04:	00090513          	mv	a0,s2
   10d08:	012bf463          	bgeu	s7,s2,10d10 <__sfvwrite_r+0x39c>
   10d0c:	000b0513          	mv	a0,s6
   10d10:	00098593          	mv	a1,s3
   10d14:	7ac020ef          	jal	ra,134c0 <__divsi3>
   10d18:	00098593          	mv	a1,s3
   10d1c:	780020ef          	jal	ra,1349c <__mulsi3>
   10d20:	02442783          	lw	a5,36(s0)
   10d24:	01c42583          	lw	a1,28(s0)
   10d28:	00050693          	mv	a3,a0
   10d2c:	000c0613          	mv	a2,s8
   10d30:	000a8513          	mv	a0,s5
   10d34:	000780e7          	jalr	a5
   10d38:	00050993          	mv	s3,a0
   10d3c:	f6a052e3          	blez	a0,10ca0 <__sfvwrite_r+0x32c>
   10d40:	41390933          	sub	s2,s2,s3
   10d44:	e29ff06f          	j	10b6c <__sfvwrite_r+0x1f8>
   10d48:	000c8993          	mv	s3,s9
   10d4c:	01997463          	bgeu	s2,s9,10d54 <__sfvwrite_r+0x3e0>
   10d50:	00090993          	mv	s3,s2
   10d54:	00098613          	mv	a2,s3
   10d58:	000c0593          	mv	a1,s8
   10d5c:	3ad000ef          	jal	ra,11908 <memmove>
   10d60:	00842783          	lw	a5,8(s0)
   10d64:	00042703          	lw	a4,0(s0)
   10d68:	413787b3          	sub	a5,a5,s3
   10d6c:	01370733          	add	a4,a4,s3
   10d70:	00f42423          	sw	a5,8(s0)
   10d74:	00e42023          	sw	a4,0(s0)
   10d78:	fc0794e3          	bnez	a5,10d40 <__sfvwrite_r+0x3cc>
   10d7c:	00040593          	mv	a1,s0
   10d80:	000a8513          	mv	a0,s5
   10d84:	185010ef          	jal	ra,12708 <_fflush_r>
   10d88:	f0051ce3          	bnez	a0,10ca0 <__sfvwrite_r+0x32c>
   10d8c:	41390933          	sub	s2,s2,s3
   10d90:	dddff06f          	j	10b6c <__sfvwrite_r+0x1f8>
   10d94:	00090c93          	mv	s9,s2
   10d98:	00090d13          	mv	s10,s2
   10d9c:	da5ff06f          	j	10b40 <__sfvwrite_r+0x1cc>
   10da0:	00040593          	mv	a1,s0
   10da4:	000a8513          	mv	a0,s5
   10da8:	161010ef          	jal	ra,12708 <_fflush_r>
   10dac:	e6050ce3          	beqz	a0,10c24 <__sfvwrite_r+0x2b0>
   10db0:	ef1ff06f          	j	10ca0 <__sfvwrite_r+0x32c>
   10db4:	000b8613          	mv	a2,s7
   10db8:	000c0593          	mv	a1,s8
   10dbc:	34d000ef          	jal	ra,11908 <memmove>
   10dc0:	00842783          	lw	a5,8(s0)
   10dc4:	00042603          	lw	a2,0(s0)
   10dc8:	000b8913          	mv	s2,s7
   10dcc:	417787b3          	sub	a5,a5,s7
   10dd0:	01760633          	add	a2,a2,s7
   10dd4:	00f42423          	sw	a5,8(s0)
   10dd8:	00c42023          	sw	a2,0(s0)
   10ddc:	e3dff06f          	j	10c18 <__sfvwrite_r+0x2a4>
   10de0:	000a8513          	mv	a0,s5
   10de4:	44d000ef          	jal	ra,11a30 <_realloc_r>
   10de8:	00050c93          	mv	s9,a0
   10dec:	d2051ae3          	bnez	a0,10b20 <__sfvwrite_r+0x1ac>
   10df0:	01042583          	lw	a1,16(s0)
   10df4:	000a8513          	mv	a0,s5
   10df8:	2c1010ef          	jal	ra,128b8 <_free_r>
   10dfc:	00c41783          	lh	a5,12(s0)
   10e00:	00c00713          	li	a4,12
   10e04:	00eaa023          	sw	a4,0(s5)
   10e08:	f7f7f793          	andi	a5,a5,-129
   10e0c:	e99ff06f          	j	10ca4 <__sfvwrite_r+0x330>
   10e10:	00c00713          	li	a4,12
   10e14:	00c41783          	lh	a5,12(s0)
   10e18:	00eaa023          	sw	a4,0(s5)
   10e1c:	e89ff06f          	j	10ca4 <__sfvwrite_r+0x330>
   10e20:	fff00513          	li	a0,-1
   10e24:	e1dff06f          	j	10c40 <__sfvwrite_r+0x2cc>

00010e28 <_fwalk>:
   10e28:	fe010113          	addi	sp,sp,-32
   10e2c:	01212823          	sw	s2,16(sp)
   10e30:	01312623          	sw	s3,12(sp)
   10e34:	01412423          	sw	s4,8(sp)
   10e38:	01512223          	sw	s5,4(sp)
   10e3c:	01612023          	sw	s6,0(sp)
   10e40:	00112e23          	sw	ra,28(sp)
   10e44:	00812c23          	sw	s0,24(sp)
   10e48:	00912a23          	sw	s1,20(sp)
   10e4c:	00058b13          	mv	s6,a1
   10e50:	2e050a93          	addi	s5,a0,736
   10e54:	00000a13          	li	s4,0
   10e58:	00100993          	li	s3,1
   10e5c:	fff00913          	li	s2,-1
   10e60:	004aa483          	lw	s1,4(s5)
   10e64:	008aa403          	lw	s0,8(s5)
   10e68:	fff48493          	addi	s1,s1,-1
   10e6c:	0204c663          	bltz	s1,10e98 <_fwalk+0x70>
   10e70:	00c45783          	lhu	a5,12(s0)
   10e74:	fff48493          	addi	s1,s1,-1
   10e78:	00f9fc63          	bgeu	s3,a5,10e90 <_fwalk+0x68>
   10e7c:	00e41783          	lh	a5,14(s0)
   10e80:	00040513          	mv	a0,s0
   10e84:	01278663          	beq	a5,s2,10e90 <_fwalk+0x68>
   10e88:	000b00e7          	jalr	s6 # 80000000 <__BSS_END__+0x7ffeb1cc>
   10e8c:	00aa6a33          	or	s4,s4,a0
   10e90:	06840413          	addi	s0,s0,104
   10e94:	fd249ee3          	bne	s1,s2,10e70 <_fwalk+0x48>
   10e98:	000aaa83          	lw	s5,0(s5)
   10e9c:	fc0a92e3          	bnez	s5,10e60 <_fwalk+0x38>
   10ea0:	01c12083          	lw	ra,28(sp)
   10ea4:	01812403          	lw	s0,24(sp)
   10ea8:	01412483          	lw	s1,20(sp)
   10eac:	01012903          	lw	s2,16(sp)
   10eb0:	00c12983          	lw	s3,12(sp)
   10eb4:	00412a83          	lw	s5,4(sp)
   10eb8:	00012b03          	lw	s6,0(sp)
   10ebc:	000a0513          	mv	a0,s4
   10ec0:	00812a03          	lw	s4,8(sp)
   10ec4:	02010113          	addi	sp,sp,32
   10ec8:	00008067          	ret

00010ecc <_fwalk_reent>:
   10ecc:	fd010113          	addi	sp,sp,-48
   10ed0:	03212023          	sw	s2,32(sp)
   10ed4:	01312e23          	sw	s3,28(sp)
   10ed8:	01412c23          	sw	s4,24(sp)
   10edc:	01512a23          	sw	s5,20(sp)
   10ee0:	01612823          	sw	s6,16(sp)
   10ee4:	01712623          	sw	s7,12(sp)
   10ee8:	02112623          	sw	ra,44(sp)
   10eec:	02812423          	sw	s0,40(sp)
   10ef0:	02912223          	sw	s1,36(sp)
   10ef4:	00050a93          	mv	s5,a0
   10ef8:	00058b93          	mv	s7,a1
   10efc:	2e050b13          	addi	s6,a0,736
   10f00:	00000a13          	li	s4,0
   10f04:	00100993          	li	s3,1
   10f08:	fff00913          	li	s2,-1
   10f0c:	004b2483          	lw	s1,4(s6)
   10f10:	008b2403          	lw	s0,8(s6)
   10f14:	fff48493          	addi	s1,s1,-1
   10f18:	0204c863          	bltz	s1,10f48 <_fwalk_reent+0x7c>
   10f1c:	00c45783          	lhu	a5,12(s0)
   10f20:	fff48493          	addi	s1,s1,-1
   10f24:	00f9fe63          	bgeu	s3,a5,10f40 <_fwalk_reent+0x74>
   10f28:	00e41783          	lh	a5,14(s0)
   10f2c:	00040593          	mv	a1,s0
   10f30:	000a8513          	mv	a0,s5
   10f34:	01278663          	beq	a5,s2,10f40 <_fwalk_reent+0x74>
   10f38:	000b80e7          	jalr	s7
   10f3c:	00aa6a33          	or	s4,s4,a0
   10f40:	06840413          	addi	s0,s0,104
   10f44:	fd249ce3          	bne	s1,s2,10f1c <_fwalk_reent+0x50>
   10f48:	000b2b03          	lw	s6,0(s6)
   10f4c:	fc0b10e3          	bnez	s6,10f0c <_fwalk_reent+0x40>
   10f50:	02c12083          	lw	ra,44(sp)
   10f54:	02812403          	lw	s0,40(sp)
   10f58:	02412483          	lw	s1,36(sp)
   10f5c:	02012903          	lw	s2,32(sp)
   10f60:	01c12983          	lw	s3,28(sp)
   10f64:	01412a83          	lw	s5,20(sp)
   10f68:	01012b03          	lw	s6,16(sp)
   10f6c:	00c12b83          	lw	s7,12(sp)
   10f70:	000a0513          	mv	a0,s4
   10f74:	01812a03          	lw	s4,24(sp)
   10f78:	03010113          	addi	sp,sp,48
   10f7c:	00008067          	ret

00010f80 <_malloc_r>:
   10f80:	fd010113          	addi	sp,sp,-48
   10f84:	01312e23          	sw	s3,28(sp)
   10f88:	02112623          	sw	ra,44(sp)
   10f8c:	02812423          	sw	s0,40(sp)
   10f90:	02912223          	sw	s1,36(sp)
   10f94:	03212023          	sw	s2,32(sp)
   10f98:	01412c23          	sw	s4,24(sp)
   10f9c:	01512a23          	sw	s5,20(sp)
   10fa0:	01612823          	sw	s6,16(sp)
   10fa4:	01712623          	sw	s7,12(sp)
   10fa8:	01812423          	sw	s8,8(sp)
   10fac:	01912223          	sw	s9,4(sp)
   10fb0:	00b58793          	addi	a5,a1,11
   10fb4:	01600713          	li	a4,22
   10fb8:	00050993          	mv	s3,a0
   10fbc:	06f76463          	bltu	a4,a5,11024 <_malloc_r+0xa4>
   10fc0:	01000793          	li	a5,16
   10fc4:	1eb7e263          	bltu	a5,a1,111a8 <_malloc_r+0x228>
   10fc8:	261000ef          	jal	ra,11a28 <__malloc_lock>
   10fcc:	01000493          	li	s1,16
   10fd0:	00200613          	li	a2,2
   10fd4:	01800793          	li	a5,24
   10fd8:	c2818913          	addi	s2,gp,-984 # 149c0 <__malloc_av_>
   10fdc:	00f907b3          	add	a5,s2,a5
   10fe0:	0047a403          	lw	s0,4(a5)
   10fe4:	ff878713          	addi	a4,a5,-8
   10fe8:	20e40863          	beq	s0,a4,111f8 <_malloc_r+0x278>
   10fec:	00442783          	lw	a5,4(s0)
   10ff0:	00c42683          	lw	a3,12(s0)
   10ff4:	00842603          	lw	a2,8(s0)
   10ff8:	ffc7f793          	andi	a5,a5,-4
   10ffc:	00f407b3          	add	a5,s0,a5
   11000:	0047a703          	lw	a4,4(a5)
   11004:	00d62623          	sw	a3,12(a2)
   11008:	00c6a423          	sw	a2,8(a3)
   1100c:	00176713          	ori	a4,a4,1
   11010:	00098513          	mv	a0,s3
   11014:	00e7a223          	sw	a4,4(a5)
   11018:	215000ef          	jal	ra,11a2c <__malloc_unlock>
   1101c:	00840513          	addi	a0,s0,8
   11020:	1940006f          	j	111b4 <_malloc_r+0x234>
   11024:	ff87f493          	andi	s1,a5,-8
   11028:	1807c063          	bltz	a5,111a8 <_malloc_r+0x228>
   1102c:	16b4ee63          	bltu	s1,a1,111a8 <_malloc_r+0x228>
   11030:	1f9000ef          	jal	ra,11a28 <__malloc_lock>
   11034:	1f700793          	li	a5,503
   11038:	4497fa63          	bgeu	a5,s1,1148c <_malloc_r+0x50c>
   1103c:	0094d793          	srli	a5,s1,0x9
   11040:	1a078463          	beqz	a5,111e8 <_malloc_r+0x268>
   11044:	00400713          	li	a4,4
   11048:	3cf76063          	bltu	a4,a5,11408 <_malloc_r+0x488>
   1104c:	0064d793          	srli	a5,s1,0x6
   11050:	03978613          	addi	a2,a5,57
   11054:	03878513          	addi	a0,a5,56
   11058:	00361693          	slli	a3,a2,0x3
   1105c:	c2818913          	addi	s2,gp,-984 # 149c0 <__malloc_av_>
   11060:	00d906b3          	add	a3,s2,a3
   11064:	0046a403          	lw	s0,4(a3)
   11068:	ff868693          	addi	a3,a3,-8
   1106c:	02868663          	beq	a3,s0,11098 <_malloc_r+0x118>
   11070:	00f00593          	li	a1,15
   11074:	0100006f          	j	11084 <_malloc_r+0x104>
   11078:	32075263          	bgez	a4,1139c <_malloc_r+0x41c>
   1107c:	00c42403          	lw	s0,12(s0)
   11080:	00868c63          	beq	a3,s0,11098 <_malloc_r+0x118>
   11084:	00442783          	lw	a5,4(s0)
   11088:	ffc7f793          	andi	a5,a5,-4
   1108c:	40978733          	sub	a4,a5,s1
   11090:	fee5d4e3          	bge	a1,a4,11078 <_malloc_r+0xf8>
   11094:	00050613          	mv	a2,a0
   11098:	01092403          	lw	s0,16(s2)
   1109c:	00890893          	addi	a7,s2,8
   110a0:	17140863          	beq	s0,a7,11210 <_malloc_r+0x290>
   110a4:	00442503          	lw	a0,4(s0)
   110a8:	00f00693          	li	a3,15
   110ac:	ffc57513          	andi	a0,a0,-4
   110b0:	409507b3          	sub	a5,a0,s1
   110b4:	40f6c263          	blt	a3,a5,114b8 <_malloc_r+0x538>
   110b8:	01192a23          	sw	a7,20(s2)
   110bc:	01192823          	sw	a7,16(s2)
   110c0:	3c07dc63          	bgez	a5,11498 <_malloc_r+0x518>
   110c4:	1ff00793          	li	a5,511
   110c8:	2ea7e063          	bltu	a5,a0,113a8 <_malloc_r+0x428>
   110cc:	ff857793          	andi	a5,a0,-8
   110d0:	00878793          	addi	a5,a5,8
   110d4:	00492583          	lw	a1,4(s2)
   110d8:	00f907b3          	add	a5,s2,a5
   110dc:	0007a683          	lw	a3,0(a5)
   110e0:	00555513          	srli	a0,a0,0x5
   110e4:	00100713          	li	a4,1
   110e8:	00a71733          	sll	a4,a4,a0
   110ec:	00b76733          	or	a4,a4,a1
   110f0:	ff878593          	addi	a1,a5,-8
   110f4:	00b42623          	sw	a1,12(s0)
   110f8:	00d42423          	sw	a3,8(s0)
   110fc:	00e92223          	sw	a4,4(s2)
   11100:	0087a023          	sw	s0,0(a5)
   11104:	0086a623          	sw	s0,12(a3)
   11108:	40265793          	srai	a5,a2,0x2
   1110c:	00100593          	li	a1,1
   11110:	00f595b3          	sll	a1,a1,a5
   11114:	10b76863          	bltu	a4,a1,11224 <_malloc_r+0x2a4>
   11118:	00e5f7b3          	and	a5,a1,a4
   1111c:	02079463          	bnez	a5,11144 <_malloc_r+0x1c4>
   11120:	00159593          	slli	a1,a1,0x1
   11124:	ffc67613          	andi	a2,a2,-4
   11128:	00e5f7b3          	and	a5,a1,a4
   1112c:	00460613          	addi	a2,a2,4
   11130:	00079a63          	bnez	a5,11144 <_malloc_r+0x1c4>
   11134:	00159593          	slli	a1,a1,0x1
   11138:	00e5f7b3          	and	a5,a1,a4
   1113c:	00460613          	addi	a2,a2,4
   11140:	fe078ae3          	beqz	a5,11134 <_malloc_r+0x1b4>
   11144:	00f00813          	li	a6,15
   11148:	00361313          	slli	t1,a2,0x3
   1114c:	00690333          	add	t1,s2,t1
   11150:	00030513          	mv	a0,t1
   11154:	00c52783          	lw	a5,12(a0)
   11158:	00060e13          	mv	t3,a2
   1115c:	2cf50863          	beq	a0,a5,1142c <_malloc_r+0x4ac>
   11160:	0047a703          	lw	a4,4(a5)
   11164:	00078413          	mv	s0,a5
   11168:	00c7a783          	lw	a5,12(a5)
   1116c:	ffc77713          	andi	a4,a4,-4
   11170:	409706b3          	sub	a3,a4,s1
   11174:	2cd84863          	blt	a6,a3,11444 <_malloc_r+0x4c4>
   11178:	fe06c2e3          	bltz	a3,1115c <_malloc_r+0x1dc>
   1117c:	00e40733          	add	a4,s0,a4
   11180:	00472683          	lw	a3,4(a4)
   11184:	00842603          	lw	a2,8(s0)
   11188:	00098513          	mv	a0,s3
   1118c:	0016e693          	ori	a3,a3,1
   11190:	00d72223          	sw	a3,4(a4)
   11194:	00f62623          	sw	a5,12(a2)
   11198:	00c7a423          	sw	a2,8(a5)
   1119c:	091000ef          	jal	ra,11a2c <__malloc_unlock>
   111a0:	00840513          	addi	a0,s0,8
   111a4:	0100006f          	j	111b4 <_malloc_r+0x234>
   111a8:	00c00793          	li	a5,12
   111ac:	00f9a023          	sw	a5,0(s3)
   111b0:	00000513          	li	a0,0
   111b4:	02c12083          	lw	ra,44(sp)
   111b8:	02812403          	lw	s0,40(sp)
   111bc:	02412483          	lw	s1,36(sp)
   111c0:	02012903          	lw	s2,32(sp)
   111c4:	01c12983          	lw	s3,28(sp)
   111c8:	01812a03          	lw	s4,24(sp)
   111cc:	01412a83          	lw	s5,20(sp)
   111d0:	01012b03          	lw	s6,16(sp)
   111d4:	00c12b83          	lw	s7,12(sp)
   111d8:	00812c03          	lw	s8,8(sp)
   111dc:	00412c83          	lw	s9,4(sp)
   111e0:	03010113          	addi	sp,sp,48
   111e4:	00008067          	ret
   111e8:	20000693          	li	a3,512
   111ec:	04000613          	li	a2,64
   111f0:	03f00513          	li	a0,63
   111f4:	e69ff06f          	j	1105c <_malloc_r+0xdc>
   111f8:	00c7a403          	lw	s0,12(a5)
   111fc:	00260613          	addi	a2,a2,2
   11200:	de8796e3          	bne	a5,s0,10fec <_malloc_r+0x6c>
   11204:	01092403          	lw	s0,16(s2)
   11208:	00890893          	addi	a7,s2,8
   1120c:	e9141ce3          	bne	s0,a7,110a4 <_malloc_r+0x124>
   11210:	00492703          	lw	a4,4(s2)
   11214:	40265793          	srai	a5,a2,0x2
   11218:	00100593          	li	a1,1
   1121c:	00f595b3          	sll	a1,a1,a5
   11220:	eeb77ce3          	bgeu	a4,a1,11118 <_malloc_r+0x198>
   11224:	00892403          	lw	s0,8(s2)
   11228:	00442a83          	lw	s5,4(s0)
   1122c:	ffcafb13          	andi	s6,s5,-4
   11230:	009b6863          	bltu	s6,s1,11240 <_malloc_r+0x2c0>
   11234:	409b07b3          	sub	a5,s6,s1
   11238:	00f00713          	li	a4,15
   1123c:	12f74c63          	blt	a4,a5,11374 <_malloc_r+0x3f4>
   11240:	04c1aa83          	lw	s5,76(gp) # 14de4 <__malloc_top_pad>
   11244:	03c1a703          	lw	a4,60(gp) # 14dd4 <__malloc_sbrk_base>
   11248:	fff00793          	li	a5,-1
   1124c:	01640a33          	add	s4,s0,s6
   11250:	01548ab3          	add	s5,s1,s5
   11254:	34f70463          	beq	a4,a5,1159c <_malloc_r+0x61c>
   11258:	000017b7          	lui	a5,0x1
   1125c:	00f78793          	addi	a5,a5,15 # 100f <register_fini-0xf065>
   11260:	00fa8ab3          	add	s5,s5,a5
   11264:	fffff7b7          	lui	a5,0xfffff
   11268:	00fafab3          	and	s5,s5,a5
   1126c:	000a8593          	mv	a1,s5
   11270:	00098513          	mv	a0,s3
   11274:	531000ef          	jal	ra,11fa4 <_sbrk_r>
   11278:	fff00793          	li	a5,-1
   1127c:	00050b93          	mv	s7,a0
   11280:	28f50663          	beq	a0,a5,1150c <_malloc_r+0x58c>
   11284:	29456263          	bltu	a0,s4,11508 <_malloc_r+0x588>
   11288:	07018c13          	addi	s8,gp,112 # 14e08 <__malloc_current_mallinfo>
   1128c:	000c2583          	lw	a1,0(s8)
   11290:	00ba85b3          	add	a1,s5,a1
   11294:	00bc2023          	sw	a1,0(s8)
   11298:	00058793          	mv	a5,a1
   1129c:	38aa0e63          	beq	s4,a0,11638 <_malloc_r+0x6b8>
   112a0:	03c1a683          	lw	a3,60(gp) # 14dd4 <__malloc_sbrk_base>
   112a4:	fff00713          	li	a4,-1
   112a8:	3ae68663          	beq	a3,a4,11654 <_malloc_r+0x6d4>
   112ac:	414b8a33          	sub	s4,s7,s4
   112b0:	00fa07b3          	add	a5,s4,a5
   112b4:	00fc2023          	sw	a5,0(s8)
   112b8:	007bfc93          	andi	s9,s7,7
   112bc:	300c8263          	beqz	s9,115c0 <_malloc_r+0x640>
   112c0:	000017b7          	lui	a5,0x1
   112c4:	419b8bb3          	sub	s7,s7,s9
   112c8:	00878593          	addi	a1,a5,8 # 1008 <register_fini-0xf06c>
   112cc:	008b8b93          	addi	s7,s7,8
   112d0:	419585b3          	sub	a1,a1,s9
   112d4:	015b8ab3          	add	s5,s7,s5
   112d8:	fff78793          	addi	a5,a5,-1
   112dc:	415585b3          	sub	a1,a1,s5
   112e0:	00f5fa33          	and	s4,a1,a5
   112e4:	000a0593          	mv	a1,s4
   112e8:	00098513          	mv	a0,s3
   112ec:	4b9000ef          	jal	ra,11fa4 <_sbrk_r>
   112f0:	fff00793          	li	a5,-1
   112f4:	3af50a63          	beq	a0,a5,116a8 <_malloc_r+0x728>
   112f8:	41750533          	sub	a0,a0,s7
   112fc:	01450ab3          	add	s5,a0,s4
   11300:	000c2583          	lw	a1,0(s8)
   11304:	01792423          	sw	s7,8(s2)
   11308:	001aea93          	ori	s5,s5,1
   1130c:	00ba05b3          	add	a1,s4,a1
   11310:	00bc2023          	sw	a1,0(s8)
   11314:	015ba223          	sw	s5,4(s7)
   11318:	35240263          	beq	s0,s2,1165c <_malloc_r+0x6dc>
   1131c:	00f00693          	li	a3,15
   11320:	3566f263          	bgeu	a3,s6,11664 <_malloc_r+0x6e4>
   11324:	00442703          	lw	a4,4(s0)
   11328:	ff4b0793          	addi	a5,s6,-12
   1132c:	ff87f793          	andi	a5,a5,-8
   11330:	00177713          	andi	a4,a4,1
   11334:	00f76733          	or	a4,a4,a5
   11338:	00e42223          	sw	a4,4(s0)
   1133c:	00500613          	li	a2,5
   11340:	00f40733          	add	a4,s0,a5
   11344:	00c72223          	sw	a2,4(a4)
   11348:	00c72423          	sw	a2,8(a4)
   1134c:	36f6e863          	bltu	a3,a5,116bc <_malloc_r+0x73c>
   11350:	004baa83          	lw	s5,4(s7)
   11354:	000b8413          	mv	s0,s7
   11358:	0481a703          	lw	a4,72(gp) # 14de0 <__malloc_max_sbrked_mem>
   1135c:	00b77463          	bgeu	a4,a1,11364 <_malloc_r+0x3e4>
   11360:	04b1a423          	sw	a1,72(gp) # 14de0 <__malloc_max_sbrked_mem>
   11364:	0441a703          	lw	a4,68(gp) # 14ddc <_edata>
   11368:	1ab77663          	bgeu	a4,a1,11514 <_malloc_r+0x594>
   1136c:	04b1a223          	sw	a1,68(gp) # 14ddc <_edata>
   11370:	1a40006f          	j	11514 <_malloc_r+0x594>
   11374:	0014e713          	ori	a4,s1,1
   11378:	00e42223          	sw	a4,4(s0)
   1137c:	009404b3          	add	s1,s0,s1
   11380:	00992423          	sw	s1,8(s2)
   11384:	0017e793          	ori	a5,a5,1
   11388:	00098513          	mv	a0,s3
   1138c:	00f4a223          	sw	a5,4(s1)
   11390:	69c000ef          	jal	ra,11a2c <__malloc_unlock>
   11394:	00840513          	addi	a0,s0,8
   11398:	e1dff06f          	j	111b4 <_malloc_r+0x234>
   1139c:	00c42683          	lw	a3,12(s0)
   113a0:	00842603          	lw	a2,8(s0)
   113a4:	c59ff06f          	j	10ffc <_malloc_r+0x7c>
   113a8:	00955793          	srli	a5,a0,0x9
   113ac:	00400713          	li	a4,4
   113b0:	14f77263          	bgeu	a4,a5,114f4 <_malloc_r+0x574>
   113b4:	01400713          	li	a4,20
   113b8:	22f76a63          	bltu	a4,a5,115ec <_malloc_r+0x66c>
   113bc:	05c78693          	addi	a3,a5,92
   113c0:	05b78593          	addi	a1,a5,91
   113c4:	00369693          	slli	a3,a3,0x3
   113c8:	00d906b3          	add	a3,s2,a3
   113cc:	0006a783          	lw	a5,0(a3)
   113d0:	ff868693          	addi	a3,a3,-8
   113d4:	1cf68863          	beq	a3,a5,115a4 <_malloc_r+0x624>
   113d8:	0047a703          	lw	a4,4(a5)
   113dc:	ffc77713          	andi	a4,a4,-4
   113e0:	00e57663          	bgeu	a0,a4,113ec <_malloc_r+0x46c>
   113e4:	0087a783          	lw	a5,8(a5)
   113e8:	fef698e3          	bne	a3,a5,113d8 <_malloc_r+0x458>
   113ec:	00c7a683          	lw	a3,12(a5)
   113f0:	00492703          	lw	a4,4(s2)
   113f4:	00d42623          	sw	a3,12(s0)
   113f8:	00f42423          	sw	a5,8(s0)
   113fc:	0086a423          	sw	s0,8(a3)
   11400:	0087a623          	sw	s0,12(a5)
   11404:	d05ff06f          	j	11108 <_malloc_r+0x188>
   11408:	01400713          	li	a4,20
   1140c:	12f77663          	bgeu	a4,a5,11538 <_malloc_r+0x5b8>
   11410:	05400713          	li	a4,84
   11414:	1ef76a63          	bltu	a4,a5,11608 <_malloc_r+0x688>
   11418:	00c4d793          	srli	a5,s1,0xc
   1141c:	06f78613          	addi	a2,a5,111
   11420:	06e78513          	addi	a0,a5,110
   11424:	00361693          	slli	a3,a2,0x3
   11428:	c35ff06f          	j	1105c <_malloc_r+0xdc>
   1142c:	001e0e13          	addi	t3,t3,1
   11430:	003e7793          	andi	a5,t3,3
   11434:	00850513          	addi	a0,a0,8
   11438:	10078e63          	beqz	a5,11554 <_malloc_r+0x5d4>
   1143c:	00c52783          	lw	a5,12(a0)
   11440:	d1dff06f          	j	1115c <_malloc_r+0x1dc>
   11444:	00842603          	lw	a2,8(s0)
   11448:	0014e593          	ori	a1,s1,1
   1144c:	00b42223          	sw	a1,4(s0)
   11450:	00f62623          	sw	a5,12(a2)
   11454:	00c7a423          	sw	a2,8(a5)
   11458:	009404b3          	add	s1,s0,s1
   1145c:	00992a23          	sw	s1,20(s2)
   11460:	00992823          	sw	s1,16(s2)
   11464:	0016e793          	ori	a5,a3,1
   11468:	0114a623          	sw	a7,12(s1)
   1146c:	0114a423          	sw	a7,8(s1)
   11470:	00f4a223          	sw	a5,4(s1)
   11474:	00e40733          	add	a4,s0,a4
   11478:	00098513          	mv	a0,s3
   1147c:	00d72023          	sw	a3,0(a4)
   11480:	5ac000ef          	jal	ra,11a2c <__malloc_unlock>
   11484:	00840513          	addi	a0,s0,8
   11488:	d2dff06f          	j	111b4 <_malloc_r+0x234>
   1148c:	0034d613          	srli	a2,s1,0x3
   11490:	00848793          	addi	a5,s1,8
   11494:	b45ff06f          	j	10fd8 <_malloc_r+0x58>
   11498:	00a40733          	add	a4,s0,a0
   1149c:	00472783          	lw	a5,4(a4)
   114a0:	00098513          	mv	a0,s3
   114a4:	0017e793          	ori	a5,a5,1
   114a8:	00f72223          	sw	a5,4(a4)
   114ac:	580000ef          	jal	ra,11a2c <__malloc_unlock>
   114b0:	00840513          	addi	a0,s0,8
   114b4:	d01ff06f          	j	111b4 <_malloc_r+0x234>
   114b8:	0014e713          	ori	a4,s1,1
   114bc:	00e42223          	sw	a4,4(s0)
   114c0:	009404b3          	add	s1,s0,s1
   114c4:	00992a23          	sw	s1,20(s2)
   114c8:	00992823          	sw	s1,16(s2)
   114cc:	0017e713          	ori	a4,a5,1
   114d0:	0114a623          	sw	a7,12(s1)
   114d4:	0114a423          	sw	a7,8(s1)
   114d8:	00e4a223          	sw	a4,4(s1)
   114dc:	00a40533          	add	a0,s0,a0
   114e0:	00f52023          	sw	a5,0(a0)
   114e4:	00098513          	mv	a0,s3
   114e8:	544000ef          	jal	ra,11a2c <__malloc_unlock>
   114ec:	00840513          	addi	a0,s0,8
   114f0:	cc5ff06f          	j	111b4 <_malloc_r+0x234>
   114f4:	00655793          	srli	a5,a0,0x6
   114f8:	03978693          	addi	a3,a5,57
   114fc:	03878593          	addi	a1,a5,56
   11500:	00369693          	slli	a3,a3,0x3
   11504:	ec5ff06f          	j	113c8 <_malloc_r+0x448>
   11508:	11240e63          	beq	s0,s2,11624 <_malloc_r+0x6a4>
   1150c:	00892403          	lw	s0,8(s2)
   11510:	00442a83          	lw	s5,4(s0)
   11514:	ffcafa93          	andi	s5,s5,-4
   11518:	409a87b3          	sub	a5,s5,s1
   1151c:	009ae663          	bltu	s5,s1,11528 <_malloc_r+0x5a8>
   11520:	00f00713          	li	a4,15
   11524:	e4f748e3          	blt	a4,a5,11374 <_malloc_r+0x3f4>
   11528:	00098513          	mv	a0,s3
   1152c:	500000ef          	jal	ra,11a2c <__malloc_unlock>
   11530:	00000513          	li	a0,0
   11534:	c81ff06f          	j	111b4 <_malloc_r+0x234>
   11538:	05c78613          	addi	a2,a5,92
   1153c:	05b78513          	addi	a0,a5,91
   11540:	00361693          	slli	a3,a2,0x3
   11544:	b19ff06f          	j	1105c <_malloc_r+0xdc>
   11548:	00832783          	lw	a5,8(t1) # 1014c <frame_dummy+0x20>
   1154c:	fff60613          	addi	a2,a2,-1
   11550:	1c679063          	bne	a5,t1,11710 <_malloc_r+0x790>
   11554:	00367793          	andi	a5,a2,3
   11558:	ff830313          	addi	t1,t1,-8
   1155c:	fe0796e3          	bnez	a5,11548 <_malloc_r+0x5c8>
   11560:	00492703          	lw	a4,4(s2)
   11564:	fff5c793          	not	a5,a1
   11568:	00e7f7b3          	and	a5,a5,a4
   1156c:	00f92223          	sw	a5,4(s2)
   11570:	00159593          	slli	a1,a1,0x1
   11574:	cab7e8e3          	bltu	a5,a1,11224 <_malloc_r+0x2a4>
   11578:	ca0586e3          	beqz	a1,11224 <_malloc_r+0x2a4>
   1157c:	00f5f733          	and	a4,a1,a5
   11580:	00071a63          	bnez	a4,11594 <_malloc_r+0x614>
   11584:	00159593          	slli	a1,a1,0x1
   11588:	00f5f733          	and	a4,a1,a5
   1158c:	004e0e13          	addi	t3,t3,4
   11590:	fe070ae3          	beqz	a4,11584 <_malloc_r+0x604>
   11594:	000e0613          	mv	a2,t3
   11598:	bb1ff06f          	j	11148 <_malloc_r+0x1c8>
   1159c:	010a8a93          	addi	s5,s5,16
   115a0:	ccdff06f          	j	1126c <_malloc_r+0x2ec>
   115a4:	00492503          	lw	a0,4(s2)
   115a8:	4025d593          	srai	a1,a1,0x2
   115ac:	00100713          	li	a4,1
   115b0:	00b71733          	sll	a4,a4,a1
   115b4:	00a76733          	or	a4,a4,a0
   115b8:	00e92223          	sw	a4,4(s2)
   115bc:	e39ff06f          	j	113f4 <_malloc_r+0x474>
   115c0:	015b85b3          	add	a1,s7,s5
   115c4:	40b005b3          	neg	a1,a1
   115c8:	01459593          	slli	a1,a1,0x14
   115cc:	0145da13          	srli	s4,a1,0x14
   115d0:	000a0593          	mv	a1,s4
   115d4:	00098513          	mv	a0,s3
   115d8:	1cd000ef          	jal	ra,11fa4 <_sbrk_r>
   115dc:	fff00793          	li	a5,-1
   115e0:	d0f51ce3          	bne	a0,a5,112f8 <_malloc_r+0x378>
   115e4:	00000a13          	li	s4,0
   115e8:	d19ff06f          	j	11300 <_malloc_r+0x380>
   115ec:	05400713          	li	a4,84
   115f0:	08f76063          	bltu	a4,a5,11670 <_malloc_r+0x6f0>
   115f4:	00c55793          	srli	a5,a0,0xc
   115f8:	06f78693          	addi	a3,a5,111
   115fc:	06e78593          	addi	a1,a5,110
   11600:	00369693          	slli	a3,a3,0x3
   11604:	dc5ff06f          	j	113c8 <_malloc_r+0x448>
   11608:	15400713          	li	a4,340
   1160c:	08f76063          	bltu	a4,a5,1168c <_malloc_r+0x70c>
   11610:	00f4d793          	srli	a5,s1,0xf
   11614:	07878613          	addi	a2,a5,120
   11618:	07778513          	addi	a0,a5,119
   1161c:	00361693          	slli	a3,a2,0x3
   11620:	a3dff06f          	j	1105c <_malloc_r+0xdc>
   11624:	07018c13          	addi	s8,gp,112 # 14e08 <__malloc_current_mallinfo>
   11628:	000c2783          	lw	a5,0(s8)
   1162c:	00fa87b3          	add	a5,s5,a5
   11630:	00fc2023          	sw	a5,0(s8)
   11634:	c6dff06f          	j	112a0 <_malloc_r+0x320>
   11638:	014a1713          	slli	a4,s4,0x14
   1163c:	c60712e3          	bnez	a4,112a0 <_malloc_r+0x320>
   11640:	00892403          	lw	s0,8(s2)
   11644:	015b0ab3          	add	s5,s6,s5
   11648:	001aea93          	ori	s5,s5,1
   1164c:	01542223          	sw	s5,4(s0)
   11650:	d09ff06f          	j	11358 <_malloc_r+0x3d8>
   11654:	0371ae23          	sw	s7,60(gp) # 14dd4 <__malloc_sbrk_base>
   11658:	c61ff06f          	j	112b8 <_malloc_r+0x338>
   1165c:	000b8413          	mv	s0,s7
   11660:	cf9ff06f          	j	11358 <_malloc_r+0x3d8>
   11664:	00100793          	li	a5,1
   11668:	00fba223          	sw	a5,4(s7)
   1166c:	ebdff06f          	j	11528 <_malloc_r+0x5a8>
   11670:	15400713          	li	a4,340
   11674:	06f76263          	bltu	a4,a5,116d8 <_malloc_r+0x758>
   11678:	00f55793          	srli	a5,a0,0xf
   1167c:	07878693          	addi	a3,a5,120
   11680:	07778593          	addi	a1,a5,119
   11684:	00369693          	slli	a3,a3,0x3
   11688:	d41ff06f          	j	113c8 <_malloc_r+0x448>
   1168c:	55400713          	li	a4,1364
   11690:	06f76263          	bltu	a4,a5,116f4 <_malloc_r+0x774>
   11694:	0124d793          	srli	a5,s1,0x12
   11698:	07d78613          	addi	a2,a5,125
   1169c:	07c78513          	addi	a0,a5,124
   116a0:	00361693          	slli	a3,a2,0x3
   116a4:	9b9ff06f          	j	1105c <_malloc_r+0xdc>
   116a8:	ff8c8c93          	addi	s9,s9,-8
   116ac:	019a8ab3          	add	s5,s5,s9
   116b0:	417a8ab3          	sub	s5,s5,s7
   116b4:	00000a13          	li	s4,0
   116b8:	c49ff06f          	j	11300 <_malloc_r+0x380>
   116bc:	00840593          	addi	a1,s0,8
   116c0:	00098513          	mv	a0,s3
   116c4:	1f4010ef          	jal	ra,128b8 <_free_r>
   116c8:	00892403          	lw	s0,8(s2)
   116cc:	000c2583          	lw	a1,0(s8)
   116d0:	00442a83          	lw	s5,4(s0)
   116d4:	c85ff06f          	j	11358 <_malloc_r+0x3d8>
   116d8:	55400713          	li	a4,1364
   116dc:	02f76463          	bltu	a4,a5,11704 <_malloc_r+0x784>
   116e0:	01255793          	srli	a5,a0,0x12
   116e4:	07d78693          	addi	a3,a5,125
   116e8:	07c78593          	addi	a1,a5,124
   116ec:	00369693          	slli	a3,a3,0x3
   116f0:	cd9ff06f          	j	113c8 <_malloc_r+0x448>
   116f4:	3f800693          	li	a3,1016
   116f8:	07f00613          	li	a2,127
   116fc:	07e00513          	li	a0,126
   11700:	95dff06f          	j	1105c <_malloc_r+0xdc>
   11704:	3f800693          	li	a3,1016
   11708:	07e00593          	li	a1,126
   1170c:	cbdff06f          	j	113c8 <_malloc_r+0x448>
   11710:	00492783          	lw	a5,4(s2)
   11714:	e5dff06f          	j	11570 <_malloc_r+0x5f0>

00011718 <memchr>:
   11718:	00357793          	andi	a5,a0,3
   1171c:	0ff5f693          	andi	a3,a1,255
   11720:	02078a63          	beqz	a5,11754 <memchr+0x3c>
   11724:	fff60793          	addi	a5,a2,-1
   11728:	02060e63          	beqz	a2,11764 <memchr+0x4c>
   1172c:	fff00613          	li	a2,-1
   11730:	0180006f          	j	11748 <memchr+0x30>
   11734:	00150513          	addi	a0,a0,1
   11738:	00357713          	andi	a4,a0,3
   1173c:	00070e63          	beqz	a4,11758 <memchr+0x40>
   11740:	fff78793          	addi	a5,a5,-1
   11744:	02c78063          	beq	a5,a2,11764 <memchr+0x4c>
   11748:	00054703          	lbu	a4,0(a0)
   1174c:	fed714e3          	bne	a4,a3,11734 <memchr+0x1c>
   11750:	00008067          	ret
   11754:	00060793          	mv	a5,a2
   11758:	00300713          	li	a4,3
   1175c:	02f76663          	bltu	a4,a5,11788 <memchr+0x70>
   11760:	00079663          	bnez	a5,1176c <memchr+0x54>
   11764:	00000513          	li	a0,0
   11768:	00008067          	ret
   1176c:	00f507b3          	add	a5,a0,a5
   11770:	00c0006f          	j	1177c <memchr+0x64>
   11774:	00150513          	addi	a0,a0,1
   11778:	fea786e3          	beq	a5,a0,11764 <memchr+0x4c>
   1177c:	00054703          	lbu	a4,0(a0)
   11780:	fed71ae3          	bne	a4,a3,11774 <memchr+0x5c>
   11784:	00008067          	ret
   11788:	00010737          	lui	a4,0x10
   1178c:	00859893          	slli	a7,a1,0x8
   11790:	fff70713          	addi	a4,a4,-1 # ffff <register_fini-0x75>
   11794:	00e8f8b3          	and	a7,a7,a4
   11798:	0ff5f593          	andi	a1,a1,255
   1179c:	00b8e5b3          	or	a1,a7,a1
   117a0:	01059893          	slli	a7,a1,0x10
   117a4:	00b8e8b3          	or	a7,a7,a1
   117a8:	feff0837          	lui	a6,0xfeff0
   117ac:	808085b7          	lui	a1,0x80808
   117b0:	eff80813          	addi	a6,a6,-257 # fefefeff <__BSS_END__+0xfefdb0cb>
   117b4:	08058593          	addi	a1,a1,128 # 80808080 <__BSS_END__+0x807f324c>
   117b8:	00300313          	li	t1,3
   117bc:	00052703          	lw	a4,0(a0)
   117c0:	00e8c733          	xor	a4,a7,a4
   117c4:	01070633          	add	a2,a4,a6
   117c8:	fff74713          	not	a4,a4
   117cc:	00e67733          	and	a4,a2,a4
   117d0:	00b77733          	and	a4,a4,a1
   117d4:	f8071ce3          	bnez	a4,1176c <memchr+0x54>
   117d8:	ffc78793          	addi	a5,a5,-4
   117dc:	00450513          	addi	a0,a0,4
   117e0:	fcf36ee3          	bltu	t1,a5,117bc <memchr+0xa4>
   117e4:	f80794e3          	bnez	a5,1176c <memchr+0x54>
   117e8:	f7dff06f          	j	11764 <memchr+0x4c>

000117ec <memcpy>:
   117ec:	00a5c7b3          	xor	a5,a1,a0
   117f0:	0037f793          	andi	a5,a5,3
   117f4:	00c508b3          	add	a7,a0,a2
   117f8:	06079263          	bnez	a5,1185c <memcpy+0x70>
   117fc:	00300793          	li	a5,3
   11800:	04c7fe63          	bgeu	a5,a2,1185c <memcpy+0x70>
   11804:	00357793          	andi	a5,a0,3
   11808:	00050713          	mv	a4,a0
   1180c:	06079863          	bnez	a5,1187c <memcpy+0x90>
   11810:	ffc8f613          	andi	a2,a7,-4
   11814:	fe060793          	addi	a5,a2,-32
   11818:	08f76c63          	bltu	a4,a5,118b0 <memcpy+0xc4>
   1181c:	02c77c63          	bgeu	a4,a2,11854 <memcpy+0x68>
   11820:	00058693          	mv	a3,a1
   11824:	00070793          	mv	a5,a4
   11828:	0006a803          	lw	a6,0(a3)
   1182c:	00478793          	addi	a5,a5,4
   11830:	00468693          	addi	a3,a3,4
   11834:	ff07ae23          	sw	a6,-4(a5)
   11838:	fec7e8e3          	bltu	a5,a2,11828 <memcpy+0x3c>
   1183c:	fff60793          	addi	a5,a2,-1
   11840:	40e787b3          	sub	a5,a5,a4
   11844:	ffc7f793          	andi	a5,a5,-4
   11848:	00478793          	addi	a5,a5,4
   1184c:	00f70733          	add	a4,a4,a5
   11850:	00f585b3          	add	a1,a1,a5
   11854:	01176863          	bltu	a4,a7,11864 <memcpy+0x78>
   11858:	00008067          	ret
   1185c:	00050713          	mv	a4,a0
   11860:	ff157ce3          	bgeu	a0,a7,11858 <memcpy+0x6c>
   11864:	0005c783          	lbu	a5,0(a1)
   11868:	00170713          	addi	a4,a4,1
   1186c:	00158593          	addi	a1,a1,1
   11870:	fef70fa3          	sb	a5,-1(a4)
   11874:	ff1768e3          	bltu	a4,a7,11864 <memcpy+0x78>
   11878:	00008067          	ret
   1187c:	0005c683          	lbu	a3,0(a1)
   11880:	00170713          	addi	a4,a4,1
   11884:	00377793          	andi	a5,a4,3
   11888:	fed70fa3          	sb	a3,-1(a4)
   1188c:	00158593          	addi	a1,a1,1
   11890:	f80780e3          	beqz	a5,11810 <memcpy+0x24>
   11894:	0005c683          	lbu	a3,0(a1)
   11898:	00170713          	addi	a4,a4,1
   1189c:	00377793          	andi	a5,a4,3
   118a0:	fed70fa3          	sb	a3,-1(a4)
   118a4:	00158593          	addi	a1,a1,1
   118a8:	fc079ae3          	bnez	a5,1187c <memcpy+0x90>
   118ac:	f65ff06f          	j	11810 <memcpy+0x24>
   118b0:	0045a683          	lw	a3,4(a1)
   118b4:	0005a283          	lw	t0,0(a1)
   118b8:	0085af83          	lw	t6,8(a1)
   118bc:	00c5af03          	lw	t5,12(a1)
   118c0:	0105ae83          	lw	t4,16(a1)
   118c4:	0145ae03          	lw	t3,20(a1)
   118c8:	0185a303          	lw	t1,24(a1)
   118cc:	01c5a803          	lw	a6,28(a1)
   118d0:	00d72223          	sw	a3,4(a4)
   118d4:	0205a683          	lw	a3,32(a1)
   118d8:	00572023          	sw	t0,0(a4)
   118dc:	01f72423          	sw	t6,8(a4)
   118e0:	01e72623          	sw	t5,12(a4)
   118e4:	01d72823          	sw	t4,16(a4)
   118e8:	01c72a23          	sw	t3,20(a4)
   118ec:	00672c23          	sw	t1,24(a4)
   118f0:	01072e23          	sw	a6,28(a4)
   118f4:	02d72023          	sw	a3,32(a4)
   118f8:	02470713          	addi	a4,a4,36
   118fc:	02458593          	addi	a1,a1,36
   11900:	faf768e3          	bltu	a4,a5,118b0 <memcpy+0xc4>
   11904:	f19ff06f          	j	1181c <memcpy+0x30>

00011908 <memmove>:
   11908:	02a5f663          	bgeu	a1,a0,11934 <memmove+0x2c>
   1190c:	00c587b3          	add	a5,a1,a2
   11910:	02f57263          	bgeu	a0,a5,11934 <memmove+0x2c>
   11914:	00c50733          	add	a4,a0,a2
   11918:	0e060a63          	beqz	a2,11a0c <memmove+0x104>
   1191c:	fff7c683          	lbu	a3,-1(a5)
   11920:	fff78793          	addi	a5,a5,-1
   11924:	fff70713          	addi	a4,a4,-1
   11928:	00d70023          	sb	a3,0(a4)
   1192c:	fef598e3          	bne	a1,a5,1191c <memmove+0x14>
   11930:	00008067          	ret
   11934:	00f00793          	li	a5,15
   11938:	02c7e863          	bltu	a5,a2,11968 <memmove+0x60>
   1193c:	00050793          	mv	a5,a0
   11940:	fff60693          	addi	a3,a2,-1
   11944:	0c060c63          	beqz	a2,11a1c <memmove+0x114>
   11948:	00168693          	addi	a3,a3,1
   1194c:	00d786b3          	add	a3,a5,a3
   11950:	0005c703          	lbu	a4,0(a1)
   11954:	00178793          	addi	a5,a5,1
   11958:	00158593          	addi	a1,a1,1
   1195c:	fee78fa3          	sb	a4,-1(a5)
   11960:	fed798e3          	bne	a5,a3,11950 <memmove+0x48>
   11964:	00008067          	ret
   11968:	00a5e7b3          	or	a5,a1,a0
   1196c:	0037f793          	andi	a5,a5,3
   11970:	0a079063          	bnez	a5,11a10 <memmove+0x108>
   11974:	ff060893          	addi	a7,a2,-16
   11978:	ff08f893          	andi	a7,a7,-16
   1197c:	01088893          	addi	a7,a7,16
   11980:	01150833          	add	a6,a0,a7
   11984:	00058713          	mv	a4,a1
   11988:	00050793          	mv	a5,a0
   1198c:	00072683          	lw	a3,0(a4)
   11990:	01070713          	addi	a4,a4,16
   11994:	01078793          	addi	a5,a5,16
   11998:	fed7a823          	sw	a3,-16(a5)
   1199c:	ff472683          	lw	a3,-12(a4)
   119a0:	fed7aa23          	sw	a3,-12(a5)
   119a4:	ff872683          	lw	a3,-8(a4)
   119a8:	fed7ac23          	sw	a3,-8(a5)
   119ac:	ffc72683          	lw	a3,-4(a4)
   119b0:	fed7ae23          	sw	a3,-4(a5)
   119b4:	fcf81ce3          	bne	a6,a5,1198c <memmove+0x84>
   119b8:	00c67713          	andi	a4,a2,12
   119bc:	011585b3          	add	a1,a1,a7
   119c0:	00f67813          	andi	a6,a2,15
   119c4:	04070e63          	beqz	a4,11a20 <memmove+0x118>
   119c8:	00058713          	mv	a4,a1
   119cc:	00078893          	mv	a7,a5
   119d0:	00300e13          	li	t3,3
   119d4:	00072303          	lw	t1,0(a4)
   119d8:	00470713          	addi	a4,a4,4
   119dc:	40e806b3          	sub	a3,a6,a4
   119e0:	0068a023          	sw	t1,0(a7)
   119e4:	00d586b3          	add	a3,a1,a3
   119e8:	00488893          	addi	a7,a7,4
   119ec:	fede64e3          	bltu	t3,a3,119d4 <memmove+0xcc>
   119f0:	ffc80713          	addi	a4,a6,-4
   119f4:	ffc77713          	andi	a4,a4,-4
   119f8:	00470713          	addi	a4,a4,4
   119fc:	00367613          	andi	a2,a2,3
   11a00:	00e787b3          	add	a5,a5,a4
   11a04:	00e585b3          	add	a1,a1,a4
   11a08:	f39ff06f          	j	11940 <memmove+0x38>
   11a0c:	00008067          	ret
   11a10:	fff60693          	addi	a3,a2,-1
   11a14:	00050793          	mv	a5,a0
   11a18:	f31ff06f          	j	11948 <memmove+0x40>
   11a1c:	00008067          	ret
   11a20:	00080613          	mv	a2,a6
   11a24:	f1dff06f          	j	11940 <memmove+0x38>

00011a28 <__malloc_lock>:
   11a28:	00008067          	ret

00011a2c <__malloc_unlock>:
   11a2c:	00008067          	ret

00011a30 <_realloc_r>:
   11a30:	fd010113          	addi	sp,sp,-48
   11a34:	03212023          	sw	s2,32(sp)
   11a38:	02112623          	sw	ra,44(sp)
   11a3c:	02812423          	sw	s0,40(sp)
   11a40:	02912223          	sw	s1,36(sp)
   11a44:	01312e23          	sw	s3,28(sp)
   11a48:	01412c23          	sw	s4,24(sp)
   11a4c:	01512a23          	sw	s5,20(sp)
   11a50:	01612823          	sw	s6,16(sp)
   11a54:	01712623          	sw	s7,12(sp)
   11a58:	01812423          	sw	s8,8(sp)
   11a5c:	00060913          	mv	s2,a2
   11a60:	22058263          	beqz	a1,11c84 <_realloc_r+0x254>
   11a64:	00058413          	mv	s0,a1
   11a68:	00050993          	mv	s3,a0
   11a6c:	fbdff0ef          	jal	ra,11a28 <__malloc_lock>
   11a70:	00b90493          	addi	s1,s2,11
   11a74:	01600793          	li	a5,22
   11a78:	0e97fc63          	bgeu	a5,s1,11b70 <_realloc_r+0x140>
   11a7c:	ff84f493          	andi	s1,s1,-8
   11a80:	00048713          	mv	a4,s1
   11a84:	0e04cc63          	bltz	s1,11b7c <_realloc_r+0x14c>
   11a88:	0f24ea63          	bltu	s1,s2,11b7c <_realloc_r+0x14c>
   11a8c:	ffc42783          	lw	a5,-4(s0)
   11a90:	ff840a93          	addi	s5,s0,-8
   11a94:	ffc7fa13          	andi	s4,a5,-4
   11a98:	014a8b33          	add	s6,s5,s4
   11a9c:	18ea5a63          	bge	s4,a4,11c30 <_realloc_r+0x200>
   11aa0:	c2818b93          	addi	s7,gp,-984 # 149c0 <__malloc_av_>
   11aa4:	008ba603          	lw	a2,8(s7)
   11aa8:	004b2683          	lw	a3,4(s6)
   11aac:	23660e63          	beq	a2,s6,11ce8 <_realloc_r+0x2b8>
   11ab0:	ffe6f613          	andi	a2,a3,-2
   11ab4:	00cb0633          	add	a2,s6,a2
   11ab8:	00462603          	lw	a2,4(a2)
   11abc:	00167613          	andi	a2,a2,1
   11ac0:	1a061463          	bnez	a2,11c68 <_realloc_r+0x238>
   11ac4:	ffc6f693          	andi	a3,a3,-4
   11ac8:	00da0633          	add	a2,s4,a3
   11acc:	32e65e63          	bge	a2,a4,11e08 <_realloc_r+0x3d8>
   11ad0:	0017f793          	andi	a5,a5,1
   11ad4:	02079463          	bnez	a5,11afc <_realloc_r+0xcc>
   11ad8:	ff842c03          	lw	s8,-8(s0)
   11adc:	418a8c33          	sub	s8,s5,s8
   11ae0:	004c2783          	lw	a5,4(s8)
   11ae4:	ffc7f793          	andi	a5,a5,-4
   11ae8:	00d786b3          	add	a3,a5,a3
   11aec:	01468bb3          	add	s7,a3,s4
   11af0:	34ebda63          	bge	s7,a4,11e44 <_realloc_r+0x414>
   11af4:	00fa0bb3          	add	s7,s4,a5
   11af8:	0cebd263          	bge	s7,a4,11bbc <_realloc_r+0x18c>
   11afc:	00090593          	mv	a1,s2
   11b00:	00098513          	mv	a0,s3
   11b04:	c7cff0ef          	jal	ra,10f80 <_malloc_r>
   11b08:	00050913          	mv	s2,a0
   11b0c:	04050c63          	beqz	a0,11b64 <_realloc_r+0x134>
   11b10:	ffc42783          	lw	a5,-4(s0)
   11b14:	ff850713          	addi	a4,a0,-8
   11b18:	ffe7f793          	andi	a5,a5,-2
   11b1c:	00fa87b3          	add	a5,s5,a5
   11b20:	30e78263          	beq	a5,a4,11e24 <_realloc_r+0x3f4>
   11b24:	ffca0613          	addi	a2,s4,-4
   11b28:	02400793          	li	a5,36
   11b2c:	30c7e663          	bltu	a5,a2,11e38 <_realloc_r+0x408>
   11b30:	01300713          	li	a4,19
   11b34:	00042683          	lw	a3,0(s0)
   11b38:	26c76c63          	bltu	a4,a2,11db0 <_realloc_r+0x380>
   11b3c:	00050793          	mv	a5,a0
   11b40:	00040713          	mv	a4,s0
   11b44:	00d7a023          	sw	a3,0(a5)
   11b48:	00472683          	lw	a3,4(a4)
   11b4c:	00d7a223          	sw	a3,4(a5)
   11b50:	00872703          	lw	a4,8(a4)
   11b54:	00e7a423          	sw	a4,8(a5)
   11b58:	00040593          	mv	a1,s0
   11b5c:	00098513          	mv	a0,s3
   11b60:	559000ef          	jal	ra,128b8 <_free_r>
   11b64:	00098513          	mv	a0,s3
   11b68:	ec5ff0ef          	jal	ra,11a2c <__malloc_unlock>
   11b6c:	01c0006f          	j	11b88 <_realloc_r+0x158>
   11b70:	01000493          	li	s1,16
   11b74:	01000713          	li	a4,16
   11b78:	f124fae3          	bgeu	s1,s2,11a8c <_realloc_r+0x5c>
   11b7c:	00c00793          	li	a5,12
   11b80:	00f9a023          	sw	a5,0(s3)
   11b84:	00000913          	li	s2,0
   11b88:	02c12083          	lw	ra,44(sp)
   11b8c:	02812403          	lw	s0,40(sp)
   11b90:	02412483          	lw	s1,36(sp)
   11b94:	01c12983          	lw	s3,28(sp)
   11b98:	01812a03          	lw	s4,24(sp)
   11b9c:	01412a83          	lw	s5,20(sp)
   11ba0:	01012b03          	lw	s6,16(sp)
   11ba4:	00c12b83          	lw	s7,12(sp)
   11ba8:	00812c03          	lw	s8,8(sp)
   11bac:	00090513          	mv	a0,s2
   11bb0:	02012903          	lw	s2,32(sp)
   11bb4:	03010113          	addi	sp,sp,48
   11bb8:	00008067          	ret
   11bbc:	00cc2783          	lw	a5,12(s8)
   11bc0:	008c2703          	lw	a4,8(s8)
   11bc4:	ffca0613          	addi	a2,s4,-4
   11bc8:	02400693          	li	a3,36
   11bcc:	00f72623          	sw	a5,12(a4)
   11bd0:	00e7a423          	sw	a4,8(a5)
   11bd4:	008c0913          	addi	s2,s8,8
   11bd8:	017c0b33          	add	s6,s8,s7
   11bdc:	2ec6e463          	bltu	a3,a2,11ec4 <_realloc_r+0x494>
   11be0:	01300593          	li	a1,19
   11be4:	00042703          	lw	a4,0(s0)
   11be8:	00090793          	mv	a5,s2
   11bec:	02c5f263          	bgeu	a1,a2,11c10 <_realloc_r+0x1e0>
   11bf0:	00ec2423          	sw	a4,8(s8)
   11bf4:	00442703          	lw	a4,4(s0)
   11bf8:	01b00793          	li	a5,27
   11bfc:	00ec2623          	sw	a4,12(s8)
   11c00:	30c7e263          	bltu	a5,a2,11f04 <_realloc_r+0x4d4>
   11c04:	00842703          	lw	a4,8(s0)
   11c08:	010c0793          	addi	a5,s8,16
   11c0c:	00840413          	addi	s0,s0,8
   11c10:	00e7a023          	sw	a4,0(a5)
   11c14:	00442703          	lw	a4,4(s0)
   11c18:	000b8a13          	mv	s4,s7
   11c1c:	000c0a93          	mv	s5,s8
   11c20:	00e7a223          	sw	a4,4(a5)
   11c24:	00842703          	lw	a4,8(s0)
   11c28:	00090413          	mv	s0,s2
   11c2c:	00e7a423          	sw	a4,8(a5)
   11c30:	004aa783          	lw	a5,4(s5)
   11c34:	409a0733          	sub	a4,s4,s1
   11c38:	00f00693          	li	a3,15
   11c3c:	0017f793          	andi	a5,a5,1
   11c40:	06e6ec63          	bltu	a3,a4,11cb8 <_realloc_r+0x288>
   11c44:	00fa67b3          	or	a5,s4,a5
   11c48:	00faa223          	sw	a5,4(s5)
   11c4c:	004b2783          	lw	a5,4(s6)
   11c50:	0017e793          	ori	a5,a5,1
   11c54:	00fb2223          	sw	a5,4(s6)
   11c58:	00098513          	mv	a0,s3
   11c5c:	dd1ff0ef          	jal	ra,11a2c <__malloc_unlock>
   11c60:	00040913          	mv	s2,s0
   11c64:	f25ff06f          	j	11b88 <_realloc_r+0x158>
   11c68:	0017f793          	andi	a5,a5,1
   11c6c:	e80798e3          	bnez	a5,11afc <_realloc_r+0xcc>
   11c70:	ff842c03          	lw	s8,-8(s0)
   11c74:	418a8c33          	sub	s8,s5,s8
   11c78:	004c2783          	lw	a5,4(s8)
   11c7c:	ffc7f793          	andi	a5,a5,-4
   11c80:	e75ff06f          	j	11af4 <_realloc_r+0xc4>
   11c84:	02812403          	lw	s0,40(sp)
   11c88:	02c12083          	lw	ra,44(sp)
   11c8c:	02412483          	lw	s1,36(sp)
   11c90:	02012903          	lw	s2,32(sp)
   11c94:	01c12983          	lw	s3,28(sp)
   11c98:	01812a03          	lw	s4,24(sp)
   11c9c:	01412a83          	lw	s5,20(sp)
   11ca0:	01012b03          	lw	s6,16(sp)
   11ca4:	00c12b83          	lw	s7,12(sp)
   11ca8:	00812c03          	lw	s8,8(sp)
   11cac:	00060593          	mv	a1,a2
   11cb0:	03010113          	addi	sp,sp,48
   11cb4:	accff06f          	j	10f80 <_malloc_r>
   11cb8:	0097e7b3          	or	a5,a5,s1
   11cbc:	00faa223          	sw	a5,4(s5)
   11cc0:	009a85b3          	add	a1,s5,s1
   11cc4:	00176713          	ori	a4,a4,1
   11cc8:	00e5a223          	sw	a4,4(a1)
   11ccc:	004b2783          	lw	a5,4(s6)
   11cd0:	00858593          	addi	a1,a1,8
   11cd4:	00098513          	mv	a0,s3
   11cd8:	0017e793          	ori	a5,a5,1
   11cdc:	00fb2223          	sw	a5,4(s6)
   11ce0:	3d9000ef          	jal	ra,128b8 <_free_r>
   11ce4:	f75ff06f          	j	11c58 <_realloc_r+0x228>
   11ce8:	ffc6f693          	andi	a3,a3,-4
   11cec:	00da0633          	add	a2,s4,a3
   11cf0:	01048593          	addi	a1,s1,16
   11cf4:	0eb65063          	bge	a2,a1,11dd4 <_realloc_r+0x3a4>
   11cf8:	0017f793          	andi	a5,a5,1
   11cfc:	e00790e3          	bnez	a5,11afc <_realloc_r+0xcc>
   11d00:	ff842c03          	lw	s8,-8(s0)
   11d04:	418a8c33          	sub	s8,s5,s8
   11d08:	004c2783          	lw	a5,4(s8)
   11d0c:	ffc7f793          	andi	a5,a5,-4
   11d10:	00d786b3          	add	a3,a5,a3
   11d14:	01468b33          	add	s6,a3,s4
   11d18:	dcbb4ee3          	blt	s6,a1,11af4 <_realloc_r+0xc4>
   11d1c:	00cc2783          	lw	a5,12(s8)
   11d20:	008c2703          	lw	a4,8(s8)
   11d24:	ffca0613          	addi	a2,s4,-4
   11d28:	02400693          	li	a3,36
   11d2c:	00f72623          	sw	a5,12(a4)
   11d30:	00e7a423          	sw	a4,8(a5)
   11d34:	008c0913          	addi	s2,s8,8
   11d38:	20c6ee63          	bltu	a3,a2,11f54 <_realloc_r+0x524>
   11d3c:	01300593          	li	a1,19
   11d40:	00042703          	lw	a4,0(s0)
   11d44:	00090793          	mv	a5,s2
   11d48:	02c5f263          	bgeu	a1,a2,11d6c <_realloc_r+0x33c>
   11d4c:	00ec2423          	sw	a4,8(s8)
   11d50:	00442703          	lw	a4,4(s0)
   11d54:	01b00793          	li	a5,27
   11d58:	00ec2623          	sw	a4,12(s8)
   11d5c:	20c7e463          	bltu	a5,a2,11f64 <_realloc_r+0x534>
   11d60:	00842703          	lw	a4,8(s0)
   11d64:	010c0793          	addi	a5,s8,16
   11d68:	00840413          	addi	s0,s0,8
   11d6c:	00e7a023          	sw	a4,0(a5)
   11d70:	00442703          	lw	a4,4(s0)
   11d74:	00e7a223          	sw	a4,4(a5)
   11d78:	00842703          	lw	a4,8(s0)
   11d7c:	00e7a423          	sw	a4,8(a5)
   11d80:	009c0733          	add	a4,s8,s1
   11d84:	409b07b3          	sub	a5,s6,s1
   11d88:	00eba423          	sw	a4,8(s7)
   11d8c:	0017e793          	ori	a5,a5,1
   11d90:	00f72223          	sw	a5,4(a4)
   11d94:	004c2783          	lw	a5,4(s8)
   11d98:	00098513          	mv	a0,s3
   11d9c:	0017f793          	andi	a5,a5,1
   11da0:	0097e4b3          	or	s1,a5,s1
   11da4:	009c2223          	sw	s1,4(s8)
   11da8:	c85ff0ef          	jal	ra,11a2c <__malloc_unlock>
   11dac:	dddff06f          	j	11b88 <_realloc_r+0x158>
   11db0:	00d52023          	sw	a3,0(a0)
   11db4:	00442683          	lw	a3,4(s0)
   11db8:	01b00713          	li	a4,27
   11dbc:	00d52223          	sw	a3,4(a0)
   11dc0:	12c76063          	bltu	a4,a2,11ee0 <_realloc_r+0x4b0>
   11dc4:	00842683          	lw	a3,8(s0)
   11dc8:	00840713          	addi	a4,s0,8
   11dcc:	00850793          	addi	a5,a0,8
   11dd0:	d75ff06f          	j	11b44 <_realloc_r+0x114>
   11dd4:	009a8ab3          	add	s5,s5,s1
   11dd8:	409607b3          	sub	a5,a2,s1
   11ddc:	015ba423          	sw	s5,8(s7)
   11de0:	0017e793          	ori	a5,a5,1
   11de4:	00faa223          	sw	a5,4(s5)
   11de8:	ffc42783          	lw	a5,-4(s0)
   11dec:	00098513          	mv	a0,s3
   11df0:	00040913          	mv	s2,s0
   11df4:	0017f793          	andi	a5,a5,1
   11df8:	0097e4b3          	or	s1,a5,s1
   11dfc:	fe942e23          	sw	s1,-4(s0)
   11e00:	c2dff0ef          	jal	ra,11a2c <__malloc_unlock>
   11e04:	d85ff06f          	j	11b88 <_realloc_r+0x158>
   11e08:	00cb2783          	lw	a5,12(s6)
   11e0c:	008b2703          	lw	a4,8(s6)
   11e10:	00060a13          	mv	s4,a2
   11e14:	00ca8b33          	add	s6,s5,a2
   11e18:	00f72623          	sw	a5,12(a4)
   11e1c:	00e7a423          	sw	a4,8(a5)
   11e20:	e11ff06f          	j	11c30 <_realloc_r+0x200>
   11e24:	ffc52783          	lw	a5,-4(a0)
   11e28:	ffc7f793          	andi	a5,a5,-4
   11e2c:	00fa0a33          	add	s4,s4,a5
   11e30:	014a8b33          	add	s6,s5,s4
   11e34:	dfdff06f          	j	11c30 <_realloc_r+0x200>
   11e38:	00040593          	mv	a1,s0
   11e3c:	acdff0ef          	jal	ra,11908 <memmove>
   11e40:	d19ff06f          	j	11b58 <_realloc_r+0x128>
   11e44:	00cb2783          	lw	a5,12(s6)
   11e48:	008b2703          	lw	a4,8(s6)
   11e4c:	ffca0613          	addi	a2,s4,-4
   11e50:	02400693          	li	a3,36
   11e54:	00f72623          	sw	a5,12(a4)
   11e58:	00e7a423          	sw	a4,8(a5)
   11e5c:	008c2703          	lw	a4,8(s8)
   11e60:	00cc2783          	lw	a5,12(s8)
   11e64:	008c0913          	addi	s2,s8,8
   11e68:	017c0b33          	add	s6,s8,s7
   11e6c:	00f72623          	sw	a5,12(a4)
   11e70:	00e7a423          	sw	a4,8(a5)
   11e74:	04c6e863          	bltu	a3,a2,11ec4 <_realloc_r+0x494>
   11e78:	01300693          	li	a3,19
   11e7c:	00042703          	lw	a4,0(s0)
   11e80:	00090793          	mv	a5,s2
   11e84:	d8c6f6e3          	bgeu	a3,a2,11c10 <_realloc_r+0x1e0>
   11e88:	00ec2423          	sw	a4,8(s8)
   11e8c:	00442703          	lw	a4,4(s0)
   11e90:	01b00793          	li	a5,27
   11e94:	00ec2623          	sw	a4,12(s8)
   11e98:	00842703          	lw	a4,8(s0)
   11e9c:	d6c7f6e3          	bgeu	a5,a2,11c08 <_realloc_r+0x1d8>
   11ea0:	00ec2823          	sw	a4,16(s8)
   11ea4:	00c42703          	lw	a4,12(s0)
   11ea8:	02400793          	li	a5,36
   11eac:	00ec2a23          	sw	a4,20(s8)
   11eb0:	01042703          	lw	a4,16(s0)
   11eb4:	06f60463          	beq	a2,a5,11f1c <_realloc_r+0x4ec>
   11eb8:	018c0793          	addi	a5,s8,24
   11ebc:	01040413          	addi	s0,s0,16
   11ec0:	d51ff06f          	j	11c10 <_realloc_r+0x1e0>
   11ec4:	00040593          	mv	a1,s0
   11ec8:	00090513          	mv	a0,s2
   11ecc:	a3dff0ef          	jal	ra,11908 <memmove>
   11ed0:	00090413          	mv	s0,s2
   11ed4:	000b8a13          	mv	s4,s7
   11ed8:	000c0a93          	mv	s5,s8
   11edc:	d55ff06f          	j	11c30 <_realloc_r+0x200>
   11ee0:	00842703          	lw	a4,8(s0)
   11ee4:	00e52423          	sw	a4,8(a0)
   11ee8:	00c42703          	lw	a4,12(s0)
   11eec:	00e52623          	sw	a4,12(a0)
   11ef0:	01042683          	lw	a3,16(s0)
   11ef4:	04f60263          	beq	a2,a5,11f38 <_realloc_r+0x508>
   11ef8:	01040713          	addi	a4,s0,16
   11efc:	01050793          	addi	a5,a0,16
   11f00:	c45ff06f          	j	11b44 <_realloc_r+0x114>
   11f04:	00842783          	lw	a5,8(s0)
   11f08:	00fc2823          	sw	a5,16(s8)
   11f0c:	00c42783          	lw	a5,12(s0)
   11f10:	00fc2a23          	sw	a5,20(s8)
   11f14:	01042703          	lw	a4,16(s0)
   11f18:	fad610e3          	bne	a2,a3,11eb8 <_realloc_r+0x488>
   11f1c:	00ec2c23          	sw	a4,24(s8)
   11f20:	01442703          	lw	a4,20(s0)
   11f24:	020c0793          	addi	a5,s8,32
   11f28:	01840413          	addi	s0,s0,24
   11f2c:	00ec2e23          	sw	a4,28(s8)
   11f30:	00042703          	lw	a4,0(s0)
   11f34:	cddff06f          	j	11c10 <_realloc_r+0x1e0>
   11f38:	00d52823          	sw	a3,16(a0)
   11f3c:	01442683          	lw	a3,20(s0)
   11f40:	01840713          	addi	a4,s0,24
   11f44:	01850793          	addi	a5,a0,24
   11f48:	00d52a23          	sw	a3,20(a0)
   11f4c:	01842683          	lw	a3,24(s0)
   11f50:	bf5ff06f          	j	11b44 <_realloc_r+0x114>
   11f54:	00040593          	mv	a1,s0
   11f58:	00090513          	mv	a0,s2
   11f5c:	9adff0ef          	jal	ra,11908 <memmove>
   11f60:	e21ff06f          	j	11d80 <_realloc_r+0x350>
   11f64:	00842783          	lw	a5,8(s0)
   11f68:	00fc2823          	sw	a5,16(s8)
   11f6c:	00c42783          	lw	a5,12(s0)
   11f70:	00fc2a23          	sw	a5,20(s8)
   11f74:	01042703          	lw	a4,16(s0)
   11f78:	00d60863          	beq	a2,a3,11f88 <_realloc_r+0x558>
   11f7c:	018c0793          	addi	a5,s8,24
   11f80:	01040413          	addi	s0,s0,16
   11f84:	de9ff06f          	j	11d6c <_realloc_r+0x33c>
   11f88:	00ec2c23          	sw	a4,24(s8)
   11f8c:	01442703          	lw	a4,20(s0)
   11f90:	020c0793          	addi	a5,s8,32
   11f94:	01840413          	addi	s0,s0,24
   11f98:	00ec2e23          	sw	a4,28(s8)
   11f9c:	00042703          	lw	a4,0(s0)
   11fa0:	dcdff06f          	j	11d6c <_realloc_r+0x33c>

00011fa4 <_sbrk_r>:
   11fa4:	ff010113          	addi	sp,sp,-16
   11fa8:	00812423          	sw	s0,8(sp)
   11fac:	00912223          	sw	s1,4(sp)
   11fb0:	00050413          	mv	s0,a0
   11fb4:	00058513          	mv	a0,a1
   11fb8:	00112623          	sw	ra,12(sp)
   11fbc:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   11fc0:	344010ef          	jal	ra,13304 <_sbrk>
   11fc4:	fff00793          	li	a5,-1
   11fc8:	00f50c63          	beq	a0,a5,11fe0 <_sbrk_r+0x3c>
   11fcc:	00c12083          	lw	ra,12(sp)
   11fd0:	00812403          	lw	s0,8(sp)
   11fd4:	00412483          	lw	s1,4(sp)
   11fd8:	01010113          	addi	sp,sp,16
   11fdc:	00008067          	ret
   11fe0:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   11fe4:	fe0784e3          	beqz	a5,11fcc <_sbrk_r+0x28>
   11fe8:	00c12083          	lw	ra,12(sp)
   11fec:	00f42023          	sw	a5,0(s0)
   11ff0:	00812403          	lw	s0,8(sp)
   11ff4:	00412483          	lw	s1,4(sp)
   11ff8:	01010113          	addi	sp,sp,16
   11ffc:	00008067          	ret

00012000 <__sread>:
   12000:	ff010113          	addi	sp,sp,-16
   12004:	00812423          	sw	s0,8(sp)
   12008:	00058413          	mv	s0,a1
   1200c:	00e59583          	lh	a1,14(a1)
   12010:	00112623          	sw	ra,12(sp)
   12014:	5fd000ef          	jal	ra,12e10 <_read_r>
   12018:	02054063          	bltz	a0,12038 <__sread+0x38>
   1201c:	05042783          	lw	a5,80(s0)
   12020:	00c12083          	lw	ra,12(sp)
   12024:	00a787b3          	add	a5,a5,a0
   12028:	04f42823          	sw	a5,80(s0)
   1202c:	00812403          	lw	s0,8(sp)
   12030:	01010113          	addi	sp,sp,16
   12034:	00008067          	ret
   12038:	00c45783          	lhu	a5,12(s0)
   1203c:	fffff737          	lui	a4,0xfffff
   12040:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffea1cb>
   12044:	00e7f7b3          	and	a5,a5,a4
   12048:	00c12083          	lw	ra,12(sp)
   1204c:	00f41623          	sh	a5,12(s0)
   12050:	00812403          	lw	s0,8(sp)
   12054:	01010113          	addi	sp,sp,16
   12058:	00008067          	ret

0001205c <__seofread>:
   1205c:	00000513          	li	a0,0
   12060:	00008067          	ret

00012064 <__swrite>:
   12064:	00c59783          	lh	a5,12(a1)
   12068:	fe010113          	addi	sp,sp,-32
   1206c:	00812c23          	sw	s0,24(sp)
   12070:	00912a23          	sw	s1,20(sp)
   12074:	01212823          	sw	s2,16(sp)
   12078:	01312623          	sw	s3,12(sp)
   1207c:	00112e23          	sw	ra,28(sp)
   12080:	1007f713          	andi	a4,a5,256
   12084:	00058413          	mv	s0,a1
   12088:	00050493          	mv	s1,a0
   1208c:	00e59583          	lh	a1,14(a1)
   12090:	00060913          	mv	s2,a2
   12094:	00068993          	mv	s3,a3
   12098:	02071e63          	bnez	a4,120d4 <__swrite+0x70>
   1209c:	fffff737          	lui	a4,0xfffff
   120a0:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffea1cb>
   120a4:	00e7f7b3          	and	a5,a5,a4
   120a8:	00f41623          	sh	a5,12(s0)
   120ac:	01812403          	lw	s0,24(sp)
   120b0:	01c12083          	lw	ra,28(sp)
   120b4:	00098693          	mv	a3,s3
   120b8:	00090613          	mv	a2,s2
   120bc:	00c12983          	lw	s3,12(sp)
   120c0:	01012903          	lw	s2,16(sp)
   120c4:	00048513          	mv	a0,s1
   120c8:	01412483          	lw	s1,20(sp)
   120cc:	02010113          	addi	sp,sp,32
   120d0:	08c0006f          	j	1215c <_write_r>
   120d4:	00200693          	li	a3,2
   120d8:	00000613          	li	a2,0
   120dc:	2dd000ef          	jal	ra,12bb8 <_lseek_r>
   120e0:	00c41783          	lh	a5,12(s0)
   120e4:	00e41583          	lh	a1,14(s0)
   120e8:	fb5ff06f          	j	1209c <__swrite+0x38>

000120ec <__sseek>:
   120ec:	ff010113          	addi	sp,sp,-16
   120f0:	00812423          	sw	s0,8(sp)
   120f4:	00058413          	mv	s0,a1
   120f8:	00e59583          	lh	a1,14(a1)
   120fc:	00112623          	sw	ra,12(sp)
   12100:	2b9000ef          	jal	ra,12bb8 <_lseek_r>
   12104:	fff00793          	li	a5,-1
   12108:	02f50463          	beq	a0,a5,12130 <__sseek+0x44>
   1210c:	00c45783          	lhu	a5,12(s0)
   12110:	00001737          	lui	a4,0x1
   12114:	00c12083          	lw	ra,12(sp)
   12118:	00e7e7b3          	or	a5,a5,a4
   1211c:	04a42823          	sw	a0,80(s0)
   12120:	00f41623          	sh	a5,12(s0)
   12124:	00812403          	lw	s0,8(sp)
   12128:	01010113          	addi	sp,sp,16
   1212c:	00008067          	ret
   12130:	00c45783          	lhu	a5,12(s0)
   12134:	fffff737          	lui	a4,0xfffff
   12138:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffea1cb>
   1213c:	00e7f7b3          	and	a5,a5,a4
   12140:	00c12083          	lw	ra,12(sp)
   12144:	00f41623          	sh	a5,12(s0)
   12148:	00812403          	lw	s0,8(sp)
   1214c:	01010113          	addi	sp,sp,16
   12150:	00008067          	ret

00012154 <__sclose>:
   12154:	00e59583          	lh	a1,14(a1)
   12158:	1dc0006f          	j	12334 <_close_r>

0001215c <_write_r>:
   1215c:	ff010113          	addi	sp,sp,-16
   12160:	00058713          	mv	a4,a1
   12164:	00812423          	sw	s0,8(sp)
   12168:	00912223          	sw	s1,4(sp)
   1216c:	00060593          	mv	a1,a2
   12170:	00050413          	mv	s0,a0
   12174:	00068613          	mv	a2,a3
   12178:	00070513          	mv	a0,a4
   1217c:	00112623          	sw	ra,12(sp)
   12180:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   12184:	21c010ef          	jal	ra,133a0 <_write>
   12188:	fff00793          	li	a5,-1
   1218c:	00f50c63          	beq	a0,a5,121a4 <_write_r+0x48>
   12190:	00c12083          	lw	ra,12(sp)
   12194:	00812403          	lw	s0,8(sp)
   12198:	00412483          	lw	s1,4(sp)
   1219c:	01010113          	addi	sp,sp,16
   121a0:	00008067          	ret
   121a4:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   121a8:	fe0784e3          	beqz	a5,12190 <_write_r+0x34>
   121ac:	00c12083          	lw	ra,12(sp)
   121b0:	00f42023          	sw	a5,0(s0)
   121b4:	00812403          	lw	s0,8(sp)
   121b8:	00412483          	lw	s1,4(sp)
   121bc:	01010113          	addi	sp,sp,16
   121c0:	00008067          	ret

000121c4 <__swsetup_r>:
   121c4:	0381a783          	lw	a5,56(gp) # 14dd0 <_impure_ptr>
   121c8:	ff010113          	addi	sp,sp,-16
   121cc:	00812423          	sw	s0,8(sp)
   121d0:	00912223          	sw	s1,4(sp)
   121d4:	00112623          	sw	ra,12(sp)
   121d8:	00050493          	mv	s1,a0
   121dc:	00058413          	mv	s0,a1
   121e0:	00078663          	beqz	a5,121ec <__swsetup_r+0x28>
   121e4:	0387a703          	lw	a4,56(a5)
   121e8:	0e070063          	beqz	a4,122c8 <__swsetup_r+0x104>
   121ec:	00c41703          	lh	a4,12(s0)
   121f0:	01071793          	slli	a5,a4,0x10
   121f4:	00877693          	andi	a3,a4,8
   121f8:	0107d793          	srli	a5,a5,0x10
   121fc:	04068063          	beqz	a3,1223c <__swsetup_r+0x78>
   12200:	01042683          	lw	a3,16(s0)
   12204:	06068063          	beqz	a3,12264 <__swsetup_r+0xa0>
   12208:	0017f613          	andi	a2,a5,1
   1220c:	08060463          	beqz	a2,12294 <__swsetup_r+0xd0>
   12210:	01442603          	lw	a2,20(s0)
   12214:	00042423          	sw	zero,8(s0)
   12218:	00000513          	li	a0,0
   1221c:	40c00633          	neg	a2,a2
   12220:	00c42c23          	sw	a2,24(s0)
   12224:	08068663          	beqz	a3,122b0 <__swsetup_r+0xec>
   12228:	00c12083          	lw	ra,12(sp)
   1222c:	00812403          	lw	s0,8(sp)
   12230:	00412483          	lw	s1,4(sp)
   12234:	01010113          	addi	sp,sp,16
   12238:	00008067          	ret
   1223c:	0107f693          	andi	a3,a5,16
   12240:	0c068463          	beqz	a3,12308 <__swsetup_r+0x144>
   12244:	0047f793          	andi	a5,a5,4
   12248:	08079663          	bnez	a5,122d4 <__swsetup_r+0x110>
   1224c:	01042683          	lw	a3,16(s0)
   12250:	00876713          	ori	a4,a4,8
   12254:	01071793          	slli	a5,a4,0x10
   12258:	00e41623          	sh	a4,12(s0)
   1225c:	0107d793          	srli	a5,a5,0x10
   12260:	fa0694e3          	bnez	a3,12208 <__swsetup_r+0x44>
   12264:	2807f613          	andi	a2,a5,640
   12268:	20000593          	li	a1,512
   1226c:	f8b60ee3          	beq	a2,a1,12208 <__swsetup_r+0x44>
   12270:	00040593          	mv	a1,s0
   12274:	00048513          	mv	a0,s1
   12278:	279000ef          	jal	ra,12cf0 <__smakebuf_r>
   1227c:	00c41703          	lh	a4,12(s0)
   12280:	01042683          	lw	a3,16(s0)
   12284:	01071793          	slli	a5,a4,0x10
   12288:	0107d793          	srli	a5,a5,0x10
   1228c:	0017f613          	andi	a2,a5,1
   12290:	f80610e3          	bnez	a2,12210 <__swsetup_r+0x4c>
   12294:	0027f613          	andi	a2,a5,2
   12298:	00000593          	li	a1,0
   1229c:	00061463          	bnez	a2,122a4 <__swsetup_r+0xe0>
   122a0:	01442583          	lw	a1,20(s0)
   122a4:	00b42423          	sw	a1,8(s0)
   122a8:	00000513          	li	a0,0
   122ac:	f6069ee3          	bnez	a3,12228 <__swsetup_r+0x64>
   122b0:	0807f793          	andi	a5,a5,128
   122b4:	f6078ae3          	beqz	a5,12228 <__swsetup_r+0x64>
   122b8:	04076713          	ori	a4,a4,64
   122bc:	00e41623          	sh	a4,12(s0)
   122c0:	fff00513          	li	a0,-1
   122c4:	f65ff06f          	j	12228 <__swsetup_r+0x64>
   122c8:	00078513          	mv	a0,a5
   122cc:	e0cfe0ef          	jal	ra,108d8 <__sinit>
   122d0:	f1dff06f          	j	121ec <__swsetup_r+0x28>
   122d4:	03042583          	lw	a1,48(s0)
   122d8:	00058e63          	beqz	a1,122f4 <__swsetup_r+0x130>
   122dc:	04040793          	addi	a5,s0,64
   122e0:	00f58863          	beq	a1,a5,122f0 <__swsetup_r+0x12c>
   122e4:	00048513          	mv	a0,s1
   122e8:	5d0000ef          	jal	ra,128b8 <_free_r>
   122ec:	00c41703          	lh	a4,12(s0)
   122f0:	02042823          	sw	zero,48(s0)
   122f4:	01042683          	lw	a3,16(s0)
   122f8:	fdb77713          	andi	a4,a4,-37
   122fc:	00042223          	sw	zero,4(s0)
   12300:	00d42023          	sw	a3,0(s0)
   12304:	f4dff06f          	j	12250 <__swsetup_r+0x8c>
   12308:	00900793          	li	a5,9
   1230c:	00f4a023          	sw	a5,0(s1)
   12310:	04076713          	ori	a4,a4,64
   12314:	00e41623          	sh	a4,12(s0)
   12318:	fff00513          	li	a0,-1
   1231c:	f0dff06f          	j	12228 <__swsetup_r+0x64>

00012320 <atexit>:
   12320:	00050593          	mv	a1,a0
   12324:	00000693          	li	a3,0
   12328:	00000613          	li	a2,0
   1232c:	00000513          	li	a0,0
   12330:	4910006f          	j	12fc0 <__register_exitproc>

00012334 <_close_r>:
   12334:	ff010113          	addi	sp,sp,-16
   12338:	00812423          	sw	s0,8(sp)
   1233c:	00912223          	sw	s1,4(sp)
   12340:	00050413          	mv	s0,a0
   12344:	00058513          	mv	a0,a1
   12348:	00112623          	sw	ra,12(sp)
   1234c:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   12350:	5c9000ef          	jal	ra,13118 <_close>
   12354:	fff00793          	li	a5,-1
   12358:	00f50c63          	beq	a0,a5,12370 <_close_r+0x3c>
   1235c:	00c12083          	lw	ra,12(sp)
   12360:	00812403          	lw	s0,8(sp)
   12364:	00412483          	lw	s1,4(sp)
   12368:	01010113          	addi	sp,sp,16
   1236c:	00008067          	ret
   12370:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   12374:	fe0784e3          	beqz	a5,1235c <_close_r+0x28>
   12378:	00c12083          	lw	ra,12(sp)
   1237c:	00f42023          	sw	a5,0(s0)
   12380:	00812403          	lw	s0,8(sp)
   12384:	00412483          	lw	s1,4(sp)
   12388:	01010113          	addi	sp,sp,16
   1238c:	00008067          	ret

00012390 <_fclose_r>:
   12390:	ff010113          	addi	sp,sp,-16
   12394:	00112623          	sw	ra,12(sp)
   12398:	00812423          	sw	s0,8(sp)
   1239c:	00912223          	sw	s1,4(sp)
   123a0:	01212023          	sw	s2,0(sp)
   123a4:	02058063          	beqz	a1,123c4 <_fclose_r+0x34>
   123a8:	00058413          	mv	s0,a1
   123ac:	00050493          	mv	s1,a0
   123b0:	00050663          	beqz	a0,123bc <_fclose_r+0x2c>
   123b4:	03852783          	lw	a5,56(a0)
   123b8:	0a078c63          	beqz	a5,12470 <_fclose_r+0xe0>
   123bc:	00c41783          	lh	a5,12(s0)
   123c0:	02079263          	bnez	a5,123e4 <_fclose_r+0x54>
   123c4:	00c12083          	lw	ra,12(sp)
   123c8:	00812403          	lw	s0,8(sp)
   123cc:	00000913          	li	s2,0
   123d0:	00412483          	lw	s1,4(sp)
   123d4:	00090513          	mv	a0,s2
   123d8:	00012903          	lw	s2,0(sp)
   123dc:	01010113          	addi	sp,sp,16
   123e0:	00008067          	ret
   123e4:	00040593          	mv	a1,s0
   123e8:	00048513          	mv	a0,s1
   123ec:	0c0000ef          	jal	ra,124ac <__sflush_r>
   123f0:	02c42783          	lw	a5,44(s0)
   123f4:	00050913          	mv	s2,a0
   123f8:	00078a63          	beqz	a5,1240c <_fclose_r+0x7c>
   123fc:	01c42583          	lw	a1,28(s0)
   12400:	00048513          	mv	a0,s1
   12404:	000780e7          	jalr	a5
   12408:	06054c63          	bltz	a0,12480 <_fclose_r+0xf0>
   1240c:	00c45783          	lhu	a5,12(s0)
   12410:	0807f793          	andi	a5,a5,128
   12414:	06079e63          	bnez	a5,12490 <_fclose_r+0x100>
   12418:	03042583          	lw	a1,48(s0)
   1241c:	00058c63          	beqz	a1,12434 <_fclose_r+0xa4>
   12420:	04040793          	addi	a5,s0,64
   12424:	00f58663          	beq	a1,a5,12430 <_fclose_r+0xa0>
   12428:	00048513          	mv	a0,s1
   1242c:	48c000ef          	jal	ra,128b8 <_free_r>
   12430:	02042823          	sw	zero,48(s0)
   12434:	04442583          	lw	a1,68(s0)
   12438:	00058863          	beqz	a1,12448 <_fclose_r+0xb8>
   1243c:	00048513          	mv	a0,s1
   12440:	478000ef          	jal	ra,128b8 <_free_r>
   12444:	04042223          	sw	zero,68(s0)
   12448:	ca0fe0ef          	jal	ra,108e8 <__sfp_lock_acquire>
   1244c:	00041623          	sh	zero,12(s0)
   12450:	c9cfe0ef          	jal	ra,108ec <__sfp_lock_release>
   12454:	00c12083          	lw	ra,12(sp)
   12458:	00812403          	lw	s0,8(sp)
   1245c:	00412483          	lw	s1,4(sp)
   12460:	00090513          	mv	a0,s2
   12464:	00012903          	lw	s2,0(sp)
   12468:	01010113          	addi	sp,sp,16
   1246c:	00008067          	ret
   12470:	c68fe0ef          	jal	ra,108d8 <__sinit>
   12474:	00c41783          	lh	a5,12(s0)
   12478:	f40786e3          	beqz	a5,123c4 <_fclose_r+0x34>
   1247c:	f69ff06f          	j	123e4 <_fclose_r+0x54>
   12480:	00c45783          	lhu	a5,12(s0)
   12484:	fff00913          	li	s2,-1
   12488:	0807f793          	andi	a5,a5,128
   1248c:	f80786e3          	beqz	a5,12418 <_fclose_r+0x88>
   12490:	01042583          	lw	a1,16(s0)
   12494:	00048513          	mv	a0,s1
   12498:	420000ef          	jal	ra,128b8 <_free_r>
   1249c:	f7dff06f          	j	12418 <_fclose_r+0x88>

000124a0 <fclose>:
   124a0:	00050593          	mv	a1,a0
   124a4:	0381a503          	lw	a0,56(gp) # 14dd0 <_impure_ptr>
   124a8:	ee9ff06f          	j	12390 <_fclose_r>

000124ac <__sflush_r>:
   124ac:	00c59783          	lh	a5,12(a1)
   124b0:	fe010113          	addi	sp,sp,-32
   124b4:	00812c23          	sw	s0,24(sp)
   124b8:	01312623          	sw	s3,12(sp)
   124bc:	00112e23          	sw	ra,28(sp)
   124c0:	00912a23          	sw	s1,20(sp)
   124c4:	01212823          	sw	s2,16(sp)
   124c8:	0087f693          	andi	a3,a5,8
   124cc:	00058413          	mv	s0,a1
   124d0:	00050993          	mv	s3,a0
   124d4:	10069a63          	bnez	a3,125e8 <__sflush_r+0x13c>
   124d8:	00001737          	lui	a4,0x1
   124dc:	80070713          	addi	a4,a4,-2048 # 800 <register_fini-0xf874>
   124e0:	0045a683          	lw	a3,4(a1)
   124e4:	00e7e7b3          	or	a5,a5,a4
   124e8:	00f59623          	sh	a5,12(a1)
   124ec:	18d05463          	blez	a3,12674 <__sflush_r+0x1c8>
   124f0:	02842703          	lw	a4,40(s0)
   124f4:	0c070a63          	beqz	a4,125c8 <__sflush_r+0x11c>
   124f8:	0009a483          	lw	s1,0(s3)
   124fc:	01079693          	slli	a3,a5,0x10
   12500:	0009a023          	sw	zero,0(s3)
   12504:	01379613          	slli	a2,a5,0x13
   12508:	01c42583          	lw	a1,28(s0)
   1250c:	0106d693          	srli	a3,a3,0x10
   12510:	16064863          	bltz	a2,12680 <__sflush_r+0x1d4>
   12514:	00100693          	li	a3,1
   12518:	00000613          	li	a2,0
   1251c:	00098513          	mv	a0,s3
   12520:	000700e7          	jalr	a4
   12524:	fff00793          	li	a5,-1
   12528:	18f50c63          	beq	a0,a5,126c0 <__sflush_r+0x214>
   1252c:	00c45683          	lhu	a3,12(s0)
   12530:	02842703          	lw	a4,40(s0)
   12534:	01c42583          	lw	a1,28(s0)
   12538:	0046f693          	andi	a3,a3,4
   1253c:	00068e63          	beqz	a3,12558 <__sflush_r+0xac>
   12540:	00442683          	lw	a3,4(s0)
   12544:	03042783          	lw	a5,48(s0)
   12548:	40d50533          	sub	a0,a0,a3
   1254c:	00078663          	beqz	a5,12558 <__sflush_r+0xac>
   12550:	03c42783          	lw	a5,60(s0)
   12554:	40f50533          	sub	a0,a0,a5
   12558:	00050613          	mv	a2,a0
   1255c:	00000693          	li	a3,0
   12560:	00098513          	mv	a0,s3
   12564:	000700e7          	jalr	a4
   12568:	fff00793          	li	a5,-1
   1256c:	10f51e63          	bne	a0,a5,12688 <__sflush_r+0x1dc>
   12570:	0009a703          	lw	a4,0(s3)
   12574:	00c41783          	lh	a5,12(s0)
   12578:	16070863          	beqz	a4,126e8 <__sflush_r+0x23c>
   1257c:	01d00693          	li	a3,29
   12580:	00d70663          	beq	a4,a3,1258c <__sflush_r+0xe0>
   12584:	01600693          	li	a3,22
   12588:	0cd71463          	bne	a4,a3,12650 <__sflush_r+0x1a4>
   1258c:	01042683          	lw	a3,16(s0)
   12590:	fffff737          	lui	a4,0xfffff
   12594:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffea9cb>
   12598:	00e7f7b3          	and	a5,a5,a4
   1259c:	00f41623          	sh	a5,12(s0)
   125a0:	00042223          	sw	zero,4(s0)
   125a4:	00d42023          	sw	a3,0(s0)
   125a8:	03042583          	lw	a1,48(s0)
   125ac:	0099a023          	sw	s1,0(s3)
   125b0:	00058c63          	beqz	a1,125c8 <__sflush_r+0x11c>
   125b4:	04040793          	addi	a5,s0,64
   125b8:	00f58663          	beq	a1,a5,125c4 <__sflush_r+0x118>
   125bc:	00098513          	mv	a0,s3
   125c0:	2f8000ef          	jal	ra,128b8 <_free_r>
   125c4:	02042823          	sw	zero,48(s0)
   125c8:	00000513          	li	a0,0
   125cc:	01c12083          	lw	ra,28(sp)
   125d0:	01812403          	lw	s0,24(sp)
   125d4:	01412483          	lw	s1,20(sp)
   125d8:	01012903          	lw	s2,16(sp)
   125dc:	00c12983          	lw	s3,12(sp)
   125e0:	02010113          	addi	sp,sp,32
   125e4:	00008067          	ret
   125e8:	0105a903          	lw	s2,16(a1)
   125ec:	fc090ee3          	beqz	s2,125c8 <__sflush_r+0x11c>
   125f0:	0005a483          	lw	s1,0(a1)
   125f4:	01079713          	slli	a4,a5,0x10
   125f8:	01075713          	srli	a4,a4,0x10
   125fc:	00377713          	andi	a4,a4,3
   12600:	0125a023          	sw	s2,0(a1)
   12604:	412484b3          	sub	s1,s1,s2
   12608:	00000793          	li	a5,0
   1260c:	00071463          	bnez	a4,12614 <__sflush_r+0x168>
   12610:	0145a783          	lw	a5,20(a1)
   12614:	00f42423          	sw	a5,8(s0)
   12618:	00904863          	bgtz	s1,12628 <__sflush_r+0x17c>
   1261c:	fadff06f          	j	125c8 <__sflush_r+0x11c>
   12620:	00a90933          	add	s2,s2,a0
   12624:	fa9052e3          	blez	s1,125c8 <__sflush_r+0x11c>
   12628:	02442783          	lw	a5,36(s0)
   1262c:	01c42583          	lw	a1,28(s0)
   12630:	00048693          	mv	a3,s1
   12634:	00090613          	mv	a2,s2
   12638:	00098513          	mv	a0,s3
   1263c:	000780e7          	jalr	a5
   12640:	40a484b3          	sub	s1,s1,a0
   12644:	fca04ee3          	bgtz	a0,12620 <__sflush_r+0x174>
   12648:	00c45783          	lhu	a5,12(s0)
   1264c:	fff00513          	li	a0,-1
   12650:	0407e793          	ori	a5,a5,64
   12654:	01c12083          	lw	ra,28(sp)
   12658:	00f41623          	sh	a5,12(s0)
   1265c:	01812403          	lw	s0,24(sp)
   12660:	01412483          	lw	s1,20(sp)
   12664:	01012903          	lw	s2,16(sp)
   12668:	00c12983          	lw	s3,12(sp)
   1266c:	02010113          	addi	sp,sp,32
   12670:	00008067          	ret
   12674:	03c5a703          	lw	a4,60(a1)
   12678:	e6e04ce3          	bgtz	a4,124f0 <__sflush_r+0x44>
   1267c:	f4dff06f          	j	125c8 <__sflush_r+0x11c>
   12680:	05042503          	lw	a0,80(s0)
   12684:	eb5ff06f          	j	12538 <__sflush_r+0x8c>
   12688:	00c45783          	lhu	a5,12(s0)
   1268c:	fffff737          	lui	a4,0xfffff
   12690:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffea9cb>
   12694:	00e7f7b3          	and	a5,a5,a4
   12698:	01042683          	lw	a3,16(s0)
   1269c:	01079793          	slli	a5,a5,0x10
   126a0:	4107d793          	srai	a5,a5,0x10
   126a4:	00f41623          	sh	a5,12(s0)
   126a8:	00042223          	sw	zero,4(s0)
   126ac:	00d42023          	sw	a3,0(s0)
   126b0:	01379713          	slli	a4,a5,0x13
   126b4:	ee075ae3          	bgez	a4,125a8 <__sflush_r+0xfc>
   126b8:	04a42823          	sw	a0,80(s0)
   126bc:	eedff06f          	j	125a8 <__sflush_r+0xfc>
   126c0:	0009a783          	lw	a5,0(s3)
   126c4:	e60784e3          	beqz	a5,1252c <__sflush_r+0x80>
   126c8:	01d00713          	li	a4,29
   126cc:	02e78863          	beq	a5,a4,126fc <__sflush_r+0x250>
   126d0:	01600713          	li	a4,22
   126d4:	02e78463          	beq	a5,a4,126fc <__sflush_r+0x250>
   126d8:	00c45783          	lhu	a5,12(s0)
   126dc:	0407e793          	ori	a5,a5,64
   126e0:	00f41623          	sh	a5,12(s0)
   126e4:	ee9ff06f          	j	125cc <__sflush_r+0x120>
   126e8:	fffff737          	lui	a4,0xfffff
   126ec:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffea9cb>
   126f0:	01042683          	lw	a3,16(s0)
   126f4:	00e7f7b3          	and	a5,a5,a4
   126f8:	fadff06f          	j	126a4 <__sflush_r+0x1f8>
   126fc:	0099a023          	sw	s1,0(s3)
   12700:	00000513          	li	a0,0
   12704:	ec9ff06f          	j	125cc <__sflush_r+0x120>

00012708 <_fflush_r>:
   12708:	fe010113          	addi	sp,sp,-32
   1270c:	00812c23          	sw	s0,24(sp)
   12710:	00112e23          	sw	ra,28(sp)
   12714:	00050413          	mv	s0,a0
   12718:	00050663          	beqz	a0,12724 <_fflush_r+0x1c>
   1271c:	03852783          	lw	a5,56(a0)
   12720:	02078063          	beqz	a5,12740 <_fflush_r+0x38>
   12724:	00c59783          	lh	a5,12(a1)
   12728:	02079663          	bnez	a5,12754 <_fflush_r+0x4c>
   1272c:	01c12083          	lw	ra,28(sp)
   12730:	01812403          	lw	s0,24(sp)
   12734:	00000513          	li	a0,0
   12738:	02010113          	addi	sp,sp,32
   1273c:	00008067          	ret
   12740:	00b12623          	sw	a1,12(sp)
   12744:	994fe0ef          	jal	ra,108d8 <__sinit>
   12748:	00c12583          	lw	a1,12(sp)
   1274c:	00c59783          	lh	a5,12(a1)
   12750:	fc078ee3          	beqz	a5,1272c <_fflush_r+0x24>
   12754:	00040513          	mv	a0,s0
   12758:	01812403          	lw	s0,24(sp)
   1275c:	01c12083          	lw	ra,28(sp)
   12760:	02010113          	addi	sp,sp,32
   12764:	d49ff06f          	j	124ac <__sflush_r>

00012768 <fflush>:
   12768:	00050593          	mv	a1,a0
   1276c:	00050663          	beqz	a0,12778 <fflush+0x10>
   12770:	0381a503          	lw	a0,56(gp) # 14dd0 <_impure_ptr>
   12774:	f95ff06f          	j	12708 <_fflush_r>
   12778:	0301a503          	lw	a0,48(gp) # 14dc8 <_global_impure_ptr>
   1277c:	000125b7          	lui	a1,0x12
   12780:	70858593          	addi	a1,a1,1800 # 12708 <_fflush_r>
   12784:	f48fe06f          	j	10ecc <_fwalk_reent>

00012788 <_malloc_trim_r>:
   12788:	fe010113          	addi	sp,sp,-32
   1278c:	01312623          	sw	s3,12(sp)
   12790:	00812c23          	sw	s0,24(sp)
   12794:	00912a23          	sw	s1,20(sp)
   12798:	01212823          	sw	s2,16(sp)
   1279c:	01412423          	sw	s4,8(sp)
   127a0:	00112e23          	sw	ra,28(sp)
   127a4:	00058a13          	mv	s4,a1
   127a8:	00050913          	mv	s2,a0
   127ac:	c2818993          	addi	s3,gp,-984 # 149c0 <__malloc_av_>
   127b0:	a78ff0ef          	jal	ra,11a28 <__malloc_lock>
   127b4:	0089a703          	lw	a4,8(s3)
   127b8:	000017b7          	lui	a5,0x1
   127bc:	fef78413          	addi	s0,a5,-17 # fef <register_fini-0xf085>
   127c0:	00472483          	lw	s1,4(a4)
   127c4:	41440433          	sub	s0,s0,s4
   127c8:	ffc4f493          	andi	s1,s1,-4
   127cc:	00940433          	add	s0,s0,s1
   127d0:	00c45413          	srli	s0,s0,0xc
   127d4:	fff40413          	addi	s0,s0,-1
   127d8:	00c41413          	slli	s0,s0,0xc
   127dc:	00f44e63          	blt	s0,a5,127f8 <_malloc_trim_r+0x70>
   127e0:	00000593          	li	a1,0
   127e4:	00090513          	mv	a0,s2
   127e8:	fbcff0ef          	jal	ra,11fa4 <_sbrk_r>
   127ec:	0089a783          	lw	a5,8(s3)
   127f0:	009787b3          	add	a5,a5,s1
   127f4:	02f50863          	beq	a0,a5,12824 <_malloc_trim_r+0x9c>
   127f8:	00090513          	mv	a0,s2
   127fc:	a30ff0ef          	jal	ra,11a2c <__malloc_unlock>
   12800:	01c12083          	lw	ra,28(sp)
   12804:	01812403          	lw	s0,24(sp)
   12808:	01412483          	lw	s1,20(sp)
   1280c:	01012903          	lw	s2,16(sp)
   12810:	00c12983          	lw	s3,12(sp)
   12814:	00812a03          	lw	s4,8(sp)
   12818:	00000513          	li	a0,0
   1281c:	02010113          	addi	sp,sp,32
   12820:	00008067          	ret
   12824:	408005b3          	neg	a1,s0
   12828:	00090513          	mv	a0,s2
   1282c:	f78ff0ef          	jal	ra,11fa4 <_sbrk_r>
   12830:	fff00793          	li	a5,-1
   12834:	04f50863          	beq	a0,a5,12884 <_malloc_trim_r+0xfc>
   12838:	07018793          	addi	a5,gp,112 # 14e08 <__malloc_current_mallinfo>
   1283c:	0007a703          	lw	a4,0(a5)
   12840:	0089a683          	lw	a3,8(s3)
   12844:	408484b3          	sub	s1,s1,s0
   12848:	0014e493          	ori	s1,s1,1
   1284c:	40870433          	sub	s0,a4,s0
   12850:	00090513          	mv	a0,s2
   12854:	0096a223          	sw	s1,4(a3)
   12858:	0087a023          	sw	s0,0(a5)
   1285c:	9d0ff0ef          	jal	ra,11a2c <__malloc_unlock>
   12860:	01c12083          	lw	ra,28(sp)
   12864:	01812403          	lw	s0,24(sp)
   12868:	01412483          	lw	s1,20(sp)
   1286c:	01012903          	lw	s2,16(sp)
   12870:	00c12983          	lw	s3,12(sp)
   12874:	00812a03          	lw	s4,8(sp)
   12878:	00100513          	li	a0,1
   1287c:	02010113          	addi	sp,sp,32
   12880:	00008067          	ret
   12884:	00000593          	li	a1,0
   12888:	00090513          	mv	a0,s2
   1288c:	f18ff0ef          	jal	ra,11fa4 <_sbrk_r>
   12890:	0089a703          	lw	a4,8(s3)
   12894:	00f00693          	li	a3,15
   12898:	40e507b3          	sub	a5,a0,a4
   1289c:	f4f6dee3          	bge	a3,a5,127f8 <_malloc_trim_r+0x70>
   128a0:	03c1a683          	lw	a3,60(gp) # 14dd4 <__malloc_sbrk_base>
   128a4:	0017e793          	ori	a5,a5,1
   128a8:	00f72223          	sw	a5,4(a4)
   128ac:	40d50533          	sub	a0,a0,a3
   128b0:	06a1a823          	sw	a0,112(gp) # 14e08 <__malloc_current_mallinfo>
   128b4:	f45ff06f          	j	127f8 <_malloc_trim_r+0x70>

000128b8 <_free_r>:
   128b8:	12058463          	beqz	a1,129e0 <_free_r+0x128>
   128bc:	ff010113          	addi	sp,sp,-16
   128c0:	00812423          	sw	s0,8(sp)
   128c4:	00912223          	sw	s1,4(sp)
   128c8:	00058413          	mv	s0,a1
   128cc:	00050493          	mv	s1,a0
   128d0:	00112623          	sw	ra,12(sp)
   128d4:	954ff0ef          	jal	ra,11a28 <__malloc_lock>
   128d8:	ffc42803          	lw	a6,-4(s0)
   128dc:	ff840713          	addi	a4,s0,-8
   128e0:	ffe87793          	andi	a5,a6,-2
   128e4:	00f70633          	add	a2,a4,a5
   128e8:	c2818593          	addi	a1,gp,-984 # 149c0 <__malloc_av_>
   128ec:	00462683          	lw	a3,4(a2)
   128f0:	0085a503          	lw	a0,8(a1)
   128f4:	ffc6f693          	andi	a3,a3,-4
   128f8:	1ac50663          	beq	a0,a2,12aa4 <_free_r+0x1ec>
   128fc:	00d62223          	sw	a3,4(a2)
   12900:	00187813          	andi	a6,a6,1
   12904:	00d60533          	add	a0,a2,a3
   12908:	08081e63          	bnez	a6,129a4 <_free_r+0xec>
   1290c:	ff842303          	lw	t1,-8(s0)
   12910:	00452803          	lw	a6,4(a0)
   12914:	40670733          	sub	a4,a4,t1
   12918:	00872883          	lw	a7,8(a4)
   1291c:	c3018513          	addi	a0,gp,-976 # 149c8 <__malloc_av_+0x8>
   12920:	006787b3          	add	a5,a5,t1
   12924:	00187813          	andi	a6,a6,1
   12928:	12a88e63          	beq	a7,a0,12a64 <_free_r+0x1ac>
   1292c:	00c72303          	lw	t1,12(a4)
   12930:	0068a623          	sw	t1,12(a7)
   12934:	01132423          	sw	a7,8(t1)
   12938:	1c080e63          	beqz	a6,12b14 <_free_r+0x25c>
   1293c:	0017e693          	ori	a3,a5,1
   12940:	00d72223          	sw	a3,4(a4)
   12944:	00f62023          	sw	a5,0(a2)
   12948:	1ff00693          	li	a3,511
   1294c:	0af6e663          	bltu	a3,a5,129f8 <_free_r+0x140>
   12950:	ff87f693          	andi	a3,a5,-8
   12954:	00868693          	addi	a3,a3,8
   12958:	0045a503          	lw	a0,4(a1)
   1295c:	00d586b3          	add	a3,a1,a3
   12960:	0006a603          	lw	a2,0(a3)
   12964:	0057d813          	srli	a6,a5,0x5
   12968:	00100793          	li	a5,1
   1296c:	010797b3          	sll	a5,a5,a6
   12970:	00a7e7b3          	or	a5,a5,a0
   12974:	ff868513          	addi	a0,a3,-8
   12978:	00a72623          	sw	a0,12(a4)
   1297c:	00c72423          	sw	a2,8(a4)
   12980:	00f5a223          	sw	a5,4(a1)
   12984:	00e6a023          	sw	a4,0(a3)
   12988:	00e62623          	sw	a4,12(a2)
   1298c:	00812403          	lw	s0,8(sp)
   12990:	00c12083          	lw	ra,12(sp)
   12994:	00048513          	mv	a0,s1
   12998:	00412483          	lw	s1,4(sp)
   1299c:	01010113          	addi	sp,sp,16
   129a0:	88cff06f          	j	11a2c <__malloc_unlock>
   129a4:	00452503          	lw	a0,4(a0)
   129a8:	00157513          	andi	a0,a0,1
   129ac:	02051c63          	bnez	a0,129e4 <_free_r+0x12c>
   129b0:	00d787b3          	add	a5,a5,a3
   129b4:	c3018513          	addi	a0,gp,-976 # 149c8 <__malloc_av_+0x8>
   129b8:	00862683          	lw	a3,8(a2)
   129bc:	0017e893          	ori	a7,a5,1
   129c0:	00f70833          	add	a6,a4,a5
   129c4:	16a68463          	beq	a3,a0,12b2c <_free_r+0x274>
   129c8:	00c62603          	lw	a2,12(a2)
   129cc:	00c6a623          	sw	a2,12(a3)
   129d0:	00d62423          	sw	a3,8(a2)
   129d4:	01172223          	sw	a7,4(a4)
   129d8:	00f82023          	sw	a5,0(a6)
   129dc:	f6dff06f          	j	12948 <_free_r+0x90>
   129e0:	00008067          	ret
   129e4:	0017e693          	ori	a3,a5,1
   129e8:	fed42e23          	sw	a3,-4(s0)
   129ec:	00f62023          	sw	a5,0(a2)
   129f0:	1ff00693          	li	a3,511
   129f4:	f4f6fee3          	bgeu	a3,a5,12950 <_free_r+0x98>
   129f8:	0097d693          	srli	a3,a5,0x9
   129fc:	00400613          	li	a2,4
   12a00:	0ed66863          	bltu	a2,a3,12af0 <_free_r+0x238>
   12a04:	0067d693          	srli	a3,a5,0x6
   12a08:	03968813          	addi	a6,a3,57
   12a0c:	03868613          	addi	a2,a3,56
   12a10:	00381813          	slli	a6,a6,0x3
   12a14:	01058833          	add	a6,a1,a6
   12a18:	00082683          	lw	a3,0(a6)
   12a1c:	ff880813          	addi	a6,a6,-8
   12a20:	12d80463          	beq	a6,a3,12b48 <_free_r+0x290>
   12a24:	0046a603          	lw	a2,4(a3)
   12a28:	ffc67613          	andi	a2,a2,-4
   12a2c:	00c7f663          	bgeu	a5,a2,12a38 <_free_r+0x180>
   12a30:	0086a683          	lw	a3,8(a3)
   12a34:	fed818e3          	bne	a6,a3,12a24 <_free_r+0x16c>
   12a38:	00c6a803          	lw	a6,12(a3)
   12a3c:	01072623          	sw	a6,12(a4)
   12a40:	00d72423          	sw	a3,8(a4)
   12a44:	00812403          	lw	s0,8(sp)
   12a48:	00c12083          	lw	ra,12(sp)
   12a4c:	00e82423          	sw	a4,8(a6)
   12a50:	00048513          	mv	a0,s1
   12a54:	00412483          	lw	s1,4(sp)
   12a58:	00e6a623          	sw	a4,12(a3)
   12a5c:	01010113          	addi	sp,sp,16
   12a60:	fcdfe06f          	j	11a2c <__malloc_unlock>
   12a64:	14081263          	bnez	a6,12ba8 <_free_r+0x2f0>
   12a68:	00c62583          	lw	a1,12(a2)
   12a6c:	00862603          	lw	a2,8(a2)
   12a70:	00f687b3          	add	a5,a3,a5
   12a74:	00812403          	lw	s0,8(sp)
   12a78:	00b62623          	sw	a1,12(a2)
   12a7c:	00c5a423          	sw	a2,8(a1)
   12a80:	0017e693          	ori	a3,a5,1
   12a84:	00c12083          	lw	ra,12(sp)
   12a88:	00d72223          	sw	a3,4(a4)
   12a8c:	00048513          	mv	a0,s1
   12a90:	00f70733          	add	a4,a4,a5
   12a94:	00412483          	lw	s1,4(sp)
   12a98:	00f72023          	sw	a5,0(a4)
   12a9c:	01010113          	addi	sp,sp,16
   12aa0:	f8dfe06f          	j	11a2c <__malloc_unlock>
   12aa4:	00187813          	andi	a6,a6,1
   12aa8:	00d787b3          	add	a5,a5,a3
   12aac:	02081063          	bnez	a6,12acc <_free_r+0x214>
   12ab0:	ff842503          	lw	a0,-8(s0)
   12ab4:	40a70733          	sub	a4,a4,a0
   12ab8:	00c72683          	lw	a3,12(a4)
   12abc:	00872603          	lw	a2,8(a4)
   12ac0:	00a787b3          	add	a5,a5,a0
   12ac4:	00d62623          	sw	a3,12(a2)
   12ac8:	00c6a423          	sw	a2,8(a3)
   12acc:	0017e613          	ori	a2,a5,1
   12ad0:	0401a683          	lw	a3,64(gp) # 14dd8 <__malloc_trim_threshold>
   12ad4:	00c72223          	sw	a2,4(a4)
   12ad8:	00e5a423          	sw	a4,8(a1)
   12adc:	ead7e8e3          	bltu	a5,a3,1298c <_free_r+0xd4>
   12ae0:	04c1a583          	lw	a1,76(gp) # 14de4 <__malloc_top_pad>
   12ae4:	00048513          	mv	a0,s1
   12ae8:	ca1ff0ef          	jal	ra,12788 <_malloc_trim_r>
   12aec:	ea1ff06f          	j	1298c <_free_r+0xd4>
   12af0:	01400613          	li	a2,20
   12af4:	02d67463          	bgeu	a2,a3,12b1c <_free_r+0x264>
   12af8:	05400613          	li	a2,84
   12afc:	06d66463          	bltu	a2,a3,12b64 <_free_r+0x2ac>
   12b00:	00c7d693          	srli	a3,a5,0xc
   12b04:	06f68813          	addi	a6,a3,111
   12b08:	06e68613          	addi	a2,a3,110
   12b0c:	00381813          	slli	a6,a6,0x3
   12b10:	f05ff06f          	j	12a14 <_free_r+0x15c>
   12b14:	00d787b3          	add	a5,a5,a3
   12b18:	ea1ff06f          	j	129b8 <_free_r+0x100>
   12b1c:	05c68813          	addi	a6,a3,92
   12b20:	05b68613          	addi	a2,a3,91
   12b24:	00381813          	slli	a6,a6,0x3
   12b28:	eedff06f          	j	12a14 <_free_r+0x15c>
   12b2c:	00e5aa23          	sw	a4,20(a1)
   12b30:	00e5a823          	sw	a4,16(a1)
   12b34:	00a72623          	sw	a0,12(a4)
   12b38:	00a72423          	sw	a0,8(a4)
   12b3c:	01172223          	sw	a7,4(a4)
   12b40:	00f82023          	sw	a5,0(a6)
   12b44:	e49ff06f          	j	1298c <_free_r+0xd4>
   12b48:	0045a503          	lw	a0,4(a1)
   12b4c:	40265613          	srai	a2,a2,0x2
   12b50:	00100793          	li	a5,1
   12b54:	00c79633          	sll	a2,a5,a2
   12b58:	00a66633          	or	a2,a2,a0
   12b5c:	00c5a223          	sw	a2,4(a1)
   12b60:	eddff06f          	j	12a3c <_free_r+0x184>
   12b64:	15400613          	li	a2,340
   12b68:	00d66c63          	bltu	a2,a3,12b80 <_free_r+0x2c8>
   12b6c:	00f7d693          	srli	a3,a5,0xf
   12b70:	07868813          	addi	a6,a3,120
   12b74:	07768613          	addi	a2,a3,119
   12b78:	00381813          	slli	a6,a6,0x3
   12b7c:	e99ff06f          	j	12a14 <_free_r+0x15c>
   12b80:	55400613          	li	a2,1364
   12b84:	00d66c63          	bltu	a2,a3,12b9c <_free_r+0x2e4>
   12b88:	0127d693          	srli	a3,a5,0x12
   12b8c:	07d68813          	addi	a6,a3,125
   12b90:	07c68613          	addi	a2,a3,124
   12b94:	00381813          	slli	a6,a6,0x3
   12b98:	e7dff06f          	j	12a14 <_free_r+0x15c>
   12b9c:	3f800813          	li	a6,1016
   12ba0:	07e00613          	li	a2,126
   12ba4:	e71ff06f          	j	12a14 <_free_r+0x15c>
   12ba8:	0017e693          	ori	a3,a5,1
   12bac:	00d72223          	sw	a3,4(a4)
   12bb0:	00f62023          	sw	a5,0(a2)
   12bb4:	dd9ff06f          	j	1298c <_free_r+0xd4>

00012bb8 <_lseek_r>:
   12bb8:	ff010113          	addi	sp,sp,-16
   12bbc:	00058713          	mv	a4,a1
   12bc0:	00812423          	sw	s0,8(sp)
   12bc4:	00912223          	sw	s1,4(sp)
   12bc8:	00060593          	mv	a1,a2
   12bcc:	00050413          	mv	s0,a0
   12bd0:	00068613          	mv	a2,a3
   12bd4:	00070513          	mv	a0,a4
   12bd8:	00112623          	sw	ra,12(sp)
   12bdc:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   12be0:	684000ef          	jal	ra,13264 <_lseek>
   12be4:	fff00793          	li	a5,-1
   12be8:	00f50c63          	beq	a0,a5,12c00 <_lseek_r+0x48>
   12bec:	00c12083          	lw	ra,12(sp)
   12bf0:	00812403          	lw	s0,8(sp)
   12bf4:	00412483          	lw	s1,4(sp)
   12bf8:	01010113          	addi	sp,sp,16
   12bfc:	00008067          	ret
   12c00:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   12c04:	fe0784e3          	beqz	a5,12bec <_lseek_r+0x34>
   12c08:	00c12083          	lw	ra,12(sp)
   12c0c:	00f42023          	sw	a5,0(s0)
   12c10:	00812403          	lw	s0,8(sp)
   12c14:	00412483          	lw	s1,4(sp)
   12c18:	01010113          	addi	sp,sp,16
   12c1c:	00008067          	ret

00012c20 <__swhatbuf_r>:
   12c20:	f9010113          	addi	sp,sp,-112
   12c24:	06812423          	sw	s0,104(sp)
   12c28:	00058413          	mv	s0,a1
   12c2c:	00e59583          	lh	a1,14(a1)
   12c30:	06912223          	sw	s1,100(sp)
   12c34:	07212023          	sw	s2,96(sp)
   12c38:	06112623          	sw	ra,108(sp)
   12c3c:	00060493          	mv	s1,a2
   12c40:	00068913          	mv	s2,a3
   12c44:	0405ca63          	bltz	a1,12c98 <__swhatbuf_r+0x78>
   12c48:	00810613          	addi	a2,sp,8
   12c4c:	40c000ef          	jal	ra,13058 <_fstat_r>
   12c50:	04054463          	bltz	a0,12c98 <__swhatbuf_r+0x78>
   12c54:	00c12703          	lw	a4,12(sp)
   12c58:	0000f7b7          	lui	a5,0xf
   12c5c:	06c12083          	lw	ra,108(sp)
   12c60:	00e7f7b3          	and	a5,a5,a4
   12c64:	ffffe737          	lui	a4,0xffffe
   12c68:	00e787b3          	add	a5,a5,a4
   12c6c:	06812403          	lw	s0,104(sp)
   12c70:	0017b793          	seqz	a5,a5
   12c74:	00f92023          	sw	a5,0(s2)
   12c78:	40000793          	li	a5,1024
   12c7c:	00f4a023          	sw	a5,0(s1)
   12c80:	00001537          	lui	a0,0x1
   12c84:	06412483          	lw	s1,100(sp)
   12c88:	06012903          	lw	s2,96(sp)
   12c8c:	80050513          	addi	a0,a0,-2048 # 800 <register_fini-0xf874>
   12c90:	07010113          	addi	sp,sp,112
   12c94:	00008067          	ret
   12c98:	00c45783          	lhu	a5,12(s0)
   12c9c:	00092023          	sw	zero,0(s2)
   12ca0:	0807f793          	andi	a5,a5,128
   12ca4:	02078463          	beqz	a5,12ccc <__swhatbuf_r+0xac>
   12ca8:	06c12083          	lw	ra,108(sp)
   12cac:	06812403          	lw	s0,104(sp)
   12cb0:	04000793          	li	a5,64
   12cb4:	00f4a023          	sw	a5,0(s1)
   12cb8:	06012903          	lw	s2,96(sp)
   12cbc:	06412483          	lw	s1,100(sp)
   12cc0:	00000513          	li	a0,0
   12cc4:	07010113          	addi	sp,sp,112
   12cc8:	00008067          	ret
   12ccc:	06c12083          	lw	ra,108(sp)
   12cd0:	06812403          	lw	s0,104(sp)
   12cd4:	40000793          	li	a5,1024
   12cd8:	00f4a023          	sw	a5,0(s1)
   12cdc:	06012903          	lw	s2,96(sp)
   12ce0:	06412483          	lw	s1,100(sp)
   12ce4:	00000513          	li	a0,0
   12ce8:	07010113          	addi	sp,sp,112
   12cec:	00008067          	ret

00012cf0 <__smakebuf_r>:
   12cf0:	00c5d783          	lhu	a5,12(a1)
   12cf4:	fe010113          	addi	sp,sp,-32
   12cf8:	00812c23          	sw	s0,24(sp)
   12cfc:	00112e23          	sw	ra,28(sp)
   12d00:	00912a23          	sw	s1,20(sp)
   12d04:	01212823          	sw	s2,16(sp)
   12d08:	0027f793          	andi	a5,a5,2
   12d0c:	00058413          	mv	s0,a1
   12d10:	02078863          	beqz	a5,12d40 <__smakebuf_r+0x50>
   12d14:	04358793          	addi	a5,a1,67
   12d18:	00f5a023          	sw	a5,0(a1)
   12d1c:	00f5a823          	sw	a5,16(a1)
   12d20:	00100793          	li	a5,1
   12d24:	00f5aa23          	sw	a5,20(a1)
   12d28:	01c12083          	lw	ra,28(sp)
   12d2c:	01812403          	lw	s0,24(sp)
   12d30:	01412483          	lw	s1,20(sp)
   12d34:	01012903          	lw	s2,16(sp)
   12d38:	02010113          	addi	sp,sp,32
   12d3c:	00008067          	ret
   12d40:	00c10693          	addi	a3,sp,12
   12d44:	00810613          	addi	a2,sp,8
   12d48:	00050493          	mv	s1,a0
   12d4c:	ed5ff0ef          	jal	ra,12c20 <__swhatbuf_r>
   12d50:	00812583          	lw	a1,8(sp)
   12d54:	00050913          	mv	s2,a0
   12d58:	00048513          	mv	a0,s1
   12d5c:	a24fe0ef          	jal	ra,10f80 <_malloc_r>
   12d60:	00c41783          	lh	a5,12(s0)
   12d64:	04050863          	beqz	a0,12db4 <__smakebuf_r+0xc4>
   12d68:	00010737          	lui	a4,0x10
   12d6c:	5b870713          	addi	a4,a4,1464 # 105b8 <_cleanup_r>
   12d70:	02e4ae23          	sw	a4,60(s1)
   12d74:	00812703          	lw	a4,8(sp)
   12d78:	00c12683          	lw	a3,12(sp)
   12d7c:	0807e793          	ori	a5,a5,128
   12d80:	00f41623          	sh	a5,12(s0)
   12d84:	00a42023          	sw	a0,0(s0)
   12d88:	00a42823          	sw	a0,16(s0)
   12d8c:	00e42a23          	sw	a4,20(s0)
   12d90:	04069863          	bnez	a3,12de0 <__smakebuf_r+0xf0>
   12d94:	0127e7b3          	or	a5,a5,s2
   12d98:	01c12083          	lw	ra,28(sp)
   12d9c:	00f41623          	sh	a5,12(s0)
   12da0:	01812403          	lw	s0,24(sp)
   12da4:	01412483          	lw	s1,20(sp)
   12da8:	01012903          	lw	s2,16(sp)
   12dac:	02010113          	addi	sp,sp,32
   12db0:	00008067          	ret
   12db4:	2007f713          	andi	a4,a5,512
   12db8:	f60718e3          	bnez	a4,12d28 <__smakebuf_r+0x38>
   12dbc:	ffc7f793          	andi	a5,a5,-4
   12dc0:	0027e793          	ori	a5,a5,2
   12dc4:	04340713          	addi	a4,s0,67
   12dc8:	00f41623          	sh	a5,12(s0)
   12dcc:	00100793          	li	a5,1
   12dd0:	00e42023          	sw	a4,0(s0)
   12dd4:	00e42823          	sw	a4,16(s0)
   12dd8:	00f42a23          	sw	a5,20(s0)
   12ddc:	f4dff06f          	j	12d28 <__smakebuf_r+0x38>
   12de0:	00e41583          	lh	a1,14(s0)
   12de4:	00048513          	mv	a0,s1
   12de8:	2d4000ef          	jal	ra,130bc <_isatty_r>
   12dec:	00051663          	bnez	a0,12df8 <__smakebuf_r+0x108>
   12df0:	00c41783          	lh	a5,12(s0)
   12df4:	fa1ff06f          	j	12d94 <__smakebuf_r+0xa4>
   12df8:	00c45703          	lhu	a4,12(s0)
   12dfc:	ffc77713          	andi	a4,a4,-4
   12e00:	00176713          	ori	a4,a4,1
   12e04:	01071793          	slli	a5,a4,0x10
   12e08:	4107d793          	srai	a5,a5,0x10
   12e0c:	f89ff06f          	j	12d94 <__smakebuf_r+0xa4>

00012e10 <_read_r>:
   12e10:	ff010113          	addi	sp,sp,-16
   12e14:	00058713          	mv	a4,a1
   12e18:	00812423          	sw	s0,8(sp)
   12e1c:	00912223          	sw	s1,4(sp)
   12e20:	00060593          	mv	a1,a2
   12e24:	00050413          	mv	s0,a0
   12e28:	00068613          	mv	a2,a3
   12e2c:	00070513          	mv	a0,a4
   12e30:	00112623          	sw	ra,12(sp)
   12e34:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   12e38:	47c000ef          	jal	ra,132b4 <_read>
   12e3c:	fff00793          	li	a5,-1
   12e40:	00f50c63          	beq	a0,a5,12e58 <_read_r+0x48>
   12e44:	00c12083          	lw	ra,12(sp)
   12e48:	00812403          	lw	s0,8(sp)
   12e4c:	00412483          	lw	s1,4(sp)
   12e50:	01010113          	addi	sp,sp,16
   12e54:	00008067          	ret
   12e58:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   12e5c:	fe0784e3          	beqz	a5,12e44 <_read_r+0x34>
   12e60:	00c12083          	lw	ra,12(sp)
   12e64:	00f42023          	sw	a5,0(s0)
   12e68:	00812403          	lw	s0,8(sp)
   12e6c:	00412483          	lw	s1,4(sp)
   12e70:	01010113          	addi	sp,sp,16
   12e74:	00008067          	ret

00012e78 <cleanup_glue>:
   12e78:	ff010113          	addi	sp,sp,-16
   12e7c:	00812423          	sw	s0,8(sp)
   12e80:	00058413          	mv	s0,a1
   12e84:	0005a583          	lw	a1,0(a1)
   12e88:	00912223          	sw	s1,4(sp)
   12e8c:	00112623          	sw	ra,12(sp)
   12e90:	00050493          	mv	s1,a0
   12e94:	00058463          	beqz	a1,12e9c <cleanup_glue+0x24>
   12e98:	fe1ff0ef          	jal	ra,12e78 <cleanup_glue>
   12e9c:	00040593          	mv	a1,s0
   12ea0:	00812403          	lw	s0,8(sp)
   12ea4:	00c12083          	lw	ra,12(sp)
   12ea8:	00048513          	mv	a0,s1
   12eac:	00412483          	lw	s1,4(sp)
   12eb0:	01010113          	addi	sp,sp,16
   12eb4:	a05ff06f          	j	128b8 <_free_r>

00012eb8 <_reclaim_reent>:
   12eb8:	0381a783          	lw	a5,56(gp) # 14dd0 <_impure_ptr>
   12ebc:	10a78063          	beq	a5,a0,12fbc <_reclaim_reent+0x104>
   12ec0:	04c52583          	lw	a1,76(a0)
   12ec4:	fe010113          	addi	sp,sp,-32
   12ec8:	00912a23          	sw	s1,20(sp)
   12ecc:	00112e23          	sw	ra,28(sp)
   12ed0:	00812c23          	sw	s0,24(sp)
   12ed4:	01212823          	sw	s2,16(sp)
   12ed8:	01312623          	sw	s3,12(sp)
   12edc:	00050493          	mv	s1,a0
   12ee0:	04058063          	beqz	a1,12f20 <_reclaim_reent+0x68>
   12ee4:	00000913          	li	s2,0
   12ee8:	08000993          	li	s3,128
   12eec:	012587b3          	add	a5,a1,s2
   12ef0:	0007a403          	lw	s0,0(a5) # f000 <register_fini-0x1074>
   12ef4:	00040e63          	beqz	s0,12f10 <_reclaim_reent+0x58>
   12ef8:	00040593          	mv	a1,s0
   12efc:	00042403          	lw	s0,0(s0)
   12f00:	00048513          	mv	a0,s1
   12f04:	9b5ff0ef          	jal	ra,128b8 <_free_r>
   12f08:	fe0418e3          	bnez	s0,12ef8 <_reclaim_reent+0x40>
   12f0c:	04c4a583          	lw	a1,76(s1)
   12f10:	00490913          	addi	s2,s2,4
   12f14:	fd391ce3          	bne	s2,s3,12eec <_reclaim_reent+0x34>
   12f18:	00048513          	mv	a0,s1
   12f1c:	99dff0ef          	jal	ra,128b8 <_free_r>
   12f20:	0404a583          	lw	a1,64(s1)
   12f24:	00058663          	beqz	a1,12f30 <_reclaim_reent+0x78>
   12f28:	00048513          	mv	a0,s1
   12f2c:	98dff0ef          	jal	ra,128b8 <_free_r>
   12f30:	1484a403          	lw	s0,328(s1)
   12f34:	02040063          	beqz	s0,12f54 <_reclaim_reent+0x9c>
   12f38:	14c48913          	addi	s2,s1,332
   12f3c:	01240c63          	beq	s0,s2,12f54 <_reclaim_reent+0x9c>
   12f40:	00040593          	mv	a1,s0
   12f44:	00042403          	lw	s0,0(s0)
   12f48:	00048513          	mv	a0,s1
   12f4c:	96dff0ef          	jal	ra,128b8 <_free_r>
   12f50:	fe8918e3          	bne	s2,s0,12f40 <_reclaim_reent+0x88>
   12f54:	0544a583          	lw	a1,84(s1)
   12f58:	00058663          	beqz	a1,12f64 <_reclaim_reent+0xac>
   12f5c:	00048513          	mv	a0,s1
   12f60:	959ff0ef          	jal	ra,128b8 <_free_r>
   12f64:	0384a783          	lw	a5,56(s1)
   12f68:	02078c63          	beqz	a5,12fa0 <_reclaim_reent+0xe8>
   12f6c:	03c4a783          	lw	a5,60(s1)
   12f70:	00048513          	mv	a0,s1
   12f74:	000780e7          	jalr	a5
   12f78:	2e04a583          	lw	a1,736(s1)
   12f7c:	02058263          	beqz	a1,12fa0 <_reclaim_reent+0xe8>
   12f80:	01812403          	lw	s0,24(sp)
   12f84:	01c12083          	lw	ra,28(sp)
   12f88:	01012903          	lw	s2,16(sp)
   12f8c:	00c12983          	lw	s3,12(sp)
   12f90:	00048513          	mv	a0,s1
   12f94:	01412483          	lw	s1,20(sp)
   12f98:	02010113          	addi	sp,sp,32
   12f9c:	eddff06f          	j	12e78 <cleanup_glue>
   12fa0:	01c12083          	lw	ra,28(sp)
   12fa4:	01812403          	lw	s0,24(sp)
   12fa8:	01412483          	lw	s1,20(sp)
   12fac:	01012903          	lw	s2,16(sp)
   12fb0:	00c12983          	lw	s3,12(sp)
   12fb4:	02010113          	addi	sp,sp,32
   12fb8:	00008067          	ret
   12fbc:	00008067          	ret

00012fc0 <__register_exitproc>:
   12fc0:	0301a703          	lw	a4,48(gp) # 14dc8 <_global_impure_ptr>
   12fc4:	14872783          	lw	a5,328(a4)
   12fc8:	04078c63          	beqz	a5,13020 <__register_exitproc+0x60>
   12fcc:	0047a703          	lw	a4,4(a5)
   12fd0:	01f00813          	li	a6,31
   12fd4:	06e84e63          	blt	a6,a4,13050 <__register_exitproc+0x90>
   12fd8:	00271813          	slli	a6,a4,0x2
   12fdc:	02050663          	beqz	a0,13008 <__register_exitproc+0x48>
   12fe0:	01078333          	add	t1,a5,a6
   12fe4:	08c32423          	sw	a2,136(t1)
   12fe8:	1887a883          	lw	a7,392(a5)
   12fec:	00100613          	li	a2,1
   12ff0:	00e61633          	sll	a2,a2,a4
   12ff4:	00c8e8b3          	or	a7,a7,a2
   12ff8:	1917a423          	sw	a7,392(a5)
   12ffc:	10d32423          	sw	a3,264(t1)
   13000:	00200693          	li	a3,2
   13004:	02d50463          	beq	a0,a3,1302c <__register_exitproc+0x6c>
   13008:	00170713          	addi	a4,a4,1
   1300c:	00e7a223          	sw	a4,4(a5)
   13010:	010787b3          	add	a5,a5,a6
   13014:	00b7a423          	sw	a1,8(a5)
   13018:	00000513          	li	a0,0
   1301c:	00008067          	ret
   13020:	14c70793          	addi	a5,a4,332
   13024:	14f72423          	sw	a5,328(a4)
   13028:	fa5ff06f          	j	12fcc <__register_exitproc+0xc>
   1302c:	18c7a683          	lw	a3,396(a5)
   13030:	00170713          	addi	a4,a4,1
   13034:	00e7a223          	sw	a4,4(a5)
   13038:	00c6e633          	or	a2,a3,a2
   1303c:	18c7a623          	sw	a2,396(a5)
   13040:	010787b3          	add	a5,a5,a6
   13044:	00b7a423          	sw	a1,8(a5)
   13048:	00000513          	li	a0,0
   1304c:	00008067          	ret
   13050:	fff00513          	li	a0,-1
   13054:	00008067          	ret

00013058 <_fstat_r>:
   13058:	ff010113          	addi	sp,sp,-16
   1305c:	00058713          	mv	a4,a1
   13060:	00812423          	sw	s0,8(sp)
   13064:	00912223          	sw	s1,4(sp)
   13068:	00050413          	mv	s0,a0
   1306c:	00060593          	mv	a1,a2
   13070:	00070513          	mv	a0,a4
   13074:	00112623          	sw	ra,12(sp)
   13078:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   1307c:	138000ef          	jal	ra,131b4 <_fstat>
   13080:	fff00793          	li	a5,-1
   13084:	00f50c63          	beq	a0,a5,1309c <_fstat_r+0x44>
   13088:	00c12083          	lw	ra,12(sp)
   1308c:	00812403          	lw	s0,8(sp)
   13090:	00412483          	lw	s1,4(sp)
   13094:	01010113          	addi	sp,sp,16
   13098:	00008067          	ret
   1309c:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   130a0:	fe0784e3          	beqz	a5,13088 <_fstat_r+0x30>
   130a4:	00c12083          	lw	ra,12(sp)
   130a8:	00f42023          	sw	a5,0(s0)
   130ac:	00812403          	lw	s0,8(sp)
   130b0:	00412483          	lw	s1,4(sp)
   130b4:	01010113          	addi	sp,sp,16
   130b8:	00008067          	ret

000130bc <_isatty_r>:
   130bc:	ff010113          	addi	sp,sp,-16
   130c0:	00812423          	sw	s0,8(sp)
   130c4:	00912223          	sw	s1,4(sp)
   130c8:	00050413          	mv	s0,a0
   130cc:	00058513          	mv	a0,a1
   130d0:	00112623          	sw	ra,12(sp)
   130d4:	0801ac23          	sw	zero,152(gp) # 14e30 <errno>
   130d8:	14c000ef          	jal	ra,13224 <_isatty>
   130dc:	fff00793          	li	a5,-1
   130e0:	00f50c63          	beq	a0,a5,130f8 <_isatty_r+0x3c>
   130e4:	00c12083          	lw	ra,12(sp)
   130e8:	00812403          	lw	s0,8(sp)
   130ec:	00412483          	lw	s1,4(sp)
   130f0:	01010113          	addi	sp,sp,16
   130f4:	00008067          	ret
   130f8:	0981a783          	lw	a5,152(gp) # 14e30 <errno>
   130fc:	fe0784e3          	beqz	a5,130e4 <_isatty_r+0x28>
   13100:	00c12083          	lw	ra,12(sp)
   13104:	00f42023          	sw	a5,0(s0)
   13108:	00812403          	lw	s0,8(sp)
   1310c:	00412483          	lw	s1,4(sp)
   13110:	01010113          	addi	sp,sp,16
   13114:	00008067          	ret

00013118 <_close>:
   13118:	ff010113          	addi	sp,sp,-16
   1311c:	00112623          	sw	ra,12(sp)
   13120:	00812423          	sw	s0,8(sp)
   13124:	00000593          	li	a1,0
   13128:	00000613          	li	a2,0
   1312c:	00000693          	li	a3,0
   13130:	00000713          	li	a4,0
   13134:	00000793          	li	a5,0
   13138:	03900893          	li	a7,57
   1313c:	00000073          	ecall
   13140:	00050413          	mv	s0,a0
   13144:	00054c63          	bltz	a0,1315c <_close+0x44>
   13148:	00c12083          	lw	ra,12(sp)
   1314c:	00040513          	mv	a0,s0
   13150:	00812403          	lw	s0,8(sp)
   13154:	01010113          	addi	sp,sp,16
   13158:	00008067          	ret
   1315c:	40800433          	neg	s0,s0
   13160:	334000ef          	jal	ra,13494 <__errno>
   13164:	00852023          	sw	s0,0(a0)
   13168:	fff00413          	li	s0,-1
   1316c:	fddff06f          	j	13148 <_close+0x30>

00013170 <_exit>:
   13170:	00000593          	li	a1,0
   13174:	00000613          	li	a2,0
   13178:	00000693          	li	a3,0
   1317c:	00000713          	li	a4,0
   13180:	00000793          	li	a5,0
   13184:	05d00893          	li	a7,93
   13188:	00000073          	ecall
   1318c:	00054463          	bltz	a0,13194 <_exit+0x24>
   13190:	0000006f          	j	13190 <_exit+0x20>
   13194:	ff010113          	addi	sp,sp,-16
   13198:	00812423          	sw	s0,8(sp)
   1319c:	00050413          	mv	s0,a0
   131a0:	00112623          	sw	ra,12(sp)
   131a4:	40800433          	neg	s0,s0
   131a8:	2ec000ef          	jal	ra,13494 <__errno>
   131ac:	00852023          	sw	s0,0(a0)
   131b0:	0000006f          	j	131b0 <_exit+0x40>

000131b4 <_fstat>:
   131b4:	f7010113          	addi	sp,sp,-144
   131b8:	08912223          	sw	s1,132(sp)
   131bc:	08112623          	sw	ra,140(sp)
   131c0:	00058493          	mv	s1,a1
   131c4:	08812423          	sw	s0,136(sp)
   131c8:	00010593          	mv	a1,sp
   131cc:	00000613          	li	a2,0
   131d0:	00000693          	li	a3,0
   131d4:	00000713          	li	a4,0
   131d8:	00000793          	li	a5,0
   131dc:	05000893          	li	a7,80
   131e0:	00000073          	ecall
   131e4:	00050413          	mv	s0,a0
   131e8:	02054463          	bltz	a0,13210 <_fstat+0x5c>
   131ec:	00048513          	mv	a0,s1
   131f0:	00010593          	mv	a1,sp
   131f4:	1fc000ef          	jal	ra,133f0 <_conv_stat>
   131f8:	08c12083          	lw	ra,140(sp)
   131fc:	00040513          	mv	a0,s0
   13200:	08812403          	lw	s0,136(sp)
   13204:	08412483          	lw	s1,132(sp)
   13208:	09010113          	addi	sp,sp,144
   1320c:	00008067          	ret
   13210:	40800433          	neg	s0,s0
   13214:	280000ef          	jal	ra,13494 <__errno>
   13218:	00852023          	sw	s0,0(a0)
   1321c:	fff00413          	li	s0,-1
   13220:	fcdff06f          	j	131ec <_fstat+0x38>

00013224 <_isatty>:
   13224:	f9010113          	addi	sp,sp,-112
   13228:	00810593          	addi	a1,sp,8
   1322c:	06112623          	sw	ra,108(sp)
   13230:	f85ff0ef          	jal	ra,131b4 <_fstat>
   13234:	fff00793          	li	a5,-1
   13238:	00f50e63          	beq	a0,a5,13254 <_isatty+0x30>
   1323c:	00c12503          	lw	a0,12(sp)
   13240:	06c12083          	lw	ra,108(sp)
   13244:	00d55513          	srli	a0,a0,0xd
   13248:	00157513          	andi	a0,a0,1
   1324c:	07010113          	addi	sp,sp,112
   13250:	00008067          	ret
   13254:	06c12083          	lw	ra,108(sp)
   13258:	00000513          	li	a0,0
   1325c:	07010113          	addi	sp,sp,112
   13260:	00008067          	ret

00013264 <_lseek>:
   13264:	ff010113          	addi	sp,sp,-16
   13268:	00112623          	sw	ra,12(sp)
   1326c:	00812423          	sw	s0,8(sp)
   13270:	00000693          	li	a3,0
   13274:	00000713          	li	a4,0
   13278:	00000793          	li	a5,0
   1327c:	03e00893          	li	a7,62
   13280:	00000073          	ecall
   13284:	00050413          	mv	s0,a0
   13288:	00054c63          	bltz	a0,132a0 <_lseek+0x3c>
   1328c:	00c12083          	lw	ra,12(sp)
   13290:	00040513          	mv	a0,s0
   13294:	00812403          	lw	s0,8(sp)
   13298:	01010113          	addi	sp,sp,16
   1329c:	00008067          	ret
   132a0:	40800433          	neg	s0,s0
   132a4:	1f0000ef          	jal	ra,13494 <__errno>
   132a8:	00852023          	sw	s0,0(a0)
   132ac:	fff00413          	li	s0,-1
   132b0:	fddff06f          	j	1328c <_lseek+0x28>

000132b4 <_read>:
   132b4:	ff010113          	addi	sp,sp,-16
   132b8:	00112623          	sw	ra,12(sp)
   132bc:	00812423          	sw	s0,8(sp)
   132c0:	00000693          	li	a3,0
   132c4:	00000713          	li	a4,0
   132c8:	00000793          	li	a5,0
   132cc:	03f00893          	li	a7,63
   132d0:	00000073          	ecall
   132d4:	00050413          	mv	s0,a0
   132d8:	00054c63          	bltz	a0,132f0 <_read+0x3c>
   132dc:	00c12083          	lw	ra,12(sp)
   132e0:	00040513          	mv	a0,s0
   132e4:	00812403          	lw	s0,8(sp)
   132e8:	01010113          	addi	sp,sp,16
   132ec:	00008067          	ret
   132f0:	40800433          	neg	s0,s0
   132f4:	1a0000ef          	jal	ra,13494 <__errno>
   132f8:	00852023          	sw	s0,0(a0)
   132fc:	fff00413          	li	s0,-1
   13300:	fddff06f          	j	132dc <_read+0x28>

00013304 <_sbrk>:
   13304:	0501a783          	lw	a5,80(gp) # 14de8 <heap_end.1813>
   13308:	ff010113          	addi	sp,sp,-16
   1330c:	00112623          	sw	ra,12(sp)
   13310:	00050813          	mv	a6,a0
   13314:	02079863          	bnez	a5,13344 <_sbrk+0x40>
   13318:	00000513          	li	a0,0
   1331c:	00000593          	li	a1,0
   13320:	00000613          	li	a2,0
   13324:	00000693          	li	a3,0
   13328:	00000713          	li	a4,0
   1332c:	0d600893          	li	a7,214
   13330:	00000073          	ecall
   13334:	fff00713          	li	a4,-1
   13338:	00050793          	mv	a5,a0
   1333c:	04e50463          	beq	a0,a4,13384 <_sbrk+0x80>
   13340:	04a1a823          	sw	a0,80(gp) # 14de8 <heap_end.1813>
   13344:	00f80533          	add	a0,a6,a5
   13348:	00000593          	li	a1,0
   1334c:	00000613          	li	a2,0
   13350:	00000693          	li	a3,0
   13354:	00000713          	li	a4,0
   13358:	00000793          	li	a5,0
   1335c:	0d600893          	li	a7,214
   13360:	00000073          	ecall
   13364:	0501a783          	lw	a5,80(gp) # 14de8 <heap_end.1813>
   13368:	00f80833          	add	a6,a6,a5
   1336c:	01051c63          	bne	a0,a6,13384 <_sbrk+0x80>
   13370:	00c12083          	lw	ra,12(sp)
   13374:	04a1a823          	sw	a0,80(gp) # 14de8 <heap_end.1813>
   13378:	00078513          	mv	a0,a5
   1337c:	01010113          	addi	sp,sp,16
   13380:	00008067          	ret
   13384:	110000ef          	jal	ra,13494 <__errno>
   13388:	00c12083          	lw	ra,12(sp)
   1338c:	00c00793          	li	a5,12
   13390:	00f52023          	sw	a5,0(a0)
   13394:	fff00513          	li	a0,-1
   13398:	01010113          	addi	sp,sp,16
   1339c:	00008067          	ret

000133a0 <_write>:
   133a0:	ff010113          	addi	sp,sp,-16
   133a4:	00112623          	sw	ra,12(sp)
   133a8:	00812423          	sw	s0,8(sp)
   133ac:	00000693          	li	a3,0
   133b0:	00000713          	li	a4,0
   133b4:	00000793          	li	a5,0
   133b8:	04000893          	li	a7,64
   133bc:	00000073          	ecall
   133c0:	00050413          	mv	s0,a0
   133c4:	00054c63          	bltz	a0,133dc <_write+0x3c>
   133c8:	00c12083          	lw	ra,12(sp)
   133cc:	00040513          	mv	a0,s0
   133d0:	00812403          	lw	s0,8(sp)
   133d4:	01010113          	addi	sp,sp,16
   133d8:	00008067          	ret
   133dc:	40800433          	neg	s0,s0
   133e0:	0b4000ef          	jal	ra,13494 <__errno>
   133e4:	00852023          	sw	s0,0(a0)
   133e8:	fff00413          	li	s0,-1
   133ec:	fddff06f          	j	133c8 <_write+0x28>

000133f0 <_conv_stat>:
   133f0:	ff010113          	addi	sp,sp,-16
   133f4:	0145a383          	lw	t2,20(a1)
   133f8:	0185a283          	lw	t0,24(a1)
   133fc:	01c5af83          	lw	t6,28(a1)
   13400:	0205af03          	lw	t5,32(a1)
   13404:	0305ae83          	lw	t4,48(a1)
   13408:	0405ae03          	lw	t3,64(a1)
   1340c:	0385a303          	lw	t1,56(a1)
   13410:	0485a803          	lw	a6,72(a1)
   13414:	04c5a883          	lw	a7,76(a1)
   13418:	0585a603          	lw	a2,88(a1)
   1341c:	00812623          	sw	s0,12(sp)
   13420:	00912423          	sw	s1,8(sp)
   13424:	0105a403          	lw	s0,16(a1)
   13428:	0085a483          	lw	s1,8(a1)
   1342c:	01212223          	sw	s2,4(sp)
   13430:	0005a903          	lw	s2,0(a1)
   13434:	05c5a683          	lw	a3,92(a1)
   13438:	0685a703          	lw	a4,104(a1)
   1343c:	06c5a783          	lw	a5,108(a1)
   13440:	01251023          	sh	s2,0(a0)
   13444:	00951123          	sh	s1,2(a0)
   13448:	00852223          	sw	s0,4(a0)
   1344c:	00751423          	sh	t2,8(a0)
   13450:	00551523          	sh	t0,10(a0)
   13454:	01f51623          	sh	t6,12(a0)
   13458:	01e51723          	sh	t5,14(a0)
   1345c:	01d52823          	sw	t4,16(a0)
   13460:	05c52423          	sw	t3,72(a0)
   13464:	04652223          	sw	t1,68(a0)
   13468:	01052c23          	sw	a6,24(a0)
   1346c:	01152e23          	sw	a7,28(a0)
   13470:	02c52423          	sw	a2,40(a0)
   13474:	02d52623          	sw	a3,44(a0)
   13478:	00c12403          	lw	s0,12(sp)
   1347c:	02e52c23          	sw	a4,56(a0)
   13480:	02f52e23          	sw	a5,60(a0)
   13484:	00812483          	lw	s1,8(sp)
   13488:	00412903          	lw	s2,4(sp)
   1348c:	01010113          	addi	sp,sp,16
   13490:	00008067          	ret

00013494 <__errno>:
   13494:	0381a503          	lw	a0,56(gp) # 14dd0 <_impure_ptr>
   13498:	00008067          	ret

0001349c <__mulsi3>:
   1349c:	00050613          	mv	a2,a0
   134a0:	00000513          	li	a0,0
   134a4:	0015f693          	andi	a3,a1,1
   134a8:	00068463          	beqz	a3,134b0 <__mulsi3+0x14>
   134ac:	00c50533          	add	a0,a0,a2
   134b0:	0015d593          	srli	a1,a1,0x1
   134b4:	00161613          	slli	a2,a2,0x1
   134b8:	fe0596e3          	bnez	a1,134a4 <__mulsi3+0x8>
   134bc:	00008067          	ret

000134c0 <__divsi3>:
   134c0:	06054063          	bltz	a0,13520 <__umodsi3+0x10>
   134c4:	0605c663          	bltz	a1,13530 <__umodsi3+0x20>

000134c8 <__udivsi3>:
   134c8:	00058613          	mv	a2,a1
   134cc:	00050593          	mv	a1,a0
   134d0:	fff00513          	li	a0,-1
   134d4:	02060c63          	beqz	a2,1350c <__udivsi3+0x44>
   134d8:	00100693          	li	a3,1
   134dc:	00b67a63          	bgeu	a2,a1,134f0 <__udivsi3+0x28>
   134e0:	00c05863          	blez	a2,134f0 <__udivsi3+0x28>
   134e4:	00161613          	slli	a2,a2,0x1
   134e8:	00169693          	slli	a3,a3,0x1
   134ec:	feb66ae3          	bltu	a2,a1,134e0 <__udivsi3+0x18>
   134f0:	00000513          	li	a0,0
   134f4:	00c5e663          	bltu	a1,a2,13500 <__udivsi3+0x38>
   134f8:	40c585b3          	sub	a1,a1,a2
   134fc:	00d56533          	or	a0,a0,a3
   13500:	0016d693          	srli	a3,a3,0x1
   13504:	00165613          	srli	a2,a2,0x1
   13508:	fe0696e3          	bnez	a3,134f4 <__udivsi3+0x2c>
   1350c:	00008067          	ret

00013510 <__umodsi3>:
   13510:	00008293          	mv	t0,ra
   13514:	fb5ff0ef          	jal	ra,134c8 <__udivsi3>
   13518:	00058513          	mv	a0,a1
   1351c:	00028067          	jr	t0 # 10300 <memset+0xb4>
   13520:	40a00533          	neg	a0,a0
   13524:	0005d863          	bgez	a1,13534 <__umodsi3+0x24>
   13528:	40b005b3          	neg	a1,a1
   1352c:	f9dff06f          	j	134c8 <__udivsi3>
   13530:	40b005b3          	neg	a1,a1
   13534:	00008293          	mv	t0,ra
   13538:	f91ff0ef          	jal	ra,134c8 <__udivsi3>
   1353c:	40a00533          	neg	a0,a0
   13540:	00028067          	jr	t0

00013544 <__modsi3>:
   13544:	00008293          	mv	t0,ra
   13548:	0005ca63          	bltz	a1,1355c <__modsi3+0x18>
   1354c:	00054c63          	bltz	a0,13564 <__modsi3+0x20>
   13550:	f79ff0ef          	jal	ra,134c8 <__udivsi3>
   13554:	00058513          	mv	a0,a1
   13558:	00028067          	jr	t0
   1355c:	40b005b3          	neg	a1,a1
   13560:	fe0558e3          	bgez	a0,13550 <__modsi3+0xc>
   13564:	40a00533          	neg	a0,a0
   13568:	f61ff0ef          	jal	ra,134c8 <__udivsi3>
   1356c:	40b00533          	neg	a0,a1
   13570:	00028067          	jr	t0
