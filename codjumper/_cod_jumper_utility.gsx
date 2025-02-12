/*#include codjumper\_cj_utility;
#include common_scripts\utility;
#include emz\_hud;

waitHudRefresh()
{
  self endon("disconnect");
  if(self.pers["team"] != "spectator")
    self thread playerHUDLoop();

  while(1)
  {
    self waittill("refresh_huds");
    if(self.pers["team"] != "spectator")
      self thread playerHUDLoop();
    else if(self.pers["team"] == "spectator")
        self thread spectatorHUDLoop();
  }
}

setupDefaults()
{
    self waittill("spawned");
    while(!isDefined(self.cj) || !isDefined(self.cj["hud"])) wait 0.05;
    self.client_fps = int(getmaxfps());
    self thread waitHudRefresh();
    self thread updateClientVars();
}

updateClientVars() 
{
  self endon("disconnect");
  for (;;) 
  {
      wait .05;
      self.client_fps = int(getmaxfps());
      self.deaths = self.client_fps;
  }
}

hudGlow()
{
    self.color = (1, 1.0, 0.8);
    self.font = "default";
    self.glowColor = (256,150,150);
    self.glowAlpha = 1;
}

updateHUDonChange(oldvalue, newvalue, hudElement)
{
  if(isDefined(hudElement) && oldvalue != newvalue)
  {
    hudElement setValue(newvalue);
  }
  return newvalue;
}

destroyPlayerHUDs()
{
    self endon( "disconnect" );

    if (isDefined(self.cj["hud"]["fps"])) self.cj["hud"]["fps"] thread FadeOut(0.2);
    else if(isDefined(self.cj["hud"]["specfps"])) self.cj["hud"]["specfps"] thread FadeOut(0.2);
}

playerHUDLoop()
{
  self endon( "disconnect" );
  self endon( "joined_spectators" );
  self endon( "refresh_huds");
  self destroyPlayerHUDs();
  
   self.cj["hud"]["fps"] = addTextHud(self, 0, -187, 1 , "center", "middle", "center","middle",2.5,0);
   self.cj["hud"]["fps"].hidewheninmenu = 1;
   self.cj["hud"]["fps"] setValue(self.client_fps);
	
  last_fps = self.client_fps;
  while(1)
  {
    while(last_fps == self.client_fps)
	{
      wait .05;
    }
    last_fps = self updateHUDonChange(last_fps , self.client_fps , self.cj["hud"]["fps"]);
    wait 0.05;
  }
}

updateSpecHud(newValue, hudElement)
{
    if(isDefined(hudElement)) hudElement setValue(newValue);
    return newValue;
}

spectatorHUDLoop()
{
    self endon("disconnect");
    self endon("joined_team");
    self endon("refresh_huds");
    self destroyPlayerHUDs();
    
    self.cj["hud"]["specfps"] = addTextHud(self, 0, -187, 1 , "center", "middle", "center", "middle", 2.5, 0);
    self.cj["hud"]["specfps"].hidewheninmenu = 1;
    handleMeleeEvent();
    playerHUDLoop();
}

handleMeleeEvent()
{
    self endon("disconnect");
    self endon("joined_team");
    self endon("melee_pressed");
    for(;; wait 0.05) self.cj["hud"]["specfps"] setValue(self getSpectatorFPS());
}

addTextHud( who, x, y, alpha, alignX, alignY, horiz, vert, fontScale, sort ) 
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();
	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.sort = sort;
	hud.alignX = alignX;
	hud.alignY = alignY;
	if(isdefined(vert))
		hud.vertAlign = vert;
	if(isdefined(horiz))
		hud.horzAlign = horiz;
	if(fontScale != 0)
		hud.fontScale = fontScale;
	hud.foreground = 1;
	hud.archived = 0;
	return hud;
}

fadeOut(time)
{
	if(!isDefined(self)) return;
	self fadeOverTime(time);
	self.alpha = 0;
	wait time;
	if(!isDefined(self)) return;
	self destroy();
}*/