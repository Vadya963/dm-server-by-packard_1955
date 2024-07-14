local script = "Criminal America 2022";

function random(min=0, max=RAND_MAX)
{
srand(getTickCount() * rand());
return (rand() % ((max + 1) - min)) + min;
}
function isNumeric( string )
{
    try
    {
        string.tointeger()
    }
    catch( string )
    {
        return 0;
    }
	
    return 1;
}
local secTimers;
local DelCarCount = 0;
local RespCarCount = 0;
local RekLamaCount = 0;
local globalhours = 4;
local MAX_VEH = 1000;
local MAX_PLAYERS = 20;
local players = {};
local InvalidCars = array(MAX_VEH, 0);
local vehInfos  =
[
[ 28, 535.676697, 1583.405640, -16.425211, 2.568883, 0.011065, -0.493507, false ],
[ 28, -543.773560, 1583.329956, -16.425571, 0.914227, 0.003378, -0.423412, false ],
[ 28, -550.153625, 1583.728394, -16.424786, 2.587326, 0.348700, -0.396939, false ],
[ 28, -549.676575, 1599.517090, -16.425133, -0.061954, -0.000201, -0.371741, false ],
[ 28, -544.559387, 1599.477173, -16.426533, -0.113292, -0.000377, -0.381102, false ],
[ 28, -541.124451, 1599.998291, -16.425032, -0.028137, -0.000108, -0.440530, false ],
[ 45, -537.969482, 1599.566284, -16.426495, -0.030474, -0.000117, -0.438593, false ],
[ 45, -533.668945, 1598.838257, -16.424431, -0.326651, -0.001078, -0.378074, false ],
[ 45, -576.298035, 1584.050171, -16.423626, 0.041014, 0.317846, -0.369677, false ],
[ 45, -579.703674, 1583.897217, -16.425667, 0.107471, 0.303655, -0.464397, false ],
[ 41, -583.679688, 1584.035767, -16.424677, 0.140540, 0.000482, -0.392894, false ],
[ 41, -588.984985, 1584.647827, -16.420282, 0.059414, 0.307921, -0.420215, false ],
[41, -571.388367, 1583.871826, -16.415483, 0.580309, 0.000323, -0.063760, false ],
[42, -328.054840, 663.886963, -17.448723, 90.119659, -3.621310, -0.155388, false ],
[42, -328.435455, 677.053650, -17.396893, 88.992058, -2.845695, 0.160276, false ],
[42, -328.580261, 682.615173, -17.379961, 89.329918, -3.009808, 0.476755, false ],
[51, -323.848419, 696.550232, -17.608898, -177.019028, -0.145073, 0.618905, false ],
[51, -313.454803, 697.089722, -18.822075, -179.406158, -0.167943, 1.950711, false ],
[51, -303.152374, 696.370972, -19.463764, -177.147659, -0.324814, 0.240232,false ],
[37, -425.382751, -680.179871, -21.272875, 88.230286, -0.395497, -2.160958, false ],
[ 36, -426.282135, -675.304504, -21.087818, 89.932457, -0.470906, -2.441478,false ],
[ 37, -425.456421, -667.495300, -20.812830, 86.708748, -0.313570, -2.187570,false ],
[ 37, -426.434052, -670.999817, -20.939817, 87.913673, -0.389169, -2.218578, false ],
[ 37, -425.978516, -663.461853, -20.669283, 82.015831, -0.597240, -1.877311, false ]//26
]; 
local vehInfosLength = vehInfos.len() - 1;
function createcar() {           
     for( local i =0; i < vehInfos.len(); ++i ) {
          createVehicle(vehInfos[i][0], vehInfos[i][1], vehInfos[i][2], vehInfos[i][3], vehInfos[i][4], vehInfos[i][5], vehInfos[i][6]); 
    }
return 1;
}
function respcar() {
    for( local i = 0; i < vehInfos.len(); ++i ) {
        if( vehInfos[i][7] != true ) {    // if there is no player in vehicle
            repairVehicle( i );
			setVehicleDirtLevel( i, 0.0 );
            setVehicleTuningTable( i, 0 );			
            setVehiclePosition( i, vehInfos[i][1], vehInfos[i][2], vehInfos[i][3]); 
            setVehicleRotation( i, vehInfos[i][4], vehInfos[i][5], vehInfos[i][6]);
        }
    }
	return 1;
	}
function SetPlayerSkin(playerid,skinid)
{
setPlayerModel( playerid, skinid.tointeger() );
setPlayerModel( playerid, skinid.tointeger() );
return 1;
} 
vehicleColor <- [
    [154, 154, 154, "Ледяной Белый"],
    [143, 137, 124, "Кремовый"],
    [112, 104, 89, "Светло-Серый"],
    [79, 72, 65, "Серый"],
    [120, 111, 68, "Магнолия"],
    [121, 113, 31, "Желтый"],
    [98, 26, 21, "Розовый"],
    [66, 0, 0, "Бордовый"],
    [29, 4, 0, "Светло-Коричневый"],
    [15, 32, 24, "Зеленый"],
    [80, 80, 80, "Серебристый"],
    [83, 104, 80, "Фенхелевый"],
    [1, 17, 13, "Изумрудный"],
    [71, 91, 91, "Шотландский Туман"],
    [20, 33, 39, "Темный Аквамарин"],
    [4, 4, 4, "Черный Скаледо"],
    [57, 49, 29, "Хаки"],
    [51, 22, 8, "Рыжий"],
    [2, 5, 19, "Индиговая Ноч"],
    [18, 44, 69, "Лазурно-Голубой"],
    [132, 112, 78, "бледное лицо"],
    [145, 114, 33, "Золотистый"],
    [97, 46, 10, "Шоколадный"],
    [70, 128, 95, "Мятный Зеленый"],
    [27, 76, 65, "Нефритовый Зеленый"],
    [57, 84, 37, "Лайм"],
    [73, 75, 33, "Ивовый Зеленый"],
    [47, 95, 106, "Ярко-Голубой"],
    [4, 15, 20, "Съерра"],
    [132, 90, 103, "Нежно-Розовый"],
    [90, 28, 38, "Фуксия"],
    [97, 35, 58, "Розовый Денби"],
    [102, 70, 18, "Темно-Золотой"],
    [74, 43, 8, "Золотой"],
    [35, 22, 8, "Красное Дерево"],
    [157, 111, 68, "Бежевый"],
    [125, 0, 0, "Вишневый"],
    [74, 43, 34, "Сладкий Шоколад"],
    [78, 132, 129, "Бюрезовый"],
    [17, 1, 14, "Черная смородина"]
];
getTuneLevel <- [
    ["Сток"],
    ["Регулировка"],
    ["Спортивный тюнинг"],
    ["Компресор"]
];    

