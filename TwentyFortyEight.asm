		.FILE "TwentyFortyEight.c"
		.LOC 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;printnum;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
printnum
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-13	;; allocate stack space for local variables
	;; function body
		.LOC 28
		.LOC 33
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRnp L2_TwentyFortyEight
		.LOC 33
		.LOC 34
	LEA R7, L4_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 35
	JMP L1_TwentyFortyEight
L2_TwentyFortyEight
		.LOC 38
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L6_TwentyFortyEight
	LDR R7, R5, #3
	NOT R7,R7
	ADD R7,R7,#1
	STR R7, R5, #-13
	JMP L7_TwentyFortyEight
L6_TwentyFortyEight
	LDR R7, R5, #3
	STR R7, R5, #-13
L7_TwentyFortyEight
	LDR R7, R5, #-13
	STR R7, R5, #-1
		.LOC 41
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRzp L8_TwentyFortyEight
		.LOC 41
		.LOC 42
	LEA R7, L10_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 43
	JMP L1_TwentyFortyEight
L8_TwentyFortyEight
		.LOC 46
	ADD R7, R5, #-12
	ADD R7, R7, #10
	STR R7, R5, #-2
		.LOC 48
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #0
	STR R3, R7, #0
	JMP L12_TwentyFortyEight
L11_TwentyFortyEight
		.LOC 50
		.LOC 51
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	LDR R3, R5, #-1
	CONST R2, #10
	MOD R3, R3, R2
	CONST R2, #48
	ADD R3, R3, R2
	STR R3, R7, #0
		.LOC 52
	LDR R7, R5, #-1
	CONST R3, #10
	DIV R7, R7, R3
	STR R7, R5, #-1
		.LOC 53
L12_TwentyFortyEight
		.LOC 50
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRnp L11_TwentyFortyEight
		.LOC 56
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L14_TwentyFortyEight
		.LOC 56
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #45
	STR R3, R7, #0
L14_TwentyFortyEight
		.LOC 58
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 59
L1_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 61
;;;;;;;;;;;;;;;;;;;;;;;;;;;;endl;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
endl
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
		.LOC 61
		.LOC 62
	LEA R7, L17_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 63
L16_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 66
;;;;;;;;;;;;;;;;;;;;;;;;;;;;rand16;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rand16
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
		.LOC 67
		.LOC 71
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
		.LOC 72
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
		.LOC 73
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
		.LOC 74
	JSR lc4_lfsr
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
		.LOC 77
	LDR R7, R5, #-1
	AND R7, R7, #15
L18_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 119
;;;;;;;;;;;;;;;;;;;;;;;;;;;;drawTiles;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
drawTiles
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
		.LOC 119
		.LOC 122
	CONST R7, #0
	STR R7, R5, #-1
L20_TwentyFortyEight
		.LOC 122
		.LOC 124
	LDR R7, R5, #-1
	CONST R3, #4
	MOD R2, R7, R3
	DIV R7, R7, R3
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R2, R7
	LDR R7, R7, #0
	CONST R3, #33
	CMP R7, R3
	BRzp L24_TwentyFortyEight
		.LOC 124
		.LOC 125
	CONST R7, #31
	LDR R3, R5, #-1
	CONST R2, #4
	MOD R1, R3, R2
	MUL R0, R7, R1
	ADD R0, R0, #1
	ADD R6, R6, #-1
	STR R0, R6, #0
	DIV R3, R3, R2
	MUL R7, R7, R3
	ADD R7, R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	SLL R7, R3, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R1, R7
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR drawSmall
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #3	;; free space for arguments
		.LOC 126
	JMP L25_TwentyFortyEight
L24_TwentyFortyEight
		.LOC 126
		.LOC 127
	CONST R7, #31
	LDR R3, R5, #-1
	CONST R2, #4
	MOD R1, R3, R2
	MUL R0, R7, R1
	ADD R0, R0, #1
	ADD R6, R6, #-1
	STR R0, R6, #0
	DIV R3, R3, R2
	MUL R7, R7, R3
	ADD R7, R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	SLL R7, R3, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R1, R7
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR drawBig
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #3	;; free space for arguments
		.LOC 128
L25_TwentyFortyEight
		.LOC 130
