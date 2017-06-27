/* 
 * This is free and unencumbered software released into the public domain.
 * 
 * Anyone is free to copy, modify, publish, use, compile, sell, or
 * distribute this software, either in source code form or as a compiled
 * binary, for any purpose, commercial or non-commercial, and by any
 * means.
 
 * In jurisdictions that recognize copyright laws, the author or authors
 * of this software dedicate any and all copyright interest in the
 * software to the public domain. We make this dedication for the benefit
 * of the public at large and to the detriment of our heirs and
 * successors. We intend this dedication to be an overt act of
 * relinquishment in perpetuity of all present and future rights to this
 * software under copyright law.
 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 
 * For more information, please refer to <http://unlicense.org/>
 */

const MAX_VISIBLE_BUTTONS = 9;

var cQtdPg;
var cPg;

function updatePagination(pg, qPg) {
	cPg = pg;
	// Garante que vai exibir ao menos uma página
	if (qPg === 0){
		cQtdPg = 1;
	} else {
		// Se número de página (qPg) for > 0 sobreescreve qtdPg
		if (qPg > 0){
			cQtdPg = qPg;
		} 
		// Se qPg for menor que 0 usa-se o último valor de qtdPg 
	}
	
	$("#pagItems > li").slice(1, -1).remove();
	
	// Se a página selecionada for a primeira, desabilita botão "<<"
	if (pg === 1){
		$("#pagItems > li:first-child").addClass("disabled");
	} else {
		$("#pagItems > li:first-child").removeClass("disabled");
	}
	
	// Se a página selecionada for a última, desabilita botão ">>"
	if (pg === cQtdPg){
		$("#pagItems > li:last-child").addClass("disabled");
	} else {
		$("#pagItems > li:last-child").removeClass("disabled");
	}
	
	// Se a quantidade de páginas for menor do que o máximo visível
	if (cQtdPg <= MAX_VISIBLE_BUTTONS) {
		// Mostra todas as páginas e ativa a selecionada
		for (var i = 1; i <= cQtdPg; i++) {
			if (i === pg){
				$("<li class=\"active\"><a>" + i + "</a></li>").insertBefore("#pagItems li:last-child");
			} else {
				$("<li><a>" + i + "</a></li>").insertBefore("#pagItems li:last-child");
			}
		}
	} else {
//		// Se a página for maior que 5
//		if (pg > 5){
//			// a primeira pág não estará entre as 4 opções anteriores e "..." 
//				// é adcionado no começo indicando que existem mais páginas para trás
//			$("<li class=\"disabled\"><a>...</a></li>").insertAfter("#pagItems li:first-child");
//		}
		
		var i;			
		// De quatro posições atrás até quatro posições adiante
		for (i = pg - 4; i <= pg + 4; i++) {
			// Se a posição existir
			if (i > 0 && i <= cQtdPg){
				// Se for a página ativa
				if (i === pg){
					$("<li class=\"active\"><a>" + i + "</a></li>").insertBefore("#pagItems li:last-child");
				} else {
					$("<li><a>" + i + "</a></li>").insertBefore("#pagItems li:last-child");
				}
			}
		}		

		// Se a primeira página não estiver entre as 4 opções anteriores
		if ((pg - 4) > 1){
			
			// Se a primeira opção não for a segunda página
			if ((pg - 4) > 2){
				// "..." é adcionado no início para indicar que existem páginas entre a primeira página exibida e a primeira página
				$("<li class=\"disabled\"><a>...</a></li>").insertAfter("#pagItems li:first-child");
			}
			// Link para primeira página
			$("<li><a>1</a></li>").insertAfter("#pagItems li:first-child");
		}		
		
		// Se a última página não estiver entre as próximas 4 opções
		if ((pg + 4) < cQtdPg){
			
			// Se a última opção não for a anterior a última página
			if ((pg + 4) !== cQtdPg - 1){
				// "..." é adcionado no fim para indicar que existem páginas entre a última página exibiida e a última página
				$("<li class=\"disabled\"><a>...</a></li>").insertBefore("#pagItems li:last-child");
			}
			// Link para última página
			$("<li><a>" + cQtdPg + "</a></li>").insertBefore("#pagItems li:last-child");
		}
	}	
};

function nextPg(){
	if (cPg < cQtdPg){
		updatePagination(cPg+1, -1);
	}
};

function prevPg(){
	if (cPg > 1){
		updatePagination(cPg-1, -1);
	}
};
