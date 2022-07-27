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

melt() {
    for(;;) {
        if(player.framepickedup == 1 && getdvar("power") == "1") {
            trig = spawn("trigger_radius", (-897, 713, -68), 1, 30, 30);
            trig setcursorhint("HINT_ACTIVATE", trig);
            trig sethintstring("Press ^3&&1^7 to melt down the .115 out of your raygun.");
            trig setvisibletoall();
            trig waittill("trigger", player);
            if(player UseButtonPressed()) {
                player.melteddown = 1;
                iprintln("The 115 melted down. You pour it into the mould.");
                player PlaySound("zmb_powerup_grabbed");
                wait 1;
                foreach(player in level.players) {
                    cur = player getCurrentWeapon();
                    player takeWeapon(cur);
                    player maps\mp\zombies\_zm_weapons::weapon_give("raygun_mark2_zm", 0, 0, 0);
                }
                iprintln("You got the mark 2!");
                trig delete();
            }
        }
        wait 0.05;
    }
}