L21_TwentyFortyEight
		.LOC 122
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 122
	LDR R7, R5, #-1
	CONST R3, #16
	CMP R7, R3
	BRn L20_TwentyFortyEight
		.LOC 132
L19_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 134
;;;;;;;;;;;;;;;;;;;;;;;;;;;;redraw;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
redraw
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
		.LOC 135
		.LOC 142
	JSR lc4_reset_vmem
	ADD R6, R6, #0	;; free space for arguments
		.LOC 144
	JSR drawTiles
	ADD R6, R6, #0	;; free space for arguments
		.LOC 146
	JSR lc4_blt_vmem
	ADD R6, R6, #0	;; free space for arguments
		.LOC 147
L26_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 149
;;;;;;;;;;;;;;;;;;;;;;;;;;;;add_tile;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
add_tile
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-7	;; allocate stack space for local variables
	;; function body
		.LOC 149
		.LOC 152
	CONST R7, #0
	STR R7, R5, #-4
		.LOC 154
	CONST R7, #0
	STR R7, R5, #-2
L28_TwentyFortyEight
		.LOC 154
		.LOC 156
	LDR R7, R5, #-2
	CONST R3, #4
	MOD R2, R7, R3
	DIV R7, R7, R3
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R2, R7
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L32_TwentyFortyEight
		.LOC 156
		.LOC 157
	LDR R7, R5, #-4
	ADD R7, R7, #1
	STR R7, R5, #-4
		.LOC 158
L32_TwentyFortyEight
		.LOC 160
L29_TwentyFortyEight
		.LOC 154
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 154
	LDR R7, R5, #-2
	CONST R3, #16
	CMP R7, R3
	BRn L28_TwentyFortyEight
		.LOC 162
	LDR R7, R5, #-4
	CONST R3, #0
	CMP R7, R3
	BRnz L34_TwentyFortyEight
		.LOC 162
		.LOC 163
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	LDR R3, R5, #-4
	MOD R7, R7, R3
	STR R7, R5, #-5
		.LOC 164
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #8
	MOD R7, R7, R3
	CONST R3, #0
	CMP R7, R3
	BRnp L37_TwentyFortyEight
	CONST R7, #4
	STR R7, R5, #-7
	JMP L38_TwentyFortyEight
L37_TwentyFortyEight
	CONST R7, #2
	STR R7, R5, #-7
L38_TwentyFortyEight
	LDR R7, R5, #-7
	STR R7, R5, #-6
		.LOC 165
	LEA R7, score
	LDR R3, R7, #0
	LDR R2, R5, #-6
	ADD R3, R3, R2
	STR R3, R7, #0
		.LOC 166
	LEA R7, L39_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 167
	LEA R7, score
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
		.LOC 168
	LEA R7, L40_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 169
	CONST R7, #-1
	STR R7, R5, #-4
		.LOC 171
	CONST R7, #0
	STR R7, R5, #-2
L41_TwentyFortyEight
		.LOC 171
		.LOC 173
	LDR R7, R5, #-2
	CONST R3, #4
	MOD R2, R7, R3
	DIV R7, R7, R3
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R2, R7
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L45_TwentyFortyEight
		.LOC 173
		.LOC 174
	LDR R7, R5, #-4
	ADD R7, R7, #1
	STR R7, R5, #-4
		.LOC 176
	LDR R7, R5, #-4
	LDR R3, R5, #-5
	CMP R7, R3
	BRnp L47_TwentyFortyEight
		.LOC 176
		.LOC 177
	LDR R7, R5, #-2
	CONST R3, #4
	MOD R2, R7, R3
	DIV R7, R7, R3
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R2, R7
	LDR R3, R5, #-6
	STR R3, R7, #0
		.LOC 178
	JMP L43_TwentyFortyEight
L47_TwentyFortyEight
		.LOC 181
L45_TwentyFortyEight
		.LOC 183
L42_TwentyFortyEight
		.LOC 171
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 171
	LDR R7, R5, #-2
	CONST R3, #16
	CMP R7, R3
	BRn L41_TwentyFortyEight
L43_TwentyFortyEight
		.LOC 185
L34_TwentyFortyEight
		.LOC 188
	CONST R7, #1
	STR R7, R5, #-3
		.LOC 190
	CONST R7, #0
	STR R7, R5, #-2