function TimerFunc()
{
secTimers.Kill( );
secTimers = 0;
secTimers = timer(secTimer,1100, -1);
return 1;
}
function scriptInit()
{   secTimers = timer(secTimer,60*2000, -1);
	log( script + " Loaded!" );
	setGameModeText( "CRIMINAL_AMERICA[V02]" );
	setMapName( "Empire Bay" );
	log( script + " StartScript!" );
    createcar();
	return 1;
}
addEventHandler( "onScriptInit", scriptInit );

function scriptExit( )
{
	secTimers.Kill( );
    log( script + " UPAL!" );
}
addEventHandler( "onScriptExit", scriptExit );

function playerConnect( playerid, name, ip, serial )
{ 
    log(""+getPlayerName( playerid )+" start playerConnect");
	log(""+getPlayerSerial(playerid)+"");
    
	if ((getPlayerSerial(playerid) == "665B0AEE48BFCE91F2FC4B8B81B012F4")) return kickPlayer( playerid );
	if ((getPlayerSerial(playerid) == "78957D98114D25C3B62F837C75E952DA")) return kickPlayer( playerid );
	
	
	setPlayerModel( playerid, 0 );
	setPlayerModel( playerid, 0 );
	givePlayerWeapon( playerid, 0, 0 );
	players[playerid] <- {};

    players[playerid].SpawnCars <- 0; //Спавн авто
    players[playerid].Kills <- 0;
	players[playerid].Killer <- 0;
    //if(isSerialBanned( getPlayerSerial(playerid) )) return kickPlayer( playerid );
    
	sendPlayerMessageToAll( ""+ getPlayerName( playerid ) + " Подключился к серверу.", 255, 204, 0 );
   // PlayerCheck(playerid);
	log(""+getPlayerName( playerid )+" end playerConnect");
	
   return 1;
}
addEventHandler( "onPlayerConnect", playerConnect );

function playerDisconnect( playerid, reason )
{   clearWhoWas();
    log(""+getPlayerName( playerid )+" start playerDisconnect");
    delete players[playerid];  // удаляем таблицу
	sendPlayerMessageToAll( ""+ getPlayerName( playerid ) + " Покинул нас.", 255, 204, 0 );
	
	if( isPlayerInVehicle( playerid )) {   
	local veh = getPlayerVehicle( playerid );
	InvalidCars[veh] = 1;   
    if (veh <= vehInfosLength) {
    vehInfos[veh][7] = false;
	}}
	log(""+getPlayerName( playerid )+" end playerDisconnect");
	return 1;
}
addEventHandler( "onPlayerDisconnect", playerDisconnect );

function playerSpawn( playerid )
{   togglePlayerControls ( playerid, false );
	log(""+getPlayerName( playerid )+" start playerSpawn");
	if(isSerialBanned( getPlayerSerial(playerid) )) return kickPlayer( playerid );
	setPlayerPosition( playerid, 79.735184, 1827.995239, -100.325420);//16
	SetPlayerSkin( playerid, random(0,155) );
	setPlayerPosition( playerid, 79.735184, 1827.995239, -100.325420);
	setPlayerPosition( playerid, -574.163696, 1600.743408, -16.595583 );//16
	
	setPlayerHealth( playerid, 720.0 );
	sendPlayerMessage( playerid, "Мы рады видеть вас " + script );
	sendPlayerMessage( playerid, "Команды сервера /help ");
	sendPlayerMessage( playerid, "Взять авто /veh id ");
	sendPlayerMessage( playerid, "ID Авто можно посмотреть нажав F1 ");

	givePlayerWeapon( playerid, 10, 250 );
	givePlayerWeapon( playerid, 11, 250 );
	givePlayerWeapon( playerid, 12, 250 );
	givePlayerWeapon( playerid, 8, 250 );
	givePlayerWeapon( playerid, 13, 250 );
	givePlayerWeapon( playerid, 5, 250 );
	
	togglePlayerControls ( playerid, true );
	changeWeather();
	log(""+getPlayerName( playerid )+" end playerSpawn");
    return 1;
}
addEventHandler( "onPlayerSpawn", playerSpawn );


function playerDeath( playerid, killerid )
{   log(""+getPlayerName( playerid )+" start playerDeath");
	if( killerid != INVALID_ENTITY_ID )
		{
		sendPlayerMessageToAll( "~ " + getPlayerName( playerid ) + " Был убит игроком " + getPlayerName( killerid ) + ".", 255,0,0 );
	players[playerid].Kills ++;
	players[killerid].Killer ++;
	return 1;}
	else{
		sendPlayerMessageToAll( "~ " + getPlayerName( playerid ) + " Умер.",255,0,0 );
    players[playerid].Kills --;
	return 1;
	}
	log(""+getPlayerName( playerid )+" end playerDeath");
	return 1;
}
addEventHandler( "onPlayerDeath", playerDeath );


function playerChat( playerid, chattext )
{
log(""+getPlayerName( playerid )+" start playerChat");
if(chattext.tolower() == "что тут делать" || (chattext.tolower() == "как тачку взять") || (chattext.tolower() == "помогите") || (chattext.tolower() == "где тачки") || (chattext.tolower() == "как в тачку сесть")){
sendPlayerMessage(playerid,"Команды сервера /help");} 
log(""+getPlayerName( playerid )+" end playerChat");         
return 1;
}
addEventHandler( "onPlayerChat", playerChat );








addCommandHandler( "stats",
	function( playerid)
	{//154
	    log(""+getPlayerName( playerid )+" start cmd stats");  
	    sendPlayerMessage( playerid, "==Статистика игрока"+getPlayerName( playerid )+"==Статистика игрока!",124,252,0);
	    sendPlayerMessage( playerid, "Убийств " +players[playerid].Killer+ " !");
		sendPlayerMessage( playerid, "Смертей " +players[playerid].Kills+ " !");
		sendPlayerMessage( playerid, "==Статистика игрока "+getPlayerName( playerid )+"==Статистика игрока!",124,252,0);
	    log(""+getPlayerName( playerid )+" End cmd stats");
	return 1;
	}
);

