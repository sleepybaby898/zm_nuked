#include maps\mp\zombies\_zm_game_module;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_zonemgr;


struct_init() // if you add your own perks remember to add +90 to the angles, otherwise it faces the wrong way
{
    if(GetDvar("enable_perks") == "1") {
        scripts\zm\gametype_setup::register_perk_struct( "specialty_armorvest", "zombie_vending_jugg", (0, -113 + 90, 0), (-1796.15, 660.358, -44.985));
        scripts\zm\gametype_setup::register_perk_struct( "specialty_quickrevive", "zombie_vending_quickrevive", (0, -87.7253 + 90, 0), (-38.1109, 1023.68, -63.1683));
        scripts\zm\gametype_setup::register_perk_struct( "specialty_fastreload", "zombie_vending_sleight", ( 0, -77.3633 + 90, 0 ), ( 956.101, 751.765, -56.875 ) );
        scripts\zm\gametype_setup::register_perk_struct( "specialty_rof", "zombie_vending_doubletap2", ( 0, -96.3025 + 90, 0 ), ( -583.796, 609.513, 90.6994 ) );
        scripts\zm\gametype_setup::register_perk_struct( "specialty_weapupgrade", "p6_anim_zm_buildable_pap_on", (0, 104.9 + 90, 0), (912.493, 173, 79.125)); // yellow
        scripts\zm\gametype_setup::register_perk_struct( "specialty_armorvest", "zombie_vending_jugg", (0, -154 + 90, 0), (1983.66, 499.24, -63.7582)); // yellow
    }
    // easter egg
    pos = (1211.94, 118.489, -51.9925);
    trigger = spawn("trigger_radius", pos, 1, 30, 30);
    
    trigger setcursorhint( "HINT_ACTIVATE", trigger );
    trigger sethintstring( "Some say he's still searching.." );

    trigger setvisibletoall();
}