L49_TwentyFortyEight
		.LOC 190
		.LOC 192
	CONST R7, #0
	STR R7, R5, #-1
L53_TwentyFortyEight
		.LOC 192
		.LOC 194
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L57_TwentyFortyEight
		.LOC 194
		.LOC 195
	CONST R7, #0
	STR R7, R5, #-3
		.LOC 196
	JMP L55_TwentyFortyEight
L57_TwentyFortyEight
		.LOC 199
	LDR R7, R5, #-1
	CONST R3, #3
	CMP R7, R3
	BRzp L59_TwentyFortyEight
		.LOC 199
		.LOC 201
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R2, R7, R3
	LDR R2, R2, #0
	ADD R7, R7, #1
	ADD R7, R7, R3
	LDR R7, R7, #0
	CMP R2, R7
	BRnp L61_TwentyFortyEight
		.LOC 201
		.LOC 202
	CONST R7, #0
	STR R7, R5, #-3
		.LOC 203
	JMP L55_TwentyFortyEight
L61_TwentyFortyEight
		.LOC 206
L59_TwentyFortyEight
		.LOC 208
	LDR R7, R5, #-2
	CONST R3, #3
	CMP R7, R3
	BRzp L63_TwentyFortyEight
		.LOC 208
		.LOC 210
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R1, R3, R2
	ADD R1, R7, R1
	LDR R1, R1, #0
	ADD R2, R2, #4
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CMP R1, R7
	BRnp L65_TwentyFortyEight
		.LOC 210
		.LOC 211
	CONST R7, #0
	STR R7, R5, #-3
		.LOC 212
	JMP L55_TwentyFortyEight
L65_TwentyFortyEight
		.LOC 215
L63_TwentyFortyEight
		.LOC 217
L54_TwentyFortyEight
		.LOC 192
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 192
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L53_TwentyFortyEight
L55_TwentyFortyEight
		.LOC 219
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRnp L67_TwentyFortyEight
		.LOC 219
		.LOC 220
	JMP L51_TwentyFortyEight
L67_TwentyFortyEight
		.LOC 223
L50_TwentyFortyEight
		.LOC 190
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 190
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L49_TwentyFortyEight
L51_TwentyFortyEight
		.LOC 225
	LDR R7, R5, #-3
	CONST R3, #1
	CMP R7, R3
	BRnp L69_TwentyFortyEight
		.LOC 225
		.LOC 226
	LEA R7, L71_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 227
	LEA R7, score
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
		.LOC 228
	LEA R7, L72_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 229
L69_TwentyFortyEight
		.LOC 229
		.LOC 231
L27_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 233
;;;;;;;;;;;;;;;;;;;;;;;;;;;;drawSmall;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
drawSmall
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
		.LOC 233
		.LOC 235
	LDR R7, R5, #3
	CONST R3, #2
	CMP R7, R3
	BRnp L74_TwentyFortyEight
		.LOC 235
		.LOC 236
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 237
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 238
	JMP L75_TwentyFortyEight
L74_TwentyFortyEight
		.LOC 238
	LDR R7, R5, #3
	CONST R3, #4
	CMP R7, R3
	BRnp L76_TwentyFortyEight
		.LOC 238
		.LOC 239
	CONST R7, #224
	HICONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 240
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 241
	JMP L77_TwentyFortyEight
L76_TwentyFortyEight
		.LOC 241
	LDR R7, R5, #3
	CONST R3, #8
	CMP R7, R3
	BRnp L78_TwentyFortyEight
		.LOC 241
		.LOC 242
	CONST R7, #255
	HICONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 243
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 244
	JMP L79_TwentyFortyEight
L78_TwentyFortyEight
		.LOC 244
	LDR R7, R5, #3
	CONST R3, #16
	CMP R7, R3
	BRnp L80_TwentyFortyEight
		.LOC 244
		.LOC 245
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 246
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 247
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 248
	JMP L81_TwentyFortyEight
L80_TwentyFortyEight
		.LOC 248
	LDR R7, R5, #3
	CONST R3, #32
	CMP R7, R3
	BRnp L82_TwentyFortyEight
		.LOC 248
		.LOC 249
	CONST R7, #31
	HICONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 250
	CONST R7, #109
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 251
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 252
L82_TwentyFortyEight
L81_TwentyFortyEight
L79_TwentyFortyEight
L77_TwentyFortyEight
L75_TwentyFortyEight
		.LOC 254
