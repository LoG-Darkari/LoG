scramble(x)
{
Y := RegExReplace(X, "(.)", "$1|")
Sort, Y, Random D|
Z := RegExReplace(Y, "\|")
Return z
}