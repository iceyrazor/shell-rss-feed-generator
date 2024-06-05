# my time using linux
### subject to change
> <DATE_POST>

theres alot. and i have trouble remembering things. this article will probly be reposted a few times.

so. for a month or two, i dont remember. i used linux as my main os on my pc for awhile and tried gaming on it. and BOY let me tell you. i had a hell of a time getting some games to work. some didnt. some ran just fine. and vr didnt really look at all.

before i begin. let me just start with my specs. and my setup

---

### specs
- 16gb ram ddr3 2667 MHz
- Nvidia GeForce GTX 1660 Super 14GB mem
- AMD Ryzen 5 3600 6-Core Processor 3.6 GHz


### and now the os i chose
- os: arch linux (and i tried lts. abit more later)
- WM: dwm. (mental outlaws rice with the taskbar)
- login thing idk: light dm (only on my VM)
- driver: nvidias propiatairy driver. amd-ucode

### extra software
- pipewire-alsa pipewire-jack pipewire-pulse qpwgraph

i LOVE qpwgraph

---


# the story
i decided to do arch linux as i found it cool installing it yourself and learning it. and i had allready been using basically the same setup in a virtualbox vm for awhile and had gotten used to using it. i didnt decide to use it right off the bad. i had the opertunity to get a nice nvme drive for half off or cheaper and decided to try linux. i dont like the way windows is going with its super privicy invasive updates. like recall.

---

### tech fwiend :)
i also have a friend to help with alot of my linux issues that also used arch. buut they used kde. and dont know how to manually configure stuff very well. tho they did help alot. ill refer to him as caleb in this post.

---

# dpi
i did my installation and that went well. but then i ran into my first issue. my taskbar took up 15% of my vertical space and **everything** was scaled up to big. caleb suggeset and at the same time i googled and got 'change your dpi'. so i did that with xrandr. i set up a auto script with dwms autostart so it happens after dwm starts. to set my dpi with xrandr. instead of being in .xinitrc 

# dpi and underscan
then another issue. when i reboot. it still scaled weirdly. the bar would be waaay to small but my dpi was correct. so when i booted in. id have to startx, witch starts dwm. stop it. then start dwm again. and it was fine. then i discoverd another issue. *yay*. i was using a dual monitor setup and when i moved my mouse all the way to the right of the screen. then further. everything would shift left off the screen. and if i move left then further it reset. this shift was determined by nvidia-settings underscan setting. as my second monitor had to have this else it went off the screen. 

## the fix
i fixed this by instead of setting my dpi in xrandr. i did it in nvidias config settings. this fixed the underscan issue, and me having to restart dwm after logging in.

---

# picom lag
i use picom on the main repo. and randomly. i would get alot of desktop lag. typically after it being on for awhile. but i just dont run it as much. especially while in a game. not a big deal.

---

# vr
i also tried running vr with alvr. the same software i use on windows for vr. i have a quest 2 from 2020. i had to turn down the settings quite a bit. i had **ALOT** of lag when i first tried getting it to work. i downloaded some more drivers. mesa i think. tried different settings. unplugged my second monitor. nothing worked. and i think it was steam. i would get the periodic freezes for about less than a quarter of a second. around 90ms, that happened at least 6 times a second. it was enough to make me nauseous. but it only happened when i moved in real life. or i used ovr advanced settings to move my play space around. so i do think it was steam. and not the vr streamer. it could be do to the drivers. or just linux not liking my pc. but it was steam.

i also had general lag that would happen ingame without me moving that was less noticable than the above mentioned. but was worse than running on windows.
through tweaks i was able to mitigate this quite a bit but never stopped it. i did try kde with wayland, no change.
i have not tried other drivers and may try them to see if they do any better.

i did try getting help about this in the ALVR discord. and a little bin in the archlinux discord to no avial. google search has been really bad for me so alot of the things i did try didnt work. aside from using a different distro

---

# audio
i got on and off, audio breakage that sounded like a robot dieng, sorta on and off. it happened more often the more things there were in qpwgraph. i later mostly fixed this on my same setup on my lapot by changes the bitrate among other pipewire related settings

---