L73_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 256
;;;;;;;;;;;;;;;;;;;;;;;;;;;;drawBig;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
drawBig
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
		.LOC 256
		.LOC 258
	LDR R7, R5, #3
	CONST R3, #64
	CMP R7, R3
	BRnp L85_TwentyFortyEight
		.LOC 258
		.LOC 259
	CONST R7, #16
	HICONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 260
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 261
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 262
	JMP L86_TwentyFortyEight
L85_TwentyFortyEight
		.LOC 262
	LDR R7, R5, #3
	CONST R3, #128
	CMP R7, R3
	BRnp L87_TwentyFortyEight
		.LOC 262
		.LOC 263
	CONST R7, #31
	HICONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 264
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 265
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 266
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	CONST R3, #19
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 267
	JMP L88_TwentyFortyEight
L87_TwentyFortyEight
		.LOC 267
	LDR R7, R5, #3
	CONST R3, #0
	HICONST R3, #1
	CMP R7, R3
	BRnp L89_TwentyFortyEight
		.LOC 267
		.LOC 268
	CONST R7, #31
	HICONST R7, #126
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 269
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 270
	CONST R7, #107
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 271
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	CONST R3, #19
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 272
	JMP L90_TwentyFortyEight
L89_TwentyFortyEight
		.LOC 272
	LDR R7, R5, #3
	CONST R3, #0
	HICONST R3, #2
	CMP R7, R3
	BRnp L91_TwentyFortyEight
		.LOC 272
		.LOC 273
	CONST R7, #31
	HICONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 274
	CONST R7, #107
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 275
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 276
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	CONST R3, #19
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 277
	JMP L92_TwentyFortyEight
L91_TwentyFortyEight
		.LOC 277
	LDR R7, R5, #3
	CONST R3, #0
	HICONST R3, #4
	CMP R7, R3
	BRnp L93_TwentyFortyEight
		.LOC 277
		.LOC 278
	CONST R7, #0
	HICONST R7, #126
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 279
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 280
	CONST R7, #119
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 281
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 282
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	CONST R3, #22
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 283
	JMP L94_TwentyFortyEight
L93_TwentyFortyEight
		.LOC 283
	LDR R7, R5, #3
	CONST R3, #0
	HICONST R3, #8
	CMP R7, R3
	BRnp L95_TwentyFortyEight
		.LOC 283
		.LOC 284
	CONST R7, #0
	HICONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #29
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
		.LOC 285
	CONST R7, #93
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 286
	CONST R7, #119
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #8
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 287
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R7, R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 288
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	CONST R3, #22
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_seven_seg
	ADD R6, R6, #4	;; free space for arguments
		.LOC 289
L95_TwentyFortyEight
L94_TwentyFortyEight
L92_TwentyFortyEight
L90_TwentyFortyEight
L88_TwentyFortyEight
L86_TwentyFortyEight
		.LOC 291
L84_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 298
;;;;;;;;;;;;;;;;;;;;;;;;;;;;reset_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
reset_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
		.LOC 298
		.LOC 301
	LEA R7, score
	CONST R3, #0
	STR R3, R7, #0
		.LOC 303
	CONST R7, #0
	STR R7, R5, #-1
L98_TwentyFortyEight
		.LOC 303
		.LOC 304
	LDR R7, R5, #-1
	CONST R3, #4
	MOD R2, R7, R3
	DIV R7, R7, R3
	SLL R7, R7, #2
	LEA R3, tile
	ADD R7, R7, R3
	ADD R7, R2, R7
	CONST R3, #0
	STR R3, R7, #0
		.LOC 305
L99_TwentyFortyEight
		.LOC 303
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 303
	LDR R7, R5, #-1
	CONST R3, #16
	CMP R7, R3
	BRn L98_TwentyFortyEight
		.LOC 307
	JSR add_tile
	ADD R6, R6, #0	;; free space for arguments
		.LOC 308
	JSR add_tile
	ADD R6, R6, #0	;; free space for arguments
		.LOC 309
