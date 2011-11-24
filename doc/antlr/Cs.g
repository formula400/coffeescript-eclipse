grammar Cs;

options{
  output=AST;
  ASTLabelType=CommonTree;
  //language=Python;
}

tokens {
  AT_SIGIL; BOOL; BOUND_FUNC_ARROW; BY; CALL_END; CALL_START; CATCH; CLASS; COLON; COLON_SLASH; COMMA; COMPARE; COMPOUND_ASSIGN; DOT; DOT_DOT; DOUBLE_COLON; ELLIPSIS; ELSE; EQUAL; EXTENDS; FINALLY; FOR; FORIN; FOROF; FUNC_ARROW; FUNC_EXIST; HERECOMMENT; IDENTIFIER; IF; INDENT; INDEX_END; INDEX_PROTO; INDEX_SOAK; INDEX_START; JS; LBRACKET; LCURLY; LEADING_WHEN; LOGIC; LOOP; LPAREN; MATH; MINUS; MINUS; MINUS_MINUS; NEW; NUMBER; OUTDENT; OWN; PARAM_END; PARAM_START; PLUS; PLUS_PLUS; POST_IF; QUESTION; QUESTION_DOT; RBRACKET; RCURLY; REGEX; RELATION; RETURN; RPAREN; SHIFT; STATEMENT; STRING; SUPER; SWITCH; TERMINATOR; THEN; THIS; THROW; TRY; UNARY; UNTIL; WHEN; WHILE;
}
@members {

}

root : body;

body	: value;
//expression (TERMINATOR expression)*;

expression
  : value
  ;
  
value
  : IDENTIFIER
  | literal
  | parenthetical
  ;

literal
  : alphaNumeric
  ;

alphaNumeric
 :	 NUMBER 
 | 	STRING;

parenthetical
  : LPAREN expression RPAREN
  ;

IDENTIFIER :	('a'..'z')+;
LPAREN	:	'(';
MINUS : '-';
RPAREN	:	')';
STRING	:	'"' (('a'..'z') | ' ')* '"';
NUMBER	:	'1'..'9' ('0'..'9')*;
TERMINATOR : '\n';

WS  :   (' '|'\t')+ {skip();} ;