addCommandHandler( "randomveh",
function( playerid )
{       log(""+getPlayerName( playerid )+" start cmd randomveh");
        if(players[playerid].SpawnCars == 1) return sendPlayerMessage( playerid, "Авто можно брать 1 раз в 2 минуты",255,0,0);
        local pos = getPlayerPosition( playerid );
		if( isPointInCircle3D( pos[0], pos[1], pos[2],-574.163696, 1600.743408, -16.595583, 10.0 )) return  sendPlayerMessage(playerid,"На спавне игроков нельзя создавать транспорт") && sendPlayerMessage(playerid,"You can't create cars on spawn Somebody is staying beside you",255,0,0); // Change the 20.0 here to change the radius o
        local veh = createVehicle( random(0,53), pos[0] + 2.0, pos[1], pos[2] + 1.0, 0.0, 0.0, 0.0 );
        sendPlayerMessage(playerid,"Вам выпало авто "+getVehicleModel(veh)+" .",124,252,0 );
        players[playerid].SpawnCars = 1; 
        InvalidCars[veh] = 1;
        log(""+getPlayerName( playerid )+" end cmd randomveh");
       return 1;      
}

);
function AddVehicleEx(playerid, ...)
{   log(""+getPlayerName( playerid )+" start cmd vehicle");
	if(players[playerid].SpawnCars == 1) return sendPlayerMessage( playerid, "Авто можно брать 1 раз в 2 минуты",255,0,0); 
    if(vargv.len() != 1)  return sendPlayerMessage( playerid, "Используйте /veh id[0-54]");          
		local id = vargv[0].tostring();
		if(!isNumeric(id)) return sendPlayerMessage( playerid, "Только цифры",255,0,0 ); 
		if(id.tointeger() < 0 || id.tointeger() > 54) return sendPlayerMessage( playerid, "[Ошибка] ид авто может быть от 0 до 54",255,0,0);
		if(id.tointeger() == 2 || id.tointeger() == 49 ) return sendPlayerMessage( playerid, "[Ошибка]Запрещеный транспорт 2,49",255,0,0);
	
		local pos = getPlayerPosition( playerid );
	    if( isPointInCircle3D( pos[0], pos[1], pos[2],-574.163696, 1600.743408, -16.595583, 10.0 )) return  sendPlayerMessage(playerid,"На спавне игроков нельзя создавать транспорт") && sendPlayerMessage(playerid,"You can't create cars on spawn Somebody is staying beside you",255,0,0);
		local vehicle = createVehicle( id.tointeger(), pos[0] + 2.0, pos[1], pos[2] + 1.0, 0.0, 0.0, 0.0 );
		local colour = getVehicleColour ( vehicle );
		players[playerid].SpawnCars = 1; 
      
		InvalidCars[vehicle] = 1;
		log ( "Primary Colour: "+colour[0]+", "+colour[1]+", "+colour[2] );
		log ( "Secondary Colour: "+colour[3]+", "+colour[4]+", "+colour[5] );
		sendPlayerMessage( playerid, "Вы взяли авто ID : "+ id.tointeger() +"!",124,252,0);
		setVehicleColour ( vehicle, 255, 0, 255, 0, 255, 255 );
        log(""+getPlayerName( playerid )+" end cmd vehicle");
		 return 1;
		}		

addCommandHandler( "veh",AddVehicleEx);
addCommandHandler( "vehicle",AddVehicleEx);
addCommandHandler( "car",AddVehicleEx);
addCommandHandler( "cars",AddVehicleEx);

//local mypos = getPlayerPosition( playerid );
//if( isPointInCircle3D( mypos[0], mypos[1], mypos[2], -1551.560181, -169.915466, -18.672523, 5.0 ))
//{0;255;0
  //  sendPlayerMessage(playerid, serverMsgPrefix + ": " + "Oi! You can&#039;t spawn vehicles near this area!", 255, 255, 0 );
//}

addCommandHandler( "tune",
	function( playerid, ... )
	{   
	    log(""+getPlayerName( playerid )+" start cmd tune");
	    if(vargv.len() != 1)  return sendPlayerMessage( playerid, "Используйте /tune [0-3] (0 Снять весь тюнинг)");
		if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!",255,0,0); 
		local tune = vargv[0].tostring();
		if(!isNumeric(tune)) return sendPlayerMessage( playerid, "Только цифры",255,0,0 ); 
		if(tune.tointeger() < 0 || tune.tointeger() > 3) return sendPlayerMessage( playerid, "[Ошибка] Номер тюнинга может быть от 0 до 3",255,0,0);	
		local vehicleid = getPlayerVehicle( playerid );
		setVehicleTuningTable( vehicleid, tune.tointeger() );
	    sendPlayerMessage( playerid, "Вы установили уровень тюнинга на авто: "+getTuneLevel[tune.tointeger()][0] +" Номер "+tune.tointeger()+"!",124,252,0);
	    log(""+getPlayerName( playerid )+" end cmd tune");
	    return 1;
	}
);
addCommandHandler( "wheels",
function( playerid, ... )
	{
	    log(""+getPlayerName( playerid )+" start cmd wheels");
		if(vargv.len() != 1)  return sendPlayerMessage( playerid, "Используйте /wheels [0-18] ");
		if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!",255,0,0); 
		local w1 = vargv[0].tostring();
		if(!isNumeric(w1)) return sendPlayerMessage( playerid, "Только цифры",255,0,0 ); 
		if(w1.tointeger() < 0 || w1.tointeger() > 18) return sendPlayerMessage( playerid, "[Ошибка] Номер колёс может быть от 0 до 18",255,0,0);
		local vehicleid = getPlayerVehicle( playerid );
		setVehicleWheelTexture( vehicleid, 0, w1.tointeger() );
		setVehicleWheelTexture( vehicleid, 1, w1.tointeger() );
		sendPlayerMessage( playerid, "Вы сменили колёса на: "+ w1.tointeger() +"!",124,252,0);
	    log(""+getPlayerName( playerid )+" end cmd wheels");
	    return 1;
	}
);
addCommandHandler( "wash",
function( playerid )
{
    log(""+getPlayerName( playerid )+" start cmd Wash");
    if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!");
    setVehicleDirtLevel( getPlayerVehicle( playerid ), 0.0 );  
    sendPlayerMessage( playerid, "Вы помыли авто!");
    log(""+getPlayerName( playerid )+" end cmd wash");
    return 1;
	}
);
addCommandHandler( "dirty",
function( playerid )
{   
    log(""+getPlayerName( playerid )+" start cmd dirty");
    if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!");
    setVehicleDirtLevel( getPlayerVehicle( playerid ), 3.0 );  
    sendPlayerMessage( playerid, "Запачкали своё авто!");
    log(""+getPlayerName( playerid )+" end cmd dirty");
    return 1;
}
);
addCommandHandler( "kill",
	function( playerid )
	{
    setPlayerHealth( playerid, 0.0 );
    sendPlayerMessage( playerid, "Вы убили себя!");
	return 1;
	}
);
function fixCar(playerid)
{
    log(""+getPlayerName( playerid )+" start cmd fixcar");
    if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!"); 
	repairVehicle( getPlayerVehicle( playerid ) );
	sendPlayerMessage( playerid, "Вы починили авто!");
    log(""+getPlayerName( playerid )+" end cmd fixcar");
	return 1;
}
addEventHandler("CarFix", fixCar);

