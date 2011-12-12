/*
* generated by Xtext
*/
grammar DebugInternalCoffeeScript ;

// Rule Root
ruleRoot :
	ruleBody |
	ruleBlock RULE_TERMINATOR
;

// Rule Body
ruleBody :
	ruleLine (
		RULE_TERMINATOR ruleLine?
	)*
;

// Rule Line
ruleLine :
	ruleStmt |
	ruleExpression
;

// Rule Stmt
ruleStmt :
	ruleReturnStmt |
	ruleThrowStmt
;

// Rule ReturnStmt
ruleReturnStmt :
	RULE_RETURN ruleExpression
;

// Rule ThrowStmt
ruleThrowStmt :
	RULE_THROW ruleExpression
;

// Rule Expression
ruleExpression :
	rulePostfixIf
;

// Rule PostfixIf
rulePostfixIf :
	ruleAssignment (
		( (
		RULE_POST_IF |
		RULE_IF
		) => (
			RULE_POST_IF |
			RULE_IF
		) ) ruleExpression
	)?
;

// Rule Assignment
ruleAssignment :
	( (
	ruleAssignable (
		RULE_EQUAL |
		RULE_COMPOUND_ASSIGN
	)
	) => (
		ruleAssignable (
			RULE_EQUAL |
			RULE_COMPOUND_ASSIGN
		)
	) ) ruleExpression |
	ruleLogicOp
;

// Rule LogicOp
ruleLogicOp :
	ruleCompareOp (
		( (
		RULE_LOGIC
		) => RULE_LOGIC ) ruleCompareOp
	)*
;

// Rule CompareOp
ruleCompareOp :
	ruleRelationOp (
		( (
		RULE_COMPARE
		) => RULE_COMPARE ) ruleRelationOp
	)*
;

// Rule RelationOp
ruleRelationOp :
	ruleShiftOp (
		( (
		RULE_RELATION
		) => RULE_RELATION ) ruleShiftOp
	)*
;

// Rule ShiftOp
ruleShiftOp :
	ruleAdditiveOp (
		( (
		RULE_SHIFT
		) => RULE_SHIFT ) ruleAdditiveOp
	)*
;

// Rule AdditiveOp
ruleAdditiveOp :
	ruleMathOp (
		( (
		RULE_PLUS |
		RULE_MINUS
		) => (
			RULE_PLUS |
			RULE_MINUS
		) ) ruleMathOp
	)*
;

// Rule MathOp
ruleMathOp :
	ruleUnaryOp (
		( (
		RULE_MATH
		) => RULE_MATH ) ruleUnaryOp
	)*
;

// Rule UnaryOp
ruleUnaryOp :
	(
		RULE_UNARY |
		RULE_PLUS |
		RULE_MINUS
	) ruleExpression |
	(
		RULE_PLUS_PLUS |
		RULE_MINUS_MINUS
	) ruleVariable |
	ruleApplication RULE_QUESTION?
;

// Rule Application
ruleApplication :
	rulePrimaryExpression ruleFeatureCall*
;

// Rule FeatureCall
ruleFeatureCall :
	ruleFunctionCall |
	rulePropertyAccess
;

// Rule FunctionCall
ruleFunctionCall :
	RULE_FUNC_EXIST? RULE_CALL_START RULE_CALL_END
;

// Rule PropertyAccess
rulePropertyAccess :
	ruleNamedPropertyAccess |
	ruleIndexedPropertyAccess
;

// Rule NamedPropertyAccess
ruleNamedPropertyAccess :
	(
		RULE_DOT |
		RULE_QUESTION_DOT
	) ruleId |
	RULE_DOUBLE_COLON ruleId?
;

// Rule IndexedPropertyAccess
ruleIndexedPropertyAccess :
	RULE_INDEX_START ruleIndex RULE_INDEX_END
;

// Rule Index
ruleIndex :
	( (
	RULE_DOT_DOT
	) => RULE_DOT_DOT ) ruleExpression |
	( (
	ruleExpression RULE_DOT_DOT
	) => (
		ruleExpression RULE_DOT_DOT
	) ) ruleExpression? |
	ruleExpression
;

// Rule PrimaryExpression
rulePrimaryExpression :
	ruleIfExp |
	( (
	RULE_LPAREN
	) => ruleParenthetical ) |
	ruleLiteral |
	( (
	RULE_LBRACKET
	) => ruleArray ) |
	ruleId
;

// Rule Block
ruleBlock :
	RULE_INDENT ruleBody? RULE_OUTDENT
;

// Rule IfExp
ruleIfExp :
	ruleCondBlock (
		RULE_ELSE ruleCondBlock
	)* (
		RULE_ELSE ruleBlock
	)?
;

// Rule CondBlock
ruleCondBlock :
	RULE_IF ruleExpression ruleBlock
;

// Rule Id
ruleId :
	RULE_IDENTIFIER
;

// Rule Property
ruleProperty :
	ruleId RULE_DOT ruleId
;

// Rule Variable
ruleVariable :
	ruleId |
	ruleProperty
;

// Rule Assignable
ruleAssignable :
	ruleVariable |
	( (
	RULE_LBRACKET
	) => ruleArray )
;

// Rule Arg
ruleArg :
	ruleExpression RULE_ELLIPSIS?
;

// Rule ArgLine
ruleArgLine :
	ruleArg (
		RULE_COMMA ruleArg
	)* RULE_COMMA?
;

// Rule ExplicitArgList
ruleExplicitArgList :
	ruleArgLine (
		RULE_TERMINATOR ruleArgLine |
		RULE_INDENT ruleArgLine RULE_OUTDENT
	)*
;

