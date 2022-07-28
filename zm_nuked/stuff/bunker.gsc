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

bunker_think() {
    pos = (-1334, 1034, -73);
    trigger = spawn("trigger_radius", pos, 1, 30, 30);
    
    trigger setcursorhint( "HINT_ACTIVATE", trigger );
    trigger sethintstring( "Press ^3&&1^7 to buy the bunker escape (Costs 50000)" );

    trigger setvisibletoall();

    wait(1);

    for(;;)
    {   
        trigger waittill("trigger", player);
        printf("collision");
        if (player UseButtonPressed()) {
            if(player.score >= 50000) {
                // end game
                player.score = player.score - 50000;
                trigger delete();
                iprintln("You enter the bunker, and contact the USSR to drop a nuke to kill all the zombies.");
                wait(5);
                level notify("end_game");
            } else {
                player iprintln("Come back when you have 50k score.");
            }
        }
        wait 0.05;
    }
}