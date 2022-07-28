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

#include scripts\zm\zm_nuked\stuff\mark2melt;


frame_init() {
    for(;;) {
        if(getdvar("timerhudshow") == "0") {
            player.framepickedup = 0;
            player.melteddown = 0;
            position = (719.192, 328.28, 91.2964);

            trigger = spawn("trigger_radius", position, 1, 30, 30);
            trigger setcursorhint("HINT_ACTIVATE", trigger);
            trigger sethintstring("Press ^3&&1^7 to pick up the MK II mould.");
            trigger setvisibletoall();

            wait(1);

            for(;;) {
                trigger waittill("trigger", player);
                if(player UseButtonPressed()) {
                    player.framepickedup = 1;
                    iprintln("The mould was picked up");
                    trigger delete();
                    thread scripts\zm\zm_nuked\stuff\mark2melt::melt();
                    break;
                }
                wait 0.05;
            }
        }
        wait 0.05;
    }

}

// maps/zombie/fx_zmb_nuke_reentry