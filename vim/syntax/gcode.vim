" Vim syntax file for Gcode
" Language: GCode
" Last Change: 5.05.2015
" Based on NC syntax by Dave Eno <daveeno@gmail.com>
" and awesome http://http://reprap.org/wiki/G-code

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn match ncComment "\s*;.*$"
syn match ncLineNumber "\<^N\d+\>"
syn match ncChecksum "\<\*\d+\>"

syn keyword ncGCodes G0 G1 G2 G3 G28 G29 G30 G31 G32 G31 G32 G4 G10 G10 G11 G20 G21 G22 G23 G90 G91 G92 G100 G130 G131 G132 G133 G161 G162
syn keyword ncMCodes M0 M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11 M17 M18 M20 M21 M22 M23 M24 M25 M26 M27 M28 M29 M30 M31 M32 M33 M34 M36 M37 M40 M41 M42 M42 M43 M48 M70 M72 M73 M80 M81 M82 M83 M84 M85 M92 M93 M98 M99 M98 M99 M101 M102 M103 M104 M105 M106 M107 M108 M109 M110 M111 M112 M113 M114 M115 M116 M117 M117 M118 M119 M120 M121 M120 M121 M122 M123 M124 M126 M127 M128 M129 M130 M131 M132 M133 M134 M135 M136 M140 M141 M142 M143 M144 M146 M149 M150 M160 M163 M164 M190 M200 M201 M202 M203 M204 M205 M206 M207 M207 M208 M208 M209 M210 M211 M212 M218 M220 M221 M220 M221 M222 M223 M224 M225 M226 M226 M227 M228 M229 M230 M231 M232 M240 M240 M241 M245 M246 M250 M251 M280 M300 M301 M302 M303 M304 M305 M306 M320 M321 M322 M340 M350 M351 M355 M360 M360 M361 M362 M363 M364 M365 M370 M371 M372 M373 M374 M375 M380 M381 M400 M401 M402 M404 M405 M406 M407 M408 M420 M500 M501 M502 M503 M540 M540 M550 M551 M552 M553 M554 M555 M556 M557 M558 M559 M560 M561 M562 M563 M564 M565 M566 M567 M568 M569 M570 M571 M572 M573 M574 M575 M600 M605 M665 M666 M667 M700 M701 M702 M906 M907 M908 M909 M928 M998 M999
syn match ncTool "\<T\d\+\>"

syn match ncInvalid "[GM]\d\+"

syn match ncXYAxis "\<[XY]-\?\d\+\>"
syn match ncXYAxis "\<[XY]-\?\.\d\+\>"
syn match ncXYAxis "\<[XY]-\?\d\+\."
syn match ncXYAxis "\<[XY]-\?\d\+\.\d\+\>"

syn match ncZAxis "\<Z-\?\d\+\>"
syn match ncZAxis "\<Z-\?\.\d\+\>"
syn match ncZAxis "\<Z-\?\d\+\."
syn match ncZAxis "\<Z-\?\d\+\.\d\+\>"

syn match ncOtherParam "\<[IJKDHQ]-\?\d\+\>"
syn match ncOtherParam "\<[IJKDHQ]-\?\.\d\+\>"
syn match ncOtherParam "\<[IJKDHQ]-\?\d\+\."
syn match ncOtherParam "\<[IJKDHQ]-\?\d\+\.\d\+\>"

syn match ncExtrude "\<E-\?\d\+\>"
syn match ncExtrude "\<E-\?\.\d\+\>"
syn match ncExtrude "\<E-\?\d\+\."
syn match ncExtrude "\<E-\?\d\+\.\d\+\>"

syn match ncFeedrate "\<F-\?\d\+\>"
syn match ncFeedrate "\<F-\?\.\d\+\>"
syn match ncFeedrate "\<F-\?\d\+\."
syn match ncFeedrate "\<F-\?\d\+\.\d\+\>"

syn match ncValue "\<[SPR]-\?\d\+\>"
syn match ncValue "\<[SPR]-\?\.\d\+\>"
syn match ncValue "\<[SPR]-\?\d\+\."
syn match ncValue "\<[SPR]-\?\d\+\.\d\+\>"

hi def link ncComment Comment

hi def link ncInvalid Error

hi def link ncGCodes Statement
hi def link ncMCodes Type
hi def link ncTool PreProc

hi def link ncXYAxis Number
hi def link ncZAxis Number
hi def link ncOtherParam Number
hi def link ncFeedrate Number
hi def link ncExtrude Number
hi def link ncValue Special

hi def link ncLineNumber Ignore
hi def link ncChecksum Ignore

let b:current_syntax = "gcode"
