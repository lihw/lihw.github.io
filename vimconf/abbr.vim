"
" Filename: cream-abbr.vim
"
" Cream -- An easy-to-use configuration of the famous Vim text editor
" [ http://cream.sourceforge.net ] Copyright (C) 2002-2004  Steve Hall
" 
" License:
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
" [ http://www.gnu.org/licenses/gpl.html ]
" 
" This program is distributed in the hope that it will be useful, but
" WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
" General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with this program; if not, write to the Free Software
" Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
" 02111-1307, USA.
"
" Description:
" Load spelling auto-corrections (Vim abbreviations) based on language.
"

" called via autocmd on startup and on spell check language change
function! Cream_autocorrect_init()

    " clear all existing
    iabclear

	" if un-initialized
	if !exists("g:CREAM_SPELL_LANG")
		call Cream_source($CREAM . "cream-abbr-eng.vim")
		return
	endif

	" if empty
	if g:CREAM_SPELL_LANG == ""
		call Cream_source($CREAM . "cream-abbr-eng.vim")
		return
	endif

	" now check each (for multiple)
	" English
	if match(g:CREAM_SPELL_LANG, "eng") > -1
		call Cream_source($CREAM . "cream-abbr-eng.vim")
	endif
	" French
	if match(g:CREAM_SPELL_LANG, "fre") > -1
		call Cream_source($CREAM . "cream-abbr-fre.vim")
	endif

endfunction

