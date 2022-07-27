#include maps\mp\zombies\_zm_game_module;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_zonemgr;

init()
{   
    level thread onplayerconnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
	self endon( "disconnect" );
	self waittill( "spawned_player" );
    self thread getPlayerPos(); // MADE BY SLU
}

getPlayerPos() // FUNCTION BY SLU 
{
    self endon("disconnect");
    for(;;)
    { 
        if (self ActionSlotOneButtonPressed()) {
            self.o = self.origin;
            self.a = self.angles;
            
            self iprintlnbold(self.o + " angles: " + self.a);
        }
        wait 0.05;
    }

} // u can probably remove the comments but FUNCTION BY SLU