// Rule ArgList
ruleArgList :
	(
		ruleExplicitArgList |
		RULE_INDENT ruleExplicitArgList RULE_OUTDENT
	)?
;

// Rule Array
ruleArray :
	( (
	RULE_LBRACKET
	) => RULE_LBRACKET ) ruleArgList RULE_RBRACKET
;

// Rule NumberLiteral
ruleNumberLiteral :
	RULE_NUMBER
;

// Rule StringLiteral
ruleStringLiteral :
	RULE_STRING
;

// Rule BoolLiteral
ruleBoolLiteral :
	RULE_BOOL
;

// Rule Literal
ruleLiteral :
	ruleNumberLiteral |
	ruleStringLiteral |
	ruleBoolLiteral
;

// Rule Parenthetical
ruleParenthetical :
	( (
	RULE_LPAREN
	) => RULE_LPAREN ) ruleBody RULE_RPAREN
;

RULE_ELLIPSIS :
	'...'
;

RULE_DOT_DOT :
	'..'
;

RULE_DOUBLE_COLON :
	'::'
;

RULE_SHIFT :
	'<<' |
	'>>'
;

RULE_COMPARE :
	'<' |
	'==' |
	'>' |
	'<=' |
	'>=' |
	'!='
;

RULE_COMPOUND_ASSIGN :
	'+=' |
	'-='
;

RULE_PLUS_PLUS :
	'++'
;

RULE_MINUS_MINUS :
	'--'
;

RULE_AT_SIGIL :
	'@'
;

RULE_BOOL :
	'true' |
	'false' |
	'undefined' |
	'null'
;

RULE_BOUND_FUNC_ARROW :
	'dummy BOUND_FUNC_ARROW'
;

RULE_BY :
	'dummy BY'
;

RULE_CALL_END :
	'*)'
;

RULE_CALL_START :
	'(*'
;

RULE_CATCH :
	'dummy CATCH'
;

RULE_CLASS :
	'class'
;

RULE_COLON :
	':'
;

RULE_COLON_SLASH :
	'dummy COLON_SLASH'
;

RULE_COMMA :
	'dummy COMMA'
;

RULE_DOT :
	'.'
;

RULE_ELSE :
	'else'
;

RULE_EQUAL :
	'='
;

RULE_EXTENDS :
	'dummy EXTENDS'
;

RULE_FINALLY :
	'dummy FINALLY'
;

RULE_FOR :
	'dummy FOR'
;

RULE_FORIN :
	'dummy FORIN'
;

RULE_FOROF :
	'dummy FOROF'
;

RULE_FUNC_ARROW :
	'dummy FUNC_ARROW'
;

RULE_FUNC_EXIST :
	'dummy FUNC_EXIST'
;

RULE_HERECOMMENT :
	'dummy HERECOMMENT'
;

RULE_IF :
	'if' |
	'unless'
;

RULE_INDENT :
	'{*'
;

RULE_INDEX_END :
	'*]'
;

RULE_INDEX_PROTO :
	'dummy INDEX_PROTO'
;

RULE_INDEX_SOAK :
	'dummy INDEX_SOAK'
;

RULE_INDEX_START :
	'[*'
;

RULE_JS :
	'dummy JS'
;

RULE_LBRACKET :
	'['
;

RULE_LCURLY :
	'dummy LCURLY'
;

RULE_LEADING_WHEN :
	'dummy LEADING_WHEN'
;

RULE_LOGIC :
	'&&' |
	'||'
;

RULE_LOOP :
	'dummy LOOP'
;

RULE_LPAREN :
	'('
;

RULE_MATH :
	'*' |
	'/'
;

RULE_MINUS :
	'-'
;

RULE_NEW :
	'dummy NEW'
;

RULE_NUMBER :
	'0' .. '9'+
;

RULE_OUTDENT :
	'*}'
;

RULE_OWN :
	'dummy OWN'
;

RULE_PARAM_END :
	'dummy PARAM_END'
;

RULE_PARAM_START :
	'dummy PARAM_START'
;

RULE_PLUS :
	'+'
;

RULE_POST_IF :
	'dummy POST_IF'
;

RULE_QUESTION :
	'?'
;

RULE_QUESTION_DOT :
	'?.'
;

RULE_RBRACKET :
	']'
;

RULE_RCURLY :
	'dummy RCURLY'
;

RULE_REGEX :
	'dummy REGEX'
;

RULE_RELATION :
	'in' |
	'of' |
	'instanceof'
;

RULE_RETURN :
	'return'
;

RULE_RPAREN :
	')'
;

RULE_STATEMENT :
	'dummy STATEMENT'
;

RULE_STRING :
	'"' (
		'a' .. 'z' |
		' '
	)* '"'
;

RULE_SUPER :
	'dummy SUPER'
;

RULE_SWITCH :
	'dummy SWITCH'
;

RULE_TERMINATOR :
	'\n'+
;

RULE_THEN :
	'dummy THEN'
;

RULE_THIS :
	'dummy THIS'
;

RULE_THROW :
	'throw'
;

RULE_TRY :
	'dummy TRY'
;

RULE_UNARY :
	'!' |
	'~' |
	'new'
;

RULE_UNTIL :
	'dummy UNTIL'
;

RULE_WHEN :
	'dummy WHEN'
;

RULE_WHILE :
	'dummy WHILE'
;

RULE_IDENTIFIER :
	'^'? (
		'a' .. 'z' |
		'A' .. 'Z' |
		'_'
	) (
		'a' .. 'z' |
		'A' .. 'Z' |
		'_' |
		'0' .. '9'
	)*
;

RULE_WS :
	(
		' ' |
		'\t'
	)+ {skip();}
;