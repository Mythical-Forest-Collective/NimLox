import ../tokens

type Expr* = object of RootObj # So it's inheritable

proc new(_: typedesc[Binary], left: Expr, operator: Token, right: Expr): Binary =
  return Binary(left: left, operator: operator, right: right)

type Unary* = object of Expr
  operator*: Token
  right*: Expr

type Literal* = object of Expr
  value*: string

type Binary* = object of Expr
  left*: Expr
  operator*: Token
  right*: Expr

type Grouping* = object of Expr
  expression*: Expr

proc new*(_: typedesc[Unary], operator: Token, right: Expr): Unary =
  return Unary(operator: operator, right: right)

proc new*(_: typedesc[Literal], value: string): Literal =
  return Literal(value: value)

proc new*(_: typedesc[Binary], left: Expr, operator: Token, right: Expr): Binary =
  return Binary(left: left, operator: operator, right: right)

proc new*(_: typedesc[Grouping], expression: Expr): Grouping =
  return Grouping(expression: expression)

