local database;

function scriptInit()
{
	// Create the database instance
	database = sqlite( "server.db" );

	// Create the main table
	database.query( "CREATE TABLE IF NOT EXISTS settings (started INT)" );
	
	// Insert if needed
	local result = database.query( "SELECT COUNT() FROM settings" );
	if( result[1]["COUNT()"] == 0 )
	{
		database.query( "INSERT INTO settings (started) VALUES ('0')" );
	}

	// Update the started count
	database.query( "UPDATE settings SET started = started + 1" );

	// Get the started count
	result = database.query( "SELECT * FROM settings" );
	
	//
	log( "Server has started " + result[1]["started"] + " times." );
}
addEventHandler( "onScriptInit", scriptInit );

function scriptExit()
{
	// Close the database
	database.close();
}
addEventHandler( "onScriptExit", scriptExit );