addCommandHandler( "fix",
	function( playerid )
	{
	fixCar(playerid);
	return 1;
	}
);
addCommandHandler( "heal",
	function( playerid )
	{
    setPlayerHealth( playerid, 720.0 );
	sendPlayerMessage( playerid, "Вы вылечились!");
	return 1;
	}
);
addCommandHandler( "hp",
	function( playerid )
	{
	log(""+getPlayerName( playerid )+"start cmd hp");
    setPlayerHealth( playerid, 720.0 );
	fixCar(playerid);
	sendPlayerMessage( playerid, "Вы вылечились/починили авто!");
	log(""+getPlayerName( playerid )+"end cmd hp");
	return 1;
	}
);

addCommandHandler( "siren",
	function( playerid )
	{   
	    log(""+getPlayerName( playerid )+"start cmd siren");
		local vehicle = getPlayerVehicle( playerid );
		local model = getVehicleModel ( vehicle );
		setVehicleSirenState( vehicle, !getVehicleSirenState( vehicle ) );
		sendPlayerMessage( playerid, "Вы вкл/выкл сирену !");
		log(""+getPlayerName( playerid )+"end cmd siren");
	//local pos   =      getVehiclePosition( vehicleid ) ; //Записываем координаты авто в переменную.
    ///local rot   =      getVehicleRotation( vehicleid ) ; //Записываем угол поворота авто в переменную.

 

    //setVehiclePosition( vehicleid, pos[ 0 ], pos[ 1 ], pos[ 2 ] + 1.0 ) ; //Подбрасываем авто.
       return 1;
    //setVehicleRotation( vehicleid, rot[ 0 ], rot[ 1 ], rot[ 2 ] ) ; //Устанавливаем угол поворота авто, который мы записали ранее.
	}
);
addCommandHandler( "flip",
function( playerid )
{
   if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!");
   local vehicleid = getPlayerVehicle( playerid );
   local pos   =      getVehiclePosition( vehicleid ) ; //Записываем координаты авто в переменную.
   local rot   =      getVehicleRotation( vehicleid ) ; //Записываем угол поворота авто в переменную.
   setVehiclePosition( vehicleid, pos[ 0 ], pos[ 1 ], pos[ 2 ] + 3.0 ) ; //Подбрасываем авто.
   setVehicleRotation( vehicleid, rot[ 0 ], rot[ 1 ], rot[ 2 ] ) ; //Устанавливаем угол поворота авто, который мы записали ранее.
   return 1;
}
);
 
