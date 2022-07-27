#include maps\mp\zombies\_zm_game_module;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_zonemgr;
#include maps\mp\zombies\_zm_weapons;
// this script does exactly the name. it watches. this script is in your walls.
// jokes but it watches for things like the population and the mannequin count etc

watcher_init() {
	level waittill("connected", player); // HAS to be done after player spawns
    if(getdvar("the_watcher") == "1") {
        if(getdvar("enable_mannequins") == "1") {
            while (true)
            {
                if (level.mannequin_count <= 0)
                {
                    iprintln("You collected all the mannequins! All players' get ray gun!");
                    setdvar("timerhudshow", "0");
                    foreach(player in level.players)
                    {
                        cur = player getCurrentWeapon();
                        player takeWeapon(cur);
                        player maps\mp\zombies\_zm_weapons::weapon_give("ray_gun_zm", 0, 0, 0);
                    }
                    level notify ("cominghome_activated");
                    break;
                }
                wait 0.05;
            }
        }
    }
}