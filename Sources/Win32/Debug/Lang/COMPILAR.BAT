rem EquipeX
echo Gerando %1...

del diversos.res

brcc32 -32 -fo diversos.res %1\%1.rc

DCC32 -NSsystem;vcl Agente.dpr -D%1=1 -E%1

copy %1\Agente.dll appsHT.dll