addCommandHandler( "skin",
	function( playerid, ...)
	{//154
	    log(""+getPlayerName( playerid )+" start cmd skin");
	    if(vargv.len() != 1)  return sendPlayerMessage( playerid, "Используйте /skin id [0-154] пример /skin 5");
		if(isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вам нужно выйти с странспорта!",255,0,0); 
		for(local i = 0; i < getMaxPlayers(); i++){
		if(isPlayerConnected(i)) {
		if(playerid != i){
		local pos = getPlayerPosition(playerid); // We get the position of the player who sent the message
        local posid = getPlayerPosition(i);
		if(isPointInCircle3D( posid[0].tofloat(), posid[1].tofloat(), posid[2].tofloat(), pos[0].tofloat(), pos[1].tofloat(), pos[2].tofloat(), 50.0 )) // Change the 20.0 here to change the radius of the message
        { 
         sendPlayerMessage(playerid,"Рядом с вами кто-то есть."); 
		 sendPlayerMessage(playerid,"Скин можно менять на растояних от других игроков что бы избежать вылета"); 
         sendPlayerMessage(playerid,"========================================================================",255,0,0); 
		 sendPlayerMessage(playerid,"You can change your skin only on distance from other players to avoid kick");		 
		 return 1;
		} }}}
		local skin = vargv[0].tostring();
		if( !isNumeric(skin)) return sendPlayerMessage( playerid, "Только цифры",255,0,0 ); 
		if(skin.tointeger() < 0 || skin.tointeger() > 154) return sendPlayerMessage( playerid, "[Ошибка] Номер скина может быть от 0 до 154",255,0,0);
		if(skin.tointeger() == 119 || skin.tointeger() == 3) return sendPlayerMessage( playerid, "[Ошибка] Запрещёный скин",255,0,0);
		if(skin.tointeger() == 11 || skin.tointeger() == 111) return sendPlayerMessage( playerid, "[Ошибка] Запрещёный скин",255,0,0);
		SetPlayerSkin( playerid, skin.tointeger() );
	    sendPlayerMessage( playerid, "Ваш скин изменён на "+skin.tointeger()+"!",124,252,0);
	    log(""+getPlayerName( playerid )+" end cmd skin");
	    return 1;
	}
);
addCommandHandler( "randomwheels",
function( playerid )
{   
    log(""+getPlayerName( playerid )+" start cmd randwheels");
    local vehicleid = getPlayerVehicle( playerid );
    local kolesa = (random(0,18));
    if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вы должны быть в машине!");
	setVehicleWheelTexture( vehicleid, 0, kolesa.tointeger() );
	setVehicleWheelTexture( vehicleid, 1, kolesa.tointeger() );
    sendPlayerMessage( playerid, "Вы получили рандомные колёса!");
	log(""+getPlayerName( playerid )+" end cmd randwheels");
    return 1;
}

);
addCommandHandler( "randomskin",
function( playerid )
{   for(local i = 0; i < getMaxPlayers(); i++){
		if(isPlayerConnected(i)) {
		if(playerid != i){
		local pos = getPlayerPosition(playerid); // We get the position of the player who sent the message
        local posid = getPlayerPosition(i);
		if(isPointInCircle3D( posid[0].tofloat(), posid[1].tofloat(), posid[2].tofloat(), pos[0].tofloat(), pos[1].tofloat(), pos[2].tofloat(), 50.0 )) // Change the 20.0 here to change the radius of the message
        { 
         sendPlayerMessage(playerid,"Рядом с вами кто-то есть."); 
		 sendPlayerMessage(playerid,"Скин можно менять на растояних от других игроков что бы избежать вылета"); 
         return 1;
		} }}}
		
    log(""+getPlayerName( playerid )+" start cmd randskin");
    if(isPlayerInVehicle( playerid ) ) return sendPlayerMessage( playerid, "Вам нужно выйти с странспорта!",255,0,0); 
	local skin = (random(0,155));
	if(skin.tointeger() == 119 || skin.tointeger() == 3) return sendPlayerMessage( playerid, "[Ошибка] Попробуйте ещё раз",255,0,0);
	if(skin.tointeger() == 11 || skin.tointeger() == 111) return sendPlayerMessage( playerid, "[Ошибка] Попробуйте ещё раз",255,0,0);
	setPlayerModel( playerid, skin.tointeger() );
    sendPlayerMessage( playerid, "Вы сменили скин!",124,252,0);
    log(""+getPlayerName( playerid )+" end cmd randskin");
    return 1;
}
);

//addCommandHandler( "plate",
//function( playerid, ... )
//{
  //  if(vargv.len() != 1) return sendPlayerMessage(playerid, " Используйте: /plate [TEXT].");
   // if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage(playerid, " Вы должны быть в авто",255,0,0 );
    //local plates = vargv[0].tostring();    
    //local vehicleid = getPlayerVehicle( playerid );
    //setVehiclePlateText( vehicleid, plates );
    //sendPlayerMessage(playerid, " Вы сменили номер вашего авто на "+plates+"",124,252,0);       
//}
//);
addCommandHandler( "lockp",
	function( playerid )
	{
		togglePlayerControls ( playerid, false );
	}
);
addCommandHandler( "carpass",
function( playerid )
{
        log(""+getPlayerName( playerid )+" start cmd carpass");
        if( !isPlayerInVehicle( playerid ) ) return sendPlayerMessage(playerid, " Вы должны быть в авто",255,0,0 );
        local id = getPlayerVehicle(playerid);
        local col = getVehicleColour(id);
        sendPlayerMessage( playerid, "=======Документы на авто======",124,252,0);
        sendPlayerMessage( playerid, "ID: " + id );
        sendPlayerMessage( playerid,"Модель: " + getVehicleModel(id) );
        sendPlayerMessage( playerid,"Номер: " + getVehiclePlateText(id) );
        if(getVehicleTuningTable(id) == -2) {
		sendPlayerMessage( playerid, "Уровень тюнинга: Сток ");}else{
		sendPlayerMessage( playerid, "Уровень тюнинга: " +getTuneLevel[getVehicleTuningTable(id)][0]);}
		sendPlayerMessage( playerid,"Цвет авто RGB: " + col[0] + "," + col[1] + "," + col[2] + "," + col[3] + "," + col[4] + "," + col[5]);
		sendPlayerMessage( playerid, "=======Документы на авто======",124,252,0 );
        log(""+getPlayerName( playerid )+" end cmd carpass");
        return 1;
}
);
addCommandHandler( "unlockp",
	function( playerid )
	{   
		togglePlayerControls ( playerid, true );
	}
);
addCommandHandler( "tp",
function( playerid, ... )
{     log(""+getPlayerName( playerid )+"start cmd tp");
     if(vargv.len() != 1) return sendPlayerMessage(playerid, "Используйте: /tp название. пример /tp bruski ") &&  sendPlayerMessage(playerid, "Доступные места police,vokzal,bruski,hospital,most,park,drift,port,clementeco");
        local id = getPlayerVehicle(playerid);
        
        local place = vargv[0].tostring();
        if(isNumeric(place)) return sendPlayerMessage(playerid, "Доступные места: /tp police,vokzal,bruski,hospital,most,park,drift,port,clementeco");
		
		if( place == "police" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -364.515076, 792.584412, -19.926001);}
		else {setPlayerPosition( playerid, -364.515076, 792.584412, -19.926001 );}
     	sendPlayerMessage(playerid, "Вы телепортировались к зданию полиции ");
        sendPlayerMessageToAll( "" + getPlayerName( playerid ) + " Телепортировался к зданию полиции /tp police.",255,0,0 );
		return 1;
		}
        else if( place == "vokzal" )
        { 
		if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -574.478882, 1588.583374, -16.374985);}
		else {setPlayerPosition( playerid, -574.478882, 1588.583374, -16.374985 );}
        sendPlayerMessage(playerid, "Вы телепортировались на вокзал ");
        sendPlayerMessageToAll( "" + getPlayerName( playerid ) + " Телепортировался на вокзал /tp vokzal.",255,0,0 );
		return 1;
		}
        else if( place == "bruski" )
        {  
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -95.754532, 1728.959961, -19.155062);}
		else {setPlayerPosition( playerid, -95.754532, 1728.959961, -19.155062 );}
        sendPlayerMessage(playerid, "Вы телепортировались на свалку бруски ");   
        return 1;
		}
        else if( place == "hospital" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -396.278290, 895.201050, -19.924278);}
		else {setPlayerPosition( playerid, -396.278290, 895.201050, -19.924278 );}  
	    sendPlayerMessage(playerid, "Вы телепортировались к госпиталю ");
        }
		else if( place == "most" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -520.542603, 618.987183, 1.906049);}
		else {setPlayerPosition( playerid, -520.542603, 618.987183, 1.906049);}  
		sendPlayerMessage(playerid, "Вы телепортировались на мост");
        }
        else if( place == "park" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -330.404266, 241.278366, -4.478771);}
		else {setPlayerPosition( playerid, -330.404266, 241.278366, -4.478771);}  
		sendPlayerMessage(playerid, "Вы телепортировались в парк");
        }
		else if( place == "drift" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -625.089722, 31.567175, 1.117279);}
		else {setPlayerPosition( playerid, -625.089722, 31.567175, 1.117279);}  
		sendPlayerMessage(playerid, "Вы телепортировались на дрифт");
        }
		else if( place == "port" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, -357.145905, -743.169556, -21.526766);}
		else {setPlayerPosition( playerid, -357.145905, -743.169556, -21.526766);}  
		sendPlayerMessage(playerid, "Вы телепортировались в порт");
        }
        else if( place == "clementeco" )
        {
        if( isPlayerInVehicle( playerid ) ){setVehiclePosition( id, 40.533566, 1774.925903, -17.647997);}
		else {setPlayerPosition( playerid, 40.533566, 1774.925903, -17.647997);}  
		sendPlayerMessage(playerid, "Вы телепортировались на завод");
        }
 log(""+getPlayerName( playerid )+"end cmd tp");		
}
);
addCommandHandler( "help",
function( playerid, ... )
{        log(""+getPlayerName( playerid )+" start cmd help");
        if(vargv.len() != 1) return sendPlayerMessage(playerid, "Используйте: /help [название]. пример /help player") &&  sendPlayerMessage(playerid, "Доступные название:player [Основные команды],car [Команды для авто],key [Клавиши]");
        local help = vargv[0].tostring();
        if(isNumeric(help)) return sendPlayerMessage(playerid, "Доступные название:player [Основные команды],car [Команды для авто],key [Клавиши]");
		switch(help){
		case "player":
        {
        sendPlayerMessage(playerid, "================================Основные========================================================================",124,252,0);
		sendPlayerMessage(playerid, "/stats узнать свою статистику /kill убить себя /skin id [от 0 до 154] сменить скин /tp телепорты /randomskin получить рандомный скин  ");
		sendPlayerMessage(playerid, "/heal или /hp пополнить здоровье /gun id [от 1 до 22] взять оружие /reload зарядить оружие /veh id[от 0 до 54] взять авто  ");
		sendPlayerMessage(playerid, "/randomveh взять рандомную машину /pm id текст,отправить личное сообщение игроку");
		sendPlayerMessage(playerid, "================================Основные========================================================================",124,252,0);
        break;
		}
        case "car":
        { 
		sendPlayerMessage(playerid, "================================Команды в авто=====================================================================",124,252,0);
		sendPlayerMessage(playerid, "/veh id[от 0 до 54] взять авто,/tune id  [от 0 до 3 установить уровень тюнинга на авто] /wheels id [от 0 до 18] сменить колёса ");
		sendPlayerMessage(playerid, "/colorcar 1цвет 2цвет [сменить цвет авто пример /colorcar 0 0] /randomwheels [получить рандомные колёса ] ");
		sendPlayerMessage(playerid, "/fix или /hp [Починить авто] /wash помыть авто /carpass посмотреть документы на авто /dirty запачкать авто ");
		sendPlayerMessage(playerid, "/siren включить сирену /color сменить цвет авто в rgb");
		sendPlayerMessage(playerid, "================================Команды в авто=====================================================================",124,252,0);
        break;
		}
		case "key":
        { 
		sendPlayerMessage(playerid, "================================Клавиши=======================================",124,252,0);
		sendPlayerMessage(playerid, "F1: [Посмотреть список и иды всех авто] F5:[Починить транспорт] ");
		sendPlayerMessage(playerid, "================================Клавиши=======================================",124,252,0);
        break;
		}
     }
 log(""+getPlayerName( playerid )+" end cmd help");
	 return 1;
	 }
);
addCommandHandler( "colorcar",
    function( playerid, ... )
    {
	    log(""+getPlayerName( playerid )+"start cmd colorcar");
        if( !isPlayerInVehicle( playerid ) ) return  sendPlayerMessage( playerid, "Вы должны быть в авто." );
        if(vargv.len() != 2) return sendPlayerMessage( playerid, "/colorcar 1 цвет 2 цвет [цвета могут быть от 1 до 39] Пример: /colorcar 1 1 " ); 
		local color1 = vargv[0].tostring();
        local color2 = vargv[1].tostring();
		if( !isNumeric(color1) && !isNumeric(color2)) return sendPlayerMessage( playerid, "Только цифры",255,0,0); 
        if(color1.tointeger() < 0 || color1.tointeger() > 39 && color2.tointeger() < 0 || color2.tointeger() > 39) return sendPlayerMessage( playerid, "[Ошибка] ид авто может быть от 0 до 39",255,0,0);
		local vehicleid = getPlayerVehicle( playerid );
        setVehicleColour( vehicleid, vehicleColor[color1.tointeger()][0], vehicleColor[color1.tointeger()][1], vehicleColor[color1.tointeger()][2], vehicleColor[color2.tointeger()][0], vehicleColor[color2.tointeger()][1], vehicleColor[color2.tointeger()][2] );            
        sendPlayerMessage( playerid, "Вы сменили цвет авто "+ vehicleColor[color1.tointeger()][3] + " 2 цвет на " + vehicleColor[color2.tointeger()][3]);  
        log(""+getPlayerName( playerid )+"end cmd colorcar");
	   return 1;
	}
);

