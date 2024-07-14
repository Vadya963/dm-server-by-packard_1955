/*
    Script by Boylett
    Squirrel.nut Compiler
    Released under GNU/GPL
*/


function waitForLoad()    {
    log( "This will compile files from file.nut to file.sq" );
    log( "USAGE: compile [file]" );
}

addEventHandler( "onScriptInit", 
    function( ) {
        timer( waitForLoad, 100, 1 );
    }
);

addEventHandler( "onConsoleInput", 
    function( command, params )    {
        if( command != "compile" )    return;
        if( 1 in params )    {
            local folder = "resources/";
            print( "-------------------------------------------------------" );
            print( "Attempting to compile: " + folder + params + ".nut" );
            local compile;
            try    {
                compile = loadfile( folder + params + ".nut", true );
            }
            catch( e )    {
                print( "Failed to compile" );
                print( "-------------------------------------------------------" );
                return true;
            }            
            writeclosuretofile( folder + params + ".sq", compile );
            print( "Compiled to " + folder + params + ".sq\n" );
            print( "-------------------------------------------------------" );
        }
        else    print( "USAGE: compile [file]" );
    } 
);