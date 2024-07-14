

bindKey( "f6", "down",//Чат на F6 
function()
{
showChat( !isChatVisible() );
}
);
bindKey( "f5", "down",//Починка на F5
function()
{
triggerServerEvent( "CarFix" );
}
);
 
