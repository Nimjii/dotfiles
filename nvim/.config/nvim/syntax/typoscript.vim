" Vim syntax file
" Language:	TypoScript
" Maintainer:	Nimjii
" Filenames:	.typoscript
" Last Change:	2023 Oct 09

if exists("b:current_syntax")
    finish
endif

syn sync fromstart

syn case match
syn keyword typoscriptObject CASE COA COA_INT CONFIG CONTENT EXTBASEPLUGIN FILES FLUIDTEMPLATE GIFBUILDER HMENU IMAGE IMG_RESOURCE LOAD_REGISTER PAGE RECORDS RESTORE_REGISTER SVG TEXT TMENU USER USER_INT

syn match typoscriptAltComment "\/\/.*" containedin=typoscriptLeft
syn match typoscriptComment "#.*" containedin=typoscriptLeft
syn match typoscriptCurly "[{}]" containedin=typoscriptDefBlock
syn match typoscriptDelimiter "|" contained containedin=typoscriptMultiLineStringInner,typoscriptMultiLineStringOuter,typoscriptRightString
syn match typoscriptDot "\." contained containedin=typoscriptLeft,typoscriptRightRef
syn match typoscriptEscapedDot "\\\." contained containedin=typoscriptLeft,typoscriptRightRef
syn match typoscriptLeft "^[^\[\]{}<>=@][^{}<>=@:]*[:({}<>=]"me=e-1 contained containedin=typoscriptDef,typoscriptDefBlock,typoscriptDefString
syn match typoscriptOperator "[:!=<>]"
syn match typoscriptParenthesis "[()]" contained
syn match typoscriptSpecial "[\[\]&|]"

syn region typoscriptBlock start="{" end="}" transparent fold
syn region typoscriptBlockComment start="\/\*" end="\*\/" containedin=typoscriptLeft extend
syn region typoscriptCondition start="\[.*\]" end="\[.*\]" transparent fold
syn region typoscriptConstant start="{\$" end="}" containedin=typoscriptRightString,typoscriptString oneline
syn region typoscriptDef start="^[^\[\]\/{}<>=@#]" end="[<>][^\]]*$" oneline keepend
syn region typoscriptDefBlock start="^[^\[\]\/{}<>=@#]" end="[{(]$" oneline keepend
syn region typoscriptDefString start="^[^\[\]\/{}<>=@#]" end="[^<>=]=[^=<].*$" oneline keepend
syn region typoscriptInclude start="@import" end="$" oneline keepend
syn region typoscriptMultiLineStringInner start="(" end=")" contained containedin=typoscriptMultiLineStringInner,typoscriptMultiLineStringOuter extend
syn region typoscriptMultiLineStringOuter matchgroup=typoscriptParenthesis start="(" end=")" contained containedin=typoscriptDefBlock extend fold
syn region typoscriptRightRef matchgroup=typoscriptOperator start="\(>\|=\{,1}<\)" end="$" contained containedin=typoscriptDef
syn region typoscriptRightString matchgroup=typoscriptOperator start=":\{,1}=" end="$" contained containedin=typoscriptDefString contains=typoscriptObject
syn region typoscriptString start=/\\\@<!['"]/ end=/\\\@<!['"]/ containedin=typoscriptInclude

hi def link typoscriptAltComment		Comment
hi def link typoscriptBlockComment		Comment
hi def link typoscriptComment			Comment
hi def link typoscriptConstant			Identifier
hi def link typoscriptCurly			Delimiter
hi def link typoscriptDelimiter			Delimiter
hi def link typoscriptDot			Ignore
hi def link typoscriptEscapedDot		Constant
hi def link typoscriptInclude			Include
hi def link typoscriptLeft			Constant
hi def link typoscriptMultiLineStringInner	String
hi def link typoscriptMultiLineStringOuter	String
hi def link typoscriptObject			Type
hi def link typoscriptOperator			Operator
hi def link typoscriptParenthesis		Delimiter
hi def link typoscriptSpecial			Special
hi def link typoscriptString			String
hi def link typoscriptRightRef			Constant
hi def link typoscriptRightString		String

let b:current_syntax = 'typoscript'