L97_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 312
;;;;;;;;;;;;;;;;;;;;;;;;;;;;mergeTiles;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
mergeTiles
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
		.LOC 312
		.LOC 315
	CONST R7, #0
	STR R7, R5, #-3
		.LOC 316
	CONST R7, #1
	STR R7, R5, #-4
L103_TwentyFortyEight
		.LOC 318
		.LOC 320
	LDR R7, R5, #-3
	LDR R3, R5, #3
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L106_TwentyFortyEight
		.LOC 320
		.LOC 322
	CONST R7, #1
	STR R7, R5, #-2
		.LOC 324
	LDR R7, R5, #-3
	STR R7, R5, #-1
	JMP L111_TwentyFortyEight
L108_TwentyFortyEight
		.LOC 324
		.LOC 326
	LDR R7, R5, #-1
	LDR R3, R5, #3
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L112_TwentyFortyEight
		.LOC 326
		.LOC 327
	CONST R7, #0
	STR R7, R5, #-2
		.LOC 328
	JMP L110_TwentyFortyEight
L112_TwentyFortyEight
		.LOC 331
L109_TwentyFortyEight
		.LOC 324
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L111_TwentyFortyEight
		.LOC 324
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L108_TwentyFortyEight
L110_TwentyFortyEight
		.LOC 331
		.LOC 333
	LDR R7, R5, #-2
	CONST R3, #1
	CMP R7, R3
	BRnp L114_TwentyFortyEight
		.LOC 333
		.LOC 334
	JMP L102_TwentyFortyEight
L114_TwentyFortyEight
		.LOC 337
	LDR R7, R5, #-3
	STR R7, R5, #-1
	JMP L119_TwentyFortyEight
L116_TwentyFortyEight
		.LOC 337
		.LOC 338
	LDR R7, R5, #-1
	LDR R3, R5, #3
	ADD R2, R7, R3
	ADD R7, R7, #1
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
		.LOC 339
L117_TwentyFortyEight
		.LOC 337
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L119_TwentyFortyEight
		.LOC 337
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L116_TwentyFortyEight
		.LOC 341
	JMP L107_TwentyFortyEight
L106_TwentyFortyEight
		.LOC 341
	LDR R7, R5, #-4
	LDR R3, R5, #3
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L120_TwentyFortyEight
		.LOC 341
		.LOC 342
	CONST R7, #1
	STR R7, R5, #-2
		.LOC 344
	LDR R7, R5, #-4
	STR R7, R5, #-1
	JMP L125_TwentyFortyEight
L122_TwentyFortyEight
		.LOC 344
		.LOC 346
	LDR R7, R5, #-1
	LDR R3, R5, #3
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L126_TwentyFortyEight
		.LOC 346
		.LOC 347
	CONST R7, #0
	STR R7, R5, #-2
		.LOC 348
	JMP L124_TwentyFortyEight
L126_TwentyFortyEight
		.LOC 351
L123_TwentyFortyEight
		.LOC 344
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L125_TwentyFortyEight
		.LOC 344
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L122_TwentyFortyEight
L124_TwentyFortyEight
		.LOC 351
		.LOC 353
	LDR R7, R5, #-2
	CONST R3, #1
	CMP R7, R3
	BRnp L128_TwentyFortyEight
		.LOC 353
		.LOC 354
	JMP L102_TwentyFortyEight
L128_TwentyFortyEight
		.LOC 355
		.LOC 357
	LDR R7, R5, #-4
	STR R7, R5, #-1
	JMP L133_TwentyFortyEight
L130_TwentyFortyEight
		.LOC 357
		.LOC 358
	LDR R7, R5, #-1
	LDR R3, R5, #3
	ADD R2, R7, R3
	ADD R7, R7, #1
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R2, #0
		.LOC 359
L131_TwentyFortyEight
		.LOC 357
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L133_TwentyFortyEight
		.LOC 357
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L130_TwentyFortyEight
		.LOC 359
		.LOC 361
	JMP L121_TwentyFortyEight
