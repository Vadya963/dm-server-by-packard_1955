// fps.nut By AaronLad

local labels = [
[-572.199768, 1602.267090, -16.559303],
[-572.199768, 1602.267090, -16.559303],
[-572.199768, 1602.267090, -16.559303]
];
addEventHandler( "onClientFrameRender", 
	function( post )
	{
		if( post )
		dxDrawText( "Русский развлекательный сервер Criminal America.Группа вк: vk.com/mafia2serv," 2.0, 2.0, 0xFFFFFFFF, true, "tahoma-bold" );
	    for(local i=0;i<labels.len();i++)
            {
               local screen = getScreenFromWorld( labels[i][0],labels[i][1],labels[i][2]+2 );
               local position = getPlayerPosition( getLocalPlayer( ) );
               local fDistance = getDistanceBetweenPoints3D( labels[i][0],labels[i][1],labels[i][2], position[0], position[1], position[2] );
            
                   if(fDistance <= 30.0)
                  {  
                       if( screen[2] < 1.0 )
                       {                                                                                                                                     
                       dxDrawText( "Что бы взять авто используйте /veh id Команды сервера /help Группа сервера вк: vk.com/mafia2serv", screen[0], screen[1], 0xFFFFFFFF, true, "tahoma-bold", 1.0 );
     
					   }
                  }
            }
	}

)