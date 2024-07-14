local screen = getScreenSize( );

local logged = guiCreateElement( 0, "Авторизация", screen[0]/2-110, screen[1]/2-57, 220.0, 115.0 );
local label = guiCreateElement( 6, "Введите пароль", 73.0, 20.0, 200.0, 25.0, false, logged );
local edit = guiCreateElement( 1, "", 10.0, 50.0, 200.0, 25.0, false, logged );
local button = guiCreateElement( 2, "Войти", 10.0, 80.0, 200.0, 25.0, false, logged );
guiSetVisible( logged, false);

local register = guiCreateElement( 0, "Регистрация", screen[0]/2-110, screen[1]/2-57, 220.0, 115.0 );
local label1 = guiCreateElement( 6, "Введите пароль", 73.0, 20.0, 200.0, 25.0, false, register );
local edit1 = guiCreateElement( 1, "", 10.0, 50.0, 200.0, 25.0, false, register );
local button1 = guiCreateElement( 2, "Войти", 10.0, 80.0, 200.0, 25.0, false, register );
guiSetVisible( register, false);

bindKey( "f2", "down",
    function()
    {
        if( !guiIsVisible( logged ) )
            guiSetVisible( logged, true );
        else
            guiSetVisible( logged, false );
        showCursor( !isCursorShowing() );
    }
);
addEventHandler( "onGuiElementClick",
function( element )
{
	if( element == button ) 
	{
		local text = guiGetText ( edit );
		triggerServerEvent( "login", text );
		return;
	}

	if( element == button1 ) 
	{
		local text = guiGetText ( edit1 );
		triggerServerEvent( "reg", text );
		return;
	}
});

addEventHandler( "reg_okno",
function( playerid )
{
	guiSetVisible( register, true);
});
addEventHandler( "reg",
function( playerid )
{
	showCursor( false );
	guiSetVisible( register, false);
});

addEventHandler( "login_okno",
function( playerid )
{
	guiSetVisible( logged, true);
});
addEventHandler( "login",
function( playerid )
{
	showCursor( false );
	guiSetVisible( logged, false);
});