L120_TwentyFortyEight
		.LOC 361
		.LOC 363
	LDR R7, R5, #3
	LDR R3, R5, #-3
	ADD R3, R3, R7
	LDR R3, R3, #0
	LDR R2, R5, #-4
	ADD R7, R2, R7
	LDR R7, R7, #0
	CMP R3, R7
	BRnp L134_TwentyFortyEight
		.LOC 363
		.LOC 364
	LDR R7, R5, #-3
	LDR R3, R5, #3
	ADD R7, R7, R3
	LDR R3, R7, #0
	SLL R3, R3, #1
	STR R3, R7, #0
		.LOC 365
	LDR R7, R5, #-4
	LDR R3, R5, #3
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
		.LOC 367
	LDR R7, R5, #-3
	LDR R3, R5, #3
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	HICONST R3, #8
	CMP R7, R3
	BRnp L136_TwentyFortyEight
		.LOC 367
		.LOC 368
	LEA R7, L138_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 369
	LEA R7, score
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR printnum
	ADD R6, R6, #1	;; free space for arguments
		.LOC 370
	LEA R7, L139_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 371
L136_TwentyFortyEight
		.LOC 373
L134_TwentyFortyEight
		.LOC 373
		.LOC 375
	LDR R7, R5, #-4
	STR R7, R5, #-3
		.LOC 376
	LDR R7, R5, #-3
	ADD R7, R7, #1
	STR R7, R5, #-4
		.LOC 377
L121_TwentyFortyEight
L107_TwentyFortyEight
		.LOC 379
L104_TwentyFortyEight
		.LOC 379
	LDR R7, R5, #-4
	CONST R3, #4
	CMP R7, R3
	BRn L103_TwentyFortyEight
		.LOC 381
L102_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 383
;;;;;;;;;;;;;;;;;;;;;;;;;;;;update_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
update_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-8	;; allocate stack space for local variables
	;; function body
		.LOC 383
		.LOC 387
	CONST R7, #0
	STR R7, R5, #-8
		.LOC 388
	ADD R7, R5, #-7
	CONST R3, #0
	STR R3, R7, #4
		.LOC 390
	LDR R7, R5, #3
	CONST R3, #113
	CMP R7, R3
	BRnp L141_TwentyFortyEight
		.LOC 390
		.LOC 391
	JSR reset_game_state
	ADD R6, R6, #0	;; free space for arguments
		.LOC 392
	JMP L142_TwentyFortyEight
L141_TwentyFortyEight
		.LOC 392
	LDR R7, R5, #3
	CONST R3, #105
	CMP R7, R3
	BRnp L143_TwentyFortyEight
		.LOC 392
		.LOC 394
	CONST R7, #0
	STR R7, R5, #-2
L145_TwentyFortyEight
		.LOC 394
		.LOC 396
	CONST R7, #0
	STR R7, R5, #-1
L149_TwentyFortyEight
		.LOC 396
		.LOC 397
	LDR R7, R5, #-1
	ADD R3, R5, #-7
	ADD R3, R7, R3
	LDR R2, R5, #-2
	SLL R2, R2, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 398
L150_TwentyFortyEight
		.LOC 396
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 396
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L149_TwentyFortyEight
		.LOC 400
	ADD R7, R5, #-7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR mergeTiles
	ADD R6, R6, #1	;; free space for arguments
		.LOC 402
	CONST R7, #0
	STR R7, R5, #-1
L153_TwentyFortyEight
		.LOC 402
		.LOC 404
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRz L157_TwentyFortyEight
		.LOC 404
		.LOC 405
	CONST R7, #1
	STR R7, R5, #-8
		.LOC 406
L157_TwentyFortyEight
		.LOC 408
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #2
	LEA R2, tile
	ADD R3, R3, R2
	ADD R3, R7, R3
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 409
L154_TwentyFortyEight
		.LOC 402
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 402
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L153_TwentyFortyEight
		.LOC 411
L146_TwentyFortyEight
		.LOC 394
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 394
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L145_TwentyFortyEight
		.LOC 413
	JMP L144_TwentyFortyEight
L143_TwentyFortyEight
		.LOC 413
	LDR R7, R5, #3
	CONST R3, #107
	CMP R7, R3
	BRnp L159_TwentyFortyEight
		.LOC 413
		.LOC 415
	CONST R7, #0
	STR R7, R5, #-2
L161_TwentyFortyEight
		.LOC 415
		.LOC 417
	CONST R7, #0
	STR R7, R5, #-1
