; PlayerInput by Ryan (?)
PlayerInput(text){
s := A_IsSuspended
Suspend On
KeyWait Enter
SendInput t^a{backspace}%text%
Input, var, v, {enter}
SendInput ^a{backspace 100}{enter}
Sleep, 20
if(!s)
Suspend Off
return var
}