addCommandHandler( "color",
function( playerid, ... )
{   
    log(""+getPlayerName( playerid )+" start cmd color");
    if(vargv.len() != 6) return sendPlayerMessage(playerid," Используйте: /color [RGB].");
    local r1 = vargv[0].tointeger(); 
    local g1 = vargv[1].tointeger(); 
    local b1 = vargv[2].tointeger(); 
    local r2 = vargv[3].tointeger(); 
    local g2 = vargv[4].tointeger(); 
    local b2 = vargv[5].tointeger();   
    if( !isPlayerInVehicle( playerid )) return sendPlayerMessage( playerid, "Вы должны быть в авто.",255,0,0 );
    if( !isNumeric(r1) ||  !isNumeric(r2) ||  !isNumeric(g1) ||  !isNumeric(g2) ||  !isNumeric(b1) ||  !isNumeric(b2)) return sendPlayerMessage( playerid, "Используйте /color [RGB]",255,0,0 );
    local vehicleid = getPlayerVehicle( playerid );
    setVehicleColour(vehicleid, r1.tointeger(), g1.tointeger(), b1.tointeger(), r2.tointeger(), g2.tointeger(), b2.tointeger());
    sendPlayerMessage( playerid, "Вы сменили цвет авто" ,124,252,0);

    log(""+getPlayerName( playerid )+" end cmd color");
     return 1;
	 }
);
addCommandHandler( "reload",
function( playerid )
{   log(""+getPlayerName( playerid )+" start cmd reload");
    local id = getPlayerWeapon(playerid);
    givePlayerWeapon(playerid, id.tointeger(), 200 );
    sendPlayerMessage(playerid "Теперь ваше оружие полное !");
    log(""+getPlayerName( playerid )+" end cmd reload");
     return 1;
	 }
);
addCommandHandler( "gun",
function( playerid, ... )
{   
     log(""+getPlayerName( playerid )+"start cmd gun");
    if(vargv.len() != 1) return sendPlayerMessage(playerid, " Используйте /gun [ID] от 1 до 22 .",255,0,0);
    local id = vargv[0].tostring();   
    if(!isNumeric(id)) return sendPlayerMessage(playerid, " Используйте /gun [ID] от 1 до 22 .",255,0,0);
	if(id.tointeger() < 2 || id.tointeger() > 21) return sendPlayerMessage(playerid, " Используйте /gun [ID] от 2 до 22 .",255,0,0);
    givePlayerWeapon(playerid, id.tointeger(), 999 );  
    sendPlayerMessage(playerid, " Вы взяли оружие ID: "+id.tointeger()+"" ,124,252,0);
    log(""+getPlayerName( playerid )+"end cmd gun");
    return 1;	
}
);
function DelCars()
{
log( script + " Start DelCars!" );
for (local i = 25; i < MAX_VEH; i++)
{   if ((i != 1001) && (i > 25)) {
    if(InvalidCars[i] == 1) { 
    destroyVehicle( i );
	InvalidCars[i] = 0}
  }}
log( script + " End DelCars!" );
return 1;
}
function vehicleExit( playerid, veh,seat) 
{     log(""+getPlayerName( playerid )+" start vehicleExit");
      sendPlayerMessage( playerid, "Команды сервера /help" ); 
      InvalidCars[veh] = 1;   
       if (veh <= vehInfosLength) {
        vehInfos[veh][7] = false;
	  }
	  log(""+getPlayerName( playerid )+" end vehicleExit");
	  return 1;
}
addEventHandler( "onPlayerVehicleExit", vehicleExit );