L165_TwentyFortyEight
		.LOC 417
		.LOC 418
	LDR R7, R5, #-1
	ADD R3, R5, #-7
	ADD R3, R7, R3
	CONST R2, #3
	SUB R7, R2, R7
	LDR R2, R5, #-2
	SLL R2, R2, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 419
L166_TwentyFortyEight
		.LOC 417
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 417
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L165_TwentyFortyEight
		.LOC 421
	ADD R7, R5, #-7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR mergeTiles
	ADD R6, R6, #1	;; free space for arguments
		.LOC 423
	CONST R7, #0
	STR R7, R5, #-1
L169_TwentyFortyEight
		.LOC 423
		.LOC 425
	LDR R7, R5, #-1
	CONST R3, #3
	SUB R3, R3, R7
	LDR R2, R5, #-2
	SLL R2, R2, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R3, R3, R2
	LDR R3, R3, #0
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRz L173_TwentyFortyEight
		.LOC 425
		.LOC 426
	CONST R7, #1
	STR R7, R5, #-8
		.LOC 427
L173_TwentyFortyEight
		.LOC 429
	LDR R7, R5, #-1
	CONST R3, #3
	SUB R3, R3, R7
	LDR R2, R5, #-2
	SLL R2, R2, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R3, R3, R2
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 430
L170_TwentyFortyEight
		.LOC 423
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 423
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L169_TwentyFortyEight
		.LOC 432
L162_TwentyFortyEight
		.LOC 415
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 415
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L161_TwentyFortyEight
		.LOC 434
	JMP L160_TwentyFortyEight
L159_TwentyFortyEight
		.LOC 434
	LDR R7, R5, #3
	CONST R3, #106
	CMP R7, R3
	BRnp L175_TwentyFortyEight
		.LOC 434
		.LOC 436
	CONST R7, #0
	STR R7, R5, #-2
L177_TwentyFortyEight
		.LOC 436
		.LOC 438
	CONST R7, #0
	STR R7, R5, #-1
L181_TwentyFortyEight
		.LOC 438
		.LOC 439
	LDR R7, R5, #-1
	ADD R3, R5, #-7
	ADD R3, R7, R3
	LDR R2, R5, #-2
	SLL R7, R7, #2
	LEA R1, tile
	ADD R7, R7, R1
	ADD R7, R2, R7
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 440
L182_TwentyFortyEight
		.LOC 438
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 438
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L181_TwentyFortyEight
		.LOC 442
	ADD R7, R5, #-7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR mergeTiles
	ADD R6, R6, #1	;; free space for arguments
		.LOC 444
	CONST R7, #0
	STR R7, R5, #-1
L185_TwentyFortyEight
		.LOC 444
		.LOC 446
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R2, R7, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R3, R3, R2
	LDR R3, R3, #0
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRz L189_TwentyFortyEight
		.LOC 446
		.LOC 447
	CONST R7, #1
	STR R7, R5, #-8
		.LOC 448
L189_TwentyFortyEight
		.LOC 450
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R2, R7, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R3, R3, R2
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 451
L186_TwentyFortyEight
		.LOC 444
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 444
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L185_TwentyFortyEight
		.LOC 453
L178_TwentyFortyEight
		.LOC 436
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 436
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L177_TwentyFortyEight
		.LOC 455
	JMP L176_TwentyFortyEight
L175_TwentyFortyEight
		.LOC 455
	LDR R7, R5, #3
	CONST R3, #108
	CMP R7, R3
	BRnp L191_TwentyFortyEight
		.LOC 455
		.LOC 457
	CONST R7, #0
	STR R7, R5, #-2
L193_TwentyFortyEight
		.LOC 457
		.LOC 459
	CONST R7, #0
	STR R7, R5, #-1
L197_TwentyFortyEight
		.LOC 459
		.LOC 460
	LDR R7, R5, #-1
	ADD R3, R5, #-7
	ADD R3, R7, R3
	LDR R2, R5, #-2
	CONST R1, #3
	SUB R7, R1, R7
	SLL R7, R7, #2
	LEA R1, tile
	ADD R7, R7, R1
	ADD R7, R2, R7
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 461
L198_TwentyFortyEight
		.LOC 459
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 459
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L197_TwentyFortyEight
		.LOC 463
	ADD R7, R5, #-7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR mergeTiles
	ADD R6, R6, #1	;; free space for arguments
		.LOC 465
	CONST R7, #0
	STR R7, R5, #-1