# vseeface
vseeface is a vtubing software that i use. it works well on windows. linux. it works fine but i had todo some weird stuff to get it to work. as the linux section on their website suggest, you have to download the tracking software seperately. but its super simple. the issue i had is wine. you have to run vseeface through wine. when i started it normally. if i switched desktops, or clicked on a window on a different screen, then clicked back. the entire thing would be unclickable. it wouldnt freeze. i had to run wine with virtual mode where it has a small virtual enviroment. i forget what its called. but its akin to a vm. and this worked for awhile. a few weeks?

then, wine updated and it stopped working. id load up the software, select my model. and my console would be spammed with ``01c0:err:d3d:wined3d_debug_callback 0000711D07C6D220: "GL_INVALID_OPERATION error generated. Texture is immutable.".``. so frustating.

### vseeface fix
i mangaed to fix this by adding vseeface as a steam game and running it through steams proton instead of just wine

---

# games
so the final nail in the coffin for me was games. so i first before anything. downloade steam. then changes. a top down 2d game make in game maker about escaping a facility without becoming a feral anthro furry. its fun for me and i like replaying it. in 2 levels of this game it **droped to 3 fps** in some areas where in windows there is NO LAG. and in this game there is a slight, probably intentional, input delay. so frames **MATTER**. i was able to mitigate this using proton-ge. but seldomly so.

## more pc lag in games :,)
sky children of the light is a simple game about freeing spirits, collecting candles to unlock emotes, and making friends. randomly. seemingly for no reason. i would get quarter to half a second frame freezes that happened fully random. but consistant. i thought it could be temps? no gpu temps are 30-40C. iz chill. i felt it and its been hotter. drivers? probly. cable? could be. not a issue on windows. this lagg was **far** worse in java edition minecraft with optifine. and also embeddium.

but the lag was my second monitor. my monitors a different refresh rates and linux doesnt like that. or xorg doesnt like it.

the gpu has 1 hdmi and 2 dpi ports. for my second monitor, i used a dpi to hdmi cable. its apart of the cable not an adapter and its one way. all i did was plug that cable into my primary monitor and use the hdmi to hdmi cable on my secondary and weirdly that mostly fixed it. i was able to play sky and minecraft mostly fine. in terms of fps. minecraft actually seemed to do better in this reguard.

### but it wasnt finished.
i still on and off got small lag but not nearly as bad. one thing someone suggested was to add
```
__GL_SYNC_DISPLAY_DEVICE=DP-1
__GL_GSYNC_ALLOWED=0
__GL_SYNC_TO_VBLANK=0

KWIN_X11_REFRESH_RATE=59940
KWIN_X11_NO_SYNC_TO_VBLANK=1
```
to enviroment variables. i did this and disabled force full composit in nvidia-settings and it seemd to help. reguardless of force full composit being on or off.

and that mostly fixed it.

# asseto corsa
i did get asseto corsa working with content manager by using resources provided on protondb. but boy was it a bit much. not to bad though.

# doom eternal
i tried doom from steam and it ran mostly fine. it did have lag that made the game annoying to play that i couldnt quit tweak out. i wasnt that invested in getting that to work at the time.

# space engineers
the final game. that made me switch back to windows, was space engineers. i tried downloading the game. choosing proten ge. and playing it. and it ran fine. i loaded into the game. and after a minutite. crash to desktop no warning. i joined a server instead of my modded solo game. crash after few minutes. tweaked settings. deleted my settings. joined the official keen server and did a the fixes listed in pinned messages in their linux channel, because they didnt show it on proton db. nothing. i looked through se's normal and graphics logs. nothing. just some missing texture warnings but said textures loaded fine in game. i even turned PROTON_LOG=1 in args for the game to get assembly output for it and. a warning about a missing lib. gst-dirty or somthing like that. i installed it. still crash. i tried all of this over 3 days. and then i gave up. i went back to windows (only to not play the game lol) because i was fed up with all of this.

---

# conclusion
linux is great for alot of things and gaming has come a long way. but gaming is too tedious for me to use. and i suggested to my friends to try it but i also listed off the isses i had and they cant be bother to deal with this either. i still use it on my repurposed debian server, and my same setup archlinux laptop, and a arch linux vm for c programming and RSync. **GOD i love rsync**. and i love the enviroment alot better. but gaming i too tedious for me to use, and vr is a big deal breaker for me. ill stick with windows 10, atleast for now.


check out my config files if you want to here [https://github.com/iceyrazor/iceys-linux-stuffs](https://github.com/iceyrazor/iceys-linux-stuffs)
