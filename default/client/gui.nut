local window = guiCreateElement( 0, "Test Window", 1.0, 1.0, 450.0, 150.0 );
local label = guiCreateElement( 6, "Push the button, I dare you!", 8.0, 20.0, 200.0, 25.0, false, window );
local button = guiCreateElement( 2, "I DOUBLE DARE YOU MOTHERFUCKER", 8.0, 50.0, 200.0, 25.0, false, window );
local edit = guiCreateElement( 1, ":D", 8.0, 80.0, 200.0, 25.0, false, window );

guiSetVisible( window, false );


bindKey( "f2", "down",
    function()
    {
        if( !guiIsVisible( window ) )
            guiSetVisible( window, true );
        else
            guiSetVisible( window, false );
        showCursor( !isCursorShowing() );
    }
);


addEventHandler( "onGuiElementClick",
	function( element )
	{
		if( element == button ) {
			local text = guiGetText ( edit );
			sendMessage ( "GUI Input: " + text );
		}
	}
);