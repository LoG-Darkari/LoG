:?:/tanken::
Suspend Permit
BlockInput, On
modelid := getPlayerVehicleModelID()
Send {enter}
sleep 10
if(modelid = 541 || modelid = 560 || modelid = 480 || modelid = 562 || modelid = 422 || modelid = 587 || modelid = 500 || modelid = 579 || modelid = 451 || modelid = 559 || modelid = 429 || modelid = 477 || modelid = 442 || modelid = 558 || modelid = 505)
{
var = 80
Goto, benz
}
if(modelid = 523 || modelid = 586 || modelid = 401 || modelid = 574)
{
var = 40
Goto, benz
}
if(modelid = 596 || modelid = 597 || modelid = 598 || modelid = 470 || modelid = 434 || modelid = 491)
{
var = 90
Goto, benz
}
if(modelid = 487 || modelid = 497 || modelid = 488)
{
var = 200
Goto, kero
}
if(modelid = 456 || modelid = 423)
{
var = 90
Goto, diesel
}
if(modelid = 463)
{
var = 20
Goto, benz
}
if(modelid = 521)
{
var = 35
Goto, benz
}
if(modelid = 536)
{
var = 60
Goto, diesel
}
if(modelid = 522 || modelid = 581 || modelid = 530)
{
var = 30
Goto, benz
}
if(modelid = 402 || modelid = 547 || modelid = 405 || modelid = 415)
{
var = 60
Goto, benz
}
if(modelid = 426)
{
var = 76
Goto, benz
}
if(modelid = 490 || modelid = 599 || modelid = 554 || modelid = 494 || modelid = 502 || modelid = 503 || modelid = 504)
{
var = 100
Goto, benz
}
if(modelid = 528)
{
var = 95
Goto, benz
}
if(modelid = 458 || modelid = 418)
{
var = 75
Goto, diesel
}
if(modelid = 411 || modelid = 492 || modelid = 600 || modelid = 546 || modelid = 561 || modelid = 518 || modelid = 466)
{
var = 75
Goto, benz
}
if(modelid = 578 || modelid = 443 || modelid = 588 || modelid = 444 || modelid = 556 || modelid = 557)
{
var = 100
Goto, diesel
}
if(modelid = 468 || modelid = 471)
{
var = 25
Goto, benz
}
if(modelid = 515)
{
var = 160
Goto, diesel
}
if(modelid = 601)
{
var = 110
Goto, diesel
}
if(modelid = 495)
{
var = 110
Goto, benz
}
if(modelid = 427 || modelid = 416)
{
var = 150
Goto, diesel
}
if(modelid = 582 || modelid = 499 || modelid = 482 || modelid = 439 || modelid = 534 || modelid = 535 || modelid = 508 || modelid = 543 || modelid = 545)
{
var = 80
Goto, diesel
}
if(modelid = 469)
{
var = 100
Goto, kero
}
if(modelid = 565 || modelid = 566 || modelid = 507 || modelid = 533 || modelid = 424 || modelid = 475 || modelid = 580 || modelid = 551 || modelid = 589 || modelid = 467 || modelid = 419 || modelid = 409 || modelid = 436 || modelid = 421)
{
var = 70
Goto, benz
}
if(modelid = 603 || modelid = 517 || modelid = 540 || modelid = 585 || modelid = 529 || modelid = 550 || modelid = 527 || modelid = 526 || modelid = 516)
{
var = 65
Goto, benz
}
if(modelid = 563)
{
var = 350
Goto, kero
}
if(modelid = 548)
{
var = 300
Goto, kero
}
if(modelid = 417)
{
var = 250
Goto, kero
}
if(modelid = 514)
{
var = 120
Goto, diesel
}
if(modelid = 555 || modelid = 410)
{
var = 50
Goto, benz
}
if(modelid = 568 || modelid = 404 || modelid = 531)
{
var = 50
Goto, diesel
}
if(modelid = 462)
{
var = 6
Goto, benz
}
if(modelid = 457 || modelid = 571 || modelid = 572)
{
var = 10
Goto, benz
}
if(modelid = 461)
{
var = 15
Goto, benz
}
if(modelid = 412 || modelid = 542 || modelid = 445 || modelid = 474 || modelid = 496 || modelid = 478)
{
var = 65
Goto, diesel
}
if(modelid = 573 || modelid = 403)
{
var = 110
Goto, diesel
}
if(modelid = 489 || modelid = 506)
{
var = 85
Goto, benz
}
if(modelid = 400 || modelid = 483)
{
var = 85
Goto, diesel
}
if(modelid = 440 || modelid = 576 || modelid = 567 || modelid = 575 || modelid = 549 || modelid = 479)
{
var = 70
Goto, diesel
}
if(IsPlayerInAnyVehicle() == 0)
{
AddChatMessage("{00BFFF}Du bist in keinem Fahrzeug!")
BlockInput, Off
return
}
AddChatMessage("{00BFFF}Deine CarID ist (noch) nicht implementiert oder wurde nicht erkannt!")
BlockInput, Off
return