L201_TwentyFortyEight
		.LOC 465
		.LOC 467
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	CONST R2, #3
	SUB R2, R2, R7
	SLL R2, R2, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R3, R3, R2
	LDR R3, R3, #0
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	CMP R3, R7
	BRz L205_TwentyFortyEight
		.LOC 467
		.LOC 468
	CONST R7, #1
	STR R7, R5, #-8
		.LOC 469
L205_TwentyFortyEight
		.LOC 471
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	CONST R2, #3
	SUB R2, R2, R7
	SLL R2, R2, #2
	LEA R1, tile
	ADD R2, R2, R1
	ADD R3, R3, R2
	ADD R2, R5, #-7
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
		.LOC 472
L202_TwentyFortyEight
		.LOC 465
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
		.LOC 465
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRn L201_TwentyFortyEight
		.LOC 474
L194_TwentyFortyEight
		.LOC 457
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
		.LOC 457
	LDR R7, R5, #-2
	CONST R3, #4
	CMP R7, R3
	BRn L193_TwentyFortyEight
		.LOC 476
L191_TwentyFortyEight
L176_TwentyFortyEight
L160_TwentyFortyEight
L144_TwentyFortyEight
L142_TwentyFortyEight
		.LOC 478
	LDR R7, R5, #-8
	CONST R3, #1
	CMP R7, R3
	BRnp L207_TwentyFortyEight
		.LOC 478
		.LOC 479
	JSR add_tile
	ADD R6, R6, #0	;; free space for arguments
		.LOC 480
L207_TwentyFortyEight
		.LOC 482
L140_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.LOC 488
;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
		.LOC 489
		.LOC 492
	LEA R7, L210_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 493
	LEA R7, L211_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 494
	LEA R7, L212_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 495
	LEA R7, L213_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 496
	LEA R7, L214_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 497
	LEA R7, L215_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 499
	JSR reset_game_state
	ADD R6, R6, #0	;; free space for arguments
		.LOC 501
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
	JMP L217_TwentyFortyEight
L216_TwentyFortyEight
		.LOC 503
		.LOC 504
	JSR lc4_wait_for_char
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
		.LOC 506
	LEA R7, L219_TwentyFortyEight
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
		.LOC 508
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR update_game_state
	ADD R6, R6, #1	;; free space for arguments
		.LOC 510
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
		.LOC 511
L217_TwentyFortyEight
		.LOC 503
	JMP L216_TwentyFortyEight
		.LOC 513
	CONST R7, #0
L209_TwentyFortyEight
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
score 		.BLKW 1
		.DATA
tile 		.BLKW 16
		.DATA
L219_TwentyFortyEight 		.STRINGZ "Got a keystroke\n"
		.DATA
L215_TwentyFortyEight 		.STRINGZ "Press q to reset\n"
		.DATA
L214_TwentyFortyEight 		.STRINGZ "Press l to slide right\n"
		.DATA
L213_TwentyFortyEight 		.STRINGZ "Press j to slide left\n"
		.DATA
L212_TwentyFortyEight 		.STRINGZ "Press k to slide down\n"
		.DATA
L211_TwentyFortyEight 		.STRINGZ "Press i to slide up\n"
		.DATA
L210_TwentyFortyEight 		.STRINGZ "!!! Welcome to 2048 !!!\n"
		.DATA
L139_TwentyFortyEight 		.STRINGZ "\n"
		.DATA
L138_TwentyFortyEight 		.STRINGZ "Congratulations! You won and your score is "
		.DATA
L72_TwentyFortyEight 		.STRINGZ "\n"
		.DATA
L71_TwentyFortyEight 		.STRINGZ "Unfortunately, you lost. Your score is "
		.DATA
L40_TwentyFortyEight 		.STRINGZ "\n"
		.DATA
L39_TwentyFortyEight 		.STRINGZ "Current score is "
		.DATA
L17_TwentyFortyEight 		.STRINGZ "\n"
		.DATA
L10_TwentyFortyEight 		.STRINGZ "-32768"
		.DATA
L4_TwentyFortyEight 		.STRINGZ "0"