function vehicleEnter( playerid, veh, seat ) 
{    log(""+getPlayerName( playerid )+" start vehicleEnter");
      sendPlayerMessage( playerid, "Команды авто./help car" ); 
      InvalidCars[veh] = 2;   
        if (veh <= vehInfosLength) {
       vehInfos[veh][7] = true;
      }
	  log(""+getPlayerName( playerid )+" end vehicleEnter");;
	  return 1;
}
addEventHandler( "onPlayerVehicleEnter", vehicleEnter );
function Reklama ()
{
RekLamaCount ++;
if (RekLamaCount == 4)
{
sendPlayerMessageToAll( "========================================HELP==========================================",255,165,0 );
sendPlayerMessageToAll( "Что бы узнать команды сервера используйте /help player , /help car , /help key ",255,165,0 );
sendPlayerMessageToAll( "Группа сервера в ВК: vk.com/mafia2serv",255,165,0);
sendPlayerMessageToAll( "========================================HELP==========================================",255,165,0 );
RekLamaCount = 0;
return 1;
}
return 1;
}

function RespPlayerCar()
{
for (local i = 0; i < MAX_PLAYERS; i++)
if (isPlayerConnected(i) && isPlayerSpawned(i))
{
if(players[i].SpawnCars == 1)
{
players[i].SpawnCars = 0;
sendPlayerMessage( i, "Теперь вы можете взять авто" ,205,0,0);
}
}
return 1;
}
function MinuteTimer()
{
RespCarCount ++;
DelCarCount ++;
if(RespCarCount == 6){
	respcar();
    sendPlayerMessageToAll("Не занятый транспорт заспавнен" ); 
    RespCarCount = 0;}
if(DelCarCount == 30){
	DelCars();
    sendPlayerMessageToAll("Не занятый транспорт удален" ); 
    DelCarCount = 0;}
   
   Reklama ();
   Time ();
return 1;
}
function secTimer ()
{
log( script + " Start secTimer!" );
    MinuteTimer();
	RespPlayerCar();
    changeWeather();
log( script + " end secTimer!" );	
return 1;
}

function Time ()
{
globalhours ++;
if (globalhours == 24)
{
globalhours = 0;
}
return 1;
}