benz:
currentfuel := getTextDrawBySubstring("Benz")
RegExMatch(currentfuel, " (\d*)", currentfuel)
StringTrimLeft, currentfuel, currentfuel, 1
AddChatMessage(currentfuel)

if(var = currentfuel)
{
AddChatMessage("{00BFFF}Dein Tank ist voll. Du musst nicht tanken!")
BlockInput, Off
return
}
var -= currentfuel
AddChatMessage(var)
if(var < 0)
{
AddChatMessage("{FF595E} FEHLER: {FFFFFF}Falsche Tankzahl eingegeben oder einige Tankfüllungen haben sich verändert!")
BlockInput, Off
return
}
AddChatMessage("{00BFFF}Du musst noch{00FF00} " var "{00BFFF} Liter tanken.")
SendChat("/fill")
sleep 300
Send {enter}
sleep 300
Send %var%{enter}
AddChatMessage("{00BFFF}Dein Fahrzeug wird nun betankt!")
BlockInput, Off
return


diesel:
currentfuel := getTextDrawBySubstring("Dies")
RegExMatch(currentfuel, " (\d*)", currentfuel)
StringTrimLeft, currentfuel, currentfuel, 1
if(var = currentfuel)
{
AddChatMessage("{00BFFF}Dein Tank ist voll. Du musst nicht tanken!")
BlockInput, Off
return
}
var -= currentfuel
if(var < 0)
{
AddChatMessage("{FF595E} FEHLER: {FFFFFF}Falsche Tankzahl eingegeben oder einige Tankfüllungen haben sich verändert!")
BlockInput, Off
return
}
AddChatMessage("{00BFFF}Du musst noch{00FF00} " var "{00BFFF} Liter tanken.")
SendChat("/fill")
sleep 300
Send {Escape}
sleep 300
Send %var%{enter}
AddChatMessage("{00BFFF}Dein Fahrzeug wird nun betankt!")
BlockInput, Off
return

kero:
currentfuel := getTextDrawBySubstring("Kero")
RegExMatch(currentfuel, " (\d*)", currentfuel)
StringTrimLeft, currentfuel, currentfuel, 1
if(var = currentfuel)
{
AddChatMessage("{00BFFF}Dein Tank ist voll. Du musst nicht tanken!")
BlockInput, Off
return
}
var -= currentfuel
if(var < 0)
{
AddChatMessage("{FF595E} FEHLER: {FFFFFF}Falsche Tankzahl eingegeben oder einige Tankfüllungen haben sich verändert!")
BlockInput, Off
return
}
AddChatMessage("{00BFFF}Du musst noch{00FF00} " var "{00BFFF} Liter tanken.")
SendChat("/fill")
sleep 300
Send {enter}
sleep 300
Send %var%{enter}
AddChatMessage("{00BFFF}Dein Helikopter wird nun betankt!")
BlockInput, Off
return