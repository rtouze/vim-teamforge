" Vim syntax file
" Language:     Teamforge Wiki
" Maintainer:   Romain TOUZÉ <romain.touze@gmail.com>
" Filenames:    *.ctf
" Last Change:	2013 11 06

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syntax sync minlines=10

" TODO : not sure it's needed...
syntax match teamforgeLineStart "^[<@]\@!" nextgroup=@teamforgeBlock

syntax cluster teamforgeBlock contains=teamforgeH1,teamforgeH2,teamforgeH3,
      \ teamforgeListMarker,teamforgeOrderedListMarker,
      \ teamforgeCodeBlock,teamforgeRule

syntax cluster teamforgeInline contains=teamforgeLineBreak,
      \ teamforgeLinkText,teamforgeItalic,teamforgeBold,
      \ teamforgeCode,teamforgeEscape,@htmlTop

" Headings definition
syntax region teamforgeH1 matchgroup=teamforgeHeadingDelimiter 
      \ start="!!!!\@!" end="$" 
      \ keepend oneline contains=@teamforgeInline contained

syntax region teamforgeH2 matchgroup=teamforgeHeadingDelimiter 
      \ start="!!!\@!" end="#*\s*$" 
      \ keepend oneline contains=@teamforgeInline contained

syntax region teamforgeH3 matchgroup=teamforgeHeadingDelimiter 
      \ start="!!\@!" end="#*\s*$" keepend oneline contains=@teamforgeInline contained

" Code blocks
syntax region teamforgeCodeBlock matchgroup=teamforgeCodeDelimiter 
      \ start="{{{" end="}}}" keepend

" Bullets and numbered Lists...
syntax match teamforgeListMarker "\* \{0,1}\%(\s\+\S\)\@=" contained
syntax match teamforgeOrderedListMarker "# \{0,1}\%(\s*\S\)\@=" contained

" Horizontal line
syntax match teamforgeRule "----*$" contained

syntax match teamforgeLineBreak "\s\\\{2,\}$"

" Hypertext links
" TODO : find how to separate link from link text. Should have a look to
" mediawiki plugin...
syntax region teamforgeLinkText matchgroup=teamforgeUrlDelimiter 
      \ start="\[\@<!\[\[\@!" end="\]" oneline keepend 
" Show pascal case expressions as links (if not preceded by a tilde)
syntax match teamforgeLinkText "\~\@<!\(\u\l\+\)\{2,\}"

" Font decoration
syntax region teamforgeItalic 
      \ start="\S\@<=''\|''\S\@=" end="\S\@<=''\|''\S\@="
      \ keepend contains=teamforgeLineStart
syntax region teamforgeBold 
      \ start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" 
      \ keepend contains=teamforgeLineStart
" TODO find pattern for bold + italic
syntax region teamforgeBoldItalic 
      \ start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" 
      \ keepend contains=teamforgeLineStart
syntax region teamforgeBoldItalic 
      \ start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@="
      \ keepend contains=teamforgeLineStart

hi def link teamforgeH1                    htmlH1
hi def link teamforgeH2                    htmlH2
hi def link teamforgeH3                    htmlH3
hi def link teamforgeHeadingDelimiter      Delimiter
hi def link teamforgeOrderedListMarker     teamforgeListMarker
hi def link teamforgeListMarker            htmlTagName
hi def link teamforgeCodeDelimiter         Delimiter
hi def link teamforgeCodeBlock             String
hi def link teamforgeRule                  PreProc
hi def link teamforgeLinkText              htmlLink
hi def link teamforgeId                    Type
hi def link teamforgeAutomaticLink         teamforgeUrl
hi def link teamforgeUrl                   String
hi def link teamforgeUrlTitle              String
hi def link teamforgeUrlDelimiter          htmlTag
hi def link teamforgeUrlTitleDelimiter     Delimiter

hi def link teamforgeItalic                htmlItalic
hi def link teamforgeBold                  htmlBold
hi def link teamforgeBoldItalic            htmlBoldItalic

hi def link teamforgeEscape                Special

let b:current_syntax = "teamforge"

" vim:set sw=2:
