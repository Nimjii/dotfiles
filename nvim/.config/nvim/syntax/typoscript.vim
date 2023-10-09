" Vim syntax file
" Language:		TypoScript
" Maintainer:	Nimjii
" Filenames :	.typoscript
" Last Change:	2023 Oct 06

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

" syn match typoscriptAmpersand "&"
" syn match typoscriptBracketOpen "\["
" syn match typoscriptBracketClose "\]"
" syn match typoscriptColon ":" contained containedin=typoscriptDef
" syn match typoscriptComment "#.*" containedin=typoscriptDef
" syn match typoscriptCurlyClose "}" contained containedin=typoScriptDef
" syn match typoscriptCurlyOpen "{" contained containedin=typoScriptDef
" syn match typoscriptDot "\." contained containedin=typoscriptDef
" syn match typoscriptEquals "=" contained containedin=typoscriptDef,typoscriptOperator
" syn match typoscriptGreaterThan ">" contained containedin=typoscriptDef
" syn match typoscriptLowerThan "<" contained containedin=typoScriptDef
" syn match typoscriptPipe "|"

" syn region typoscriptBlock start="{" end="}" containedin=typoscriptDef transparent fold
" syn region typoscriptBlockComment start="\/\*" end="\*\/"
" syn region typoscriptCondition start="\[.*\]" end="\[.*\]" containedin=typoscriptDef transparent fold
" syn region typoscriptDef start="^[^#@\/\/\[\]]" end="$" oneline keepend
" syn region typoscriptInclude start="@import" end="$" contains=typoscriptString oneline keepend
" syn region typoscriptRight start="=[^<]" end="$" contained containedin=typoscriptDef oneline keepend
" syn region typoscriptOperator start="^" end="=" contained containedin=typoscriptRight oneline
" syn region typoscriptString start="['\"]" end="['\"]" contained

" hi def link typoscriptAmpersand 	Special
" hi def link typoscriptAltComment 	Comment
" hi def link typoscriptBlockComment 	Comment
" hi def link typoscriptBracketClose 	Special
" hi def link typoscriptBracketOpen 	Special
" hi def link typoscriptColon 		Ignore
" hi def link typoscriptComment 		Comment
" hi def link typoscriptCurlyClose 	Ignore
" hi def link typoscriptCurlyOpen 	Ignore
" hi def link typoscriptDef 		Constant
" hi def link typoscriptDot		Ignore
" hi def link typoscriptEquals 		Ignore
" hi def link typoscriptGreaterThan 	Ignore
" hi def link typoscriptInclude 		Include
" hi def link typoscriptLowerThan 	Ignore
" hi def link typoscriptPipe 		Special
" hi def link typoscriptRight 		String
" hi def link typoscriptString		String

let b:current_syntax = 'typoscript'