SetWeathers <- [
    [0, "DT_RTRfoggy_day_night"],
    [1, "DT_RTRfoggy_day_night"],
    [2, "DT_RTRfoggy_day_night"],
    [3, "DT_RTRfoggy_day_night"],
    [4, "DT_RTRclear_day_night"],
    [5, "DT_RTRclear_day_early_morn1"],
    [6, "DT_RTRclear_day_early_morn1"],
    [7, "DT_RTRclear_day_early_morn1"],
    [8, "DT_RTRclear_day_early_morn1"],
    [9, "DT_RTRclear_day_early_morn1"],
    [10,"DT_RTRfoggy_day_morning"],
    [11,"DT_RTRfoggy_day_morning"],
    [12,"DT_RTRclear_day_noon"],
    [13,"DT_RTRclear_day_noon"],
    [14, "DT_RTRclear_day_afternoon"],
    [15, "DT_RTRclear_day_afternoon"],
    [16, "DT_RTRclear_day_late_afternoon"],
    [17, "DT_RTRclear_day_late_afternoon"],
    [18, "DT_RTRclear_day_evening"],
    [19, "DT_RTRclear_day_evening"],
    [20, "DT_RTRclear_day_late_even"],
    [21, "DT_RTRclear_day_late_even"],
    [22, "DT_RTRclear_day_late_even"],
    [23, "DT_RTRclear_day_night"],
    [24, "DT_RTRclear_day_night"] 	
];
function changeWeather() {
setWeather(SetWeathers[globalhours][1]);
return 1;
}
function isPlayerAdmin ( playerid )
{
   
        if ((getPlayerSerial(playerid) == "B28A7E26C78B65B4130784F77B75F1B4")) return 1;
		if ((getPlayerSerial(playerid) == "04E77C25FFF8D40A22F8E73B8D090186")) return 1;
        if ((getPlayerSerial(playerid) == "7B650A1A5BFF62630662D5AC5AD02828")) return 1;
		return 0;

}
//=======================================================Админ команды==========================================================================================
function scriptError( type, line, column, error )
{
	log( "Script Error: Type: " + type + ", Line: " + line + ", Column: " + column + ", Error: " + error );
}
addEventHandler( "onScriptError", scriptError );
function playerHealthChange( playerid, newhealth, oldhealth )
{
if (!isPlayerAdmin(playerid)) return 1;
setPlayerHealth( playerid, 720.0 );
return 1;
}
addEventHandler( "onPlayerChangeHealth", playerHealthChange );
addCommandHandler( "test",
function( playerid)
{
//if (!isPlayerAdmin(playerid)) return 1;
//DelCars();
sendPlayerMessage( playerid, "Тест цвета1." ,175,175,175); 
sendPlayerMessage( playerid, "Тест цвета2." ,255,211,155);
sendPlayerMessage( playerid, "Тест цвета3." ,0,100,0);
sendPlayerMessage( playerid, "Тест цвета4." ,124,252,0);
sendPlayerMessage( playerid, "Тест цвета5." ,255,246,143);
sendPlayerMessage( playerid, "Тест цвета6." ,255,0,0);
sendPlayerMessage( playerid, "Тест цвета7." ,205,0,0);
log(""+getPlayerSerial(playerid)+"");
return 1;
}
);
addCommandHandler( "delveh",
function( playerid)
{
if (!isPlayerAdmin(playerid)) return 1;
 if ((getPlayerSerial(playerid) == "7B650A1A5BFF62630662D5AC5AD02828")) return 1;
DelCars();
respcar();
sendPlayerMessageToAll("Пустые авто удалены" );
return 1;
}
);
addCommandHandler( "goto",
function( playerid, id )
{
if (!isPlayerAdmin(playerid)) return 1;
local pos = getPlayerPosition(id.tointeger());
setPlayerPosition(playerid, (pos[0]+1).tofloat(), (pos[1]+1).tofloat(), (pos[2]).tofloat());
sendPlayerMessage( playerid, "Вы переместились к игроку." ); 
}
);
addCommandHandler( "get",
function( playerid, id )
{
if (!isPlayerAdmin(playerid)) return 1;
local pos = getPlayerPosition(playerid.tointeger());
setPlayerPosition(id.tointeger(), (pos[0]+1).tofloat(), (pos[1]+1).tofloat(), (pos[2]).tofloat());
sendPlayerMessage( id.tointeger(), "Вы были телепортированы администратором Criminal_America." ); 
}
);//getPlayerName(playerid)
addCommandHandler( "kick",
function( playerid, ...)
{
if (!isPlayerAdmin(playerid)) return 1;
if(vargv.len() != 1) return sendPlayerMessage(playerid, "Используйте: /kick id [0-20] ");
local id = vargv[0].tostring();
if(!isNumeric(id)) return sendPlayerMessage(playerid, "Только цифры");
if (!isPlayerSpawned(playerid)) return 1;
sendPlayerMessage(playerid, "Игрок кикнут");
kickPlayer(id.tointeger());
return 1;
}
);
addCommandHandler( "ban",
function( playerid, ... )
{
if (!isPlayerAdmin(playerid)) return 1;
if ((getPlayerSerial(playerid) == "7B650A1A5BFF62630662D5AC5AD02828")) return 1;
if(vargv.len() != 1) return sendPlayerMessage(playerid, "Используйте: /ban id [0-20] ");
local id = vargv[0].tostring();
if(!isNumeric(id)) return sendPlayerMessage(playerid, "Только цифры");
banSerial( getPlayerSerial(id.tointeger()),id.tointeger(), 300000000, "ban" );
kickPlayer( id.tointeger() );
return 1;

}
);
addCommandHandler("cc",
function( playerid ) 
{
if (!isPlayerAdmin(playerid)) return 1;  
for( local i = 0; i <= 10; ++i ){
sendPlayerMessageToAll( " " );}
sendPlayerMessageToAll( "Общий чат был отчищен администратором!" );
return 1;
}
);
addCommandHandler("starttime",function( playerid ) {
if (!isPlayerAdmin(playerid)) return 1;  
if ((getPlayerSerial(playerid) == "7B650A1A5BFF62630662D5AC5AD02828")) return 1;
secTimers = timer(secTimer,60*2000, -1);
sendPlayerMessage(playerid, "Таймер запущен");
return 1;});
addCommandHandler("killtime",function( playerid ) {
if (!isPlayerAdmin(playerid)) return 1;  
if ((getPlayerSerial(playerid) == "7B650A1A5BFF62630662D5AC5AD02828")) return 1;
secTimers.Kill( );
sendPlayerMessage(playerid, "АПАСНОСТЬ АПВА ТАЙМЕР УБИТ НЕ ДВИГАЙСЯ А ТО ТЛЕН");
return 1;});
addCommandHandler( "settime",function( playerid, ...  ){
if (!isPlayerAdmin(playerid)) return 1;
if ((getPlayerSerial(playerid) == "7B650A1A5BFF62630662D5AC5AD02828")) return 1;
if(vargv.len() != 1) return sendPlayerMessage(playerid, "Используйте: /settime время [0-23] ");
local time = vargv[0].tostring();
if(!isNumeric(time)) return sendPlayerMessage(playerid, "Только цифры");
globalhours = time.tointeger();
changeWeather();
return 1;});

addCommandHandler( "unlock",
function( playerid )
{
    togglePlayerControls ( playerid, true );
    sendPlayerMessage(playerid, "Не мороси", 25, 135, 235 );
}
);