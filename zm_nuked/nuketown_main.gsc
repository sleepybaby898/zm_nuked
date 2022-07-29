#include maps\mp\_utility;
#include maps\mp\_visionset_mgr;
#include maps\mp\_music;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\gametypes_zm\_gv_actions;
#include maps\mp\gametypes_zm\_damagefeedback;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_audio;
#include maps\mp\animscripts\zm_combat;
#include maps\mp\animscripts\zm_utility;
#include maps\mp\animscripts\utility;
#include maps\mp\animscripts\shared;
#include maps\mp\zombies\_zm_game_module;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\zombies\_zm_sidequests;
#include maps\mp\zombies\_zm_tombstone;
#include maps\mp\zombies\_zm_chugabud;
#include maps\mp\zombies\_zm_perk_electric_cherry;
#include maps\mp\zm_nuked_perks;

#include scripts\zm\zm_nuked\stuff\watcher;
#include scripts\zm\zm_nuked\stuff\machines;
#include scripts\zm\zm_nuked\stuff\generators;
#include scripts\zm\zm_nuked\config;
#include scripts\zm\zm_nuked\stuff\counter;
#include scripts\zm\zm_nuked\stuff\bunker;

main()
{
    scripts\zm\gametype_setup::add_struct_location_gamemode_func( "zstandard", "nuked", scripts\zm\zm_nuked\stuff\machines::struct_init );
    if(getdvar("enable_perks") == "1") {
        replaceFunc(maps\mp\zm_nuked_perks::init_nuked_perks, ::init_nuked_perks_nothing);
        replaceFunc(maps\mp\zm_nuked_perks::perks_from_the_sky, ::perks_from_the_sky_nothing);
    }
}

init()
{
    if( getdvar("start_weap") != "0") {
        level.start_weapon = getdvar("start_weap"); 
    }
    level.zombie_weapons["ray_gun_zm"].is_in_box = false;
    level.zombie_weapons["raygun_mark2_zm"].is_in_box = false;
    level.zombie_weapons["m32_zm"].is_in_box = false;
    iprintln("Nuketown - Custom by SLU");
    thread init_special();
    thread scripts\zm\zm_nuked\stuff\generators::gen_init();
    thread scripts\zm\zm_nuked\stuff\watcher::watcher_init();
    thread scripts\zm\zm_nuked\stuff\mark2::frame_init();
    thread scripts\zm\zm_nuked\stuff\counter::onPlayerConnect();
    thread scripts\zm\zm_nuked\stuff\bunker::bunker_think();
}

init_special()
{
    if(GetDvar("enable_mannequins") == "1") {
        mannequincounter();
    }
}
mannequincounter()
{
    self endon("disconnect");
    level endon("end_game");
    level waittill( "start_of_round" );

    setdvar("timerhudshow", "1");

    timer_hud = createserverfontstring("hudsmall" , 1.4);
	timer_hud setPoint("TOPLEFT", "TOPLEFT", 0, 20);					
	timer_hud.alpha = 1;
	timer_hud.color = (1, 0.6, 0.2);
	timer_hud.hidewheninmenu = 1;
    timer_hud.label = &"Remaining Mannequins: ";

    while (True)
    {
        if (getdvar("timerhudshow") == "1") {
            timer_hud setValue(level.mannequin_count);
            wait 0.05;
        } else {
            timer_hud destroy();
            break;
        }
    }
}


init_nuked_perks_nothing() {
    print("lol");
}

perks_from_the_sky_nothing() {
    print("lol");
}