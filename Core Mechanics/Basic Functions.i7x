Version 1 of Basic Functions by Core Mechanics begins here.
[Version 1 - Pulled Together into its own file]
"Basic Functions of the Flexible Survival game"

To change the current menu to (X - table name):
	now the current menu is x;

to clear the screen and hyperlink list:
	clear the screen;
	now invlinklistfilled is zero; [this changes the inventorying mode to not look for existing inventory links again]
	now hyperlink list is {};
[This must remain whole or errors from cleared hyperlinks can occur!]

To say row of (N - number) spaces: (- spaces {N}; -).

To decide what indexed text is (orig - text) formatted to (len - number) characters:
	let T be an indexed text;
	now T is orig;
	let N be the number of characters in T;
	if N < len:
		repeat with Z running from 1 to len - N:
			now T is "[T] ";
	else if N > len:
		replace the regular expression ".{[N - len]}$" in T with "";
	decide on T.

To keypause:
	(- KeyPause(); -)

To say a/an (T - text):
	let Txt be indexed text;
	let Txt be T;
	if Txt matches the regular expression "^<aeiouAEIOU>":
		say "an ";
	else:
		say "a ";
	say T.

Instead of sniffing something (called x):
	if the scent of x is empty:
		say "It smells pretty normal for a/an [x].";
	else:
		say "[scent of x][line break]";

To wait for any key:
	if hypernull is 0:
		say "[link]more[as] [end link][run paragraph on][line break]";
	keypause;
	if hypernull is 0:
		LineBreak;

to say WaitLineBreak: [little bit of often used code]
	if waiterhater is 0: [skips waiting if it's not wanted]
		wait for any key;
		if hypernull is 0, LineBreak; [adds a break after the 'more']
	else:
		LineBreak; [people who don't want to wait at least get a break]

to WaitLineBreak: [little bit of often used code]
	if waiterhater is 0: [skips waiting if it's not wanted]
		wait for any key;
		if hypernull is 0, LineBreak; [adds a break after the 'more']
	else:
		LineBreak; [people who don't want to wait at least get a break]

to LineBreak:
	say "[line break]";

to HungerReset:
	LineBreak;
	say "     [bold type]Your hunger is gone![roman type][line break]";
	now hunger of Player is 0;

to PlayerEat (N - number):
	LineBreak;
	say "     [bold type]Your hunger is reduced by [N]![roman type][line break]";
	decrease hunger of Player by N;
	if hunger of Player < 0:
		now hunger of Player is 0;

to PlayerHunger (N - number):
	LineBreak;
	say "     [bold type]Your hunger has increased by [N]![roman type][line break]";
	decrease hunger of Player by N;
	if hunger of Player < 0:
		now hunger of Player is 0;

to ThirstReset:
	LineBreak;
	say "     [bold type]Your thirst is gone![roman type][line break]";
	now thirst of Player is 0;

to PlayerDrink (N - number):
	LineBreak;
	say "     [bold type]Your thirst is reduced by [N]![roman type][line break]";
	decrease thirst of Player by N;
	if thirst of Player < 0:
		now thirst of Player is 0;

to PlayerThirst (N - number):
	LineBreak;
	say "     [bold type]Your thirst has increased by [N]![roman type][line break]";
	increase thirst of Player by N;

to PlayerMaxHeal:
	LineBreak;
	say "     [bold type]Your hitpoints are completely restored![roman type][line break]";
	now HP of Player is maxHP of Player;

to PlayerHealed (N - number):
	LineBreak;
	say "     [bold type]Your hitpoints increase by [N]![roman type][line break]";
	increase HP of Player by N;
	if HP of Player > maxHP of Player:
		now HP of Player is maxHP of Player;

to PlayerWounded (N - number): [wounded, not killed - this won't kill a player]
	LineBreak;
	say "     [bold type]Your hitpoints are reduced by [N]![roman type][line break]";
	decrease HP of Player by N;
	if HP of Player < 0:
		now HP of Player is 0;

to SanLoss (N - number):
	LineBreak;
	say "     [bold type]Your sanity has decreased by [N]![roman type][line break]";
	decrease humanity of Player by N;

to SanBoost (N - number):
	LineBreak;
	say "     [bold type]Your sanity has increased by [N]![roman type][line break]";
	increase humanity of Player by N;
	if humanity of Player > 100:
		now humanity of Player is 100;

to SanReset:
	LineBreak;
	say "     [bold type]Your sanity is completely restored![roman type][line break]";
	now humanity of Player is 100;

to LibidoLoss (N - number):
	LineBreak;
	say "     [bold type]Your libido has decreased by [N]![roman type][line break]";
	decrease Libido of Player by N;
	if Libido of Player < 0:
		now Libido of Player is 0;

to LibidoBoost (N - number):
	LineBreak;
	say "     [bold type]Your libido has increased by [N]![roman type][line break]";
	increase Libido of Player by N;
	if Libido of Player > 100:
		now Libido of Player is 100;

to LibidoReset:
	LineBreak;
	say "     [bold type]Your libido is completely gone![roman type][line break]";
	now Libido of Player is 0;

to ScoreLoss (N - number):
	LineBreak;
	say "     [bold type]Your score has decreased by [N]![roman type][line break]";
	decrease the score by N;

to ScoreGain (N - number):
	LineBreak;
	say "     [bold type]Your score has increased by [N]![roman type][line break]";
	increase the score by N;

to CreditLoss (N - number):
	LineBreak;
	say "     [bold type][N] freecred [if N is 1]has[else]have[end if] been deducted from your Zephyr account![roman type][line break]";
	decrease freecred by N;

to CreditGain (N - number):
	LineBreak;
	say "     [bold type][N] freecred [if N is 1]has[else]have[end if] been added to your Zephyr account![roman type][line break]";
	increase freecred by N;

to FeatLoss (Featname - text):
	LineBreak;
	if Featname is listed in feats of Player:
		say "     [bold type][Featname] has been removed from your feats![roman type][line break]";
		remove Featname from feats of Player;
	else if debugactive is 1:
		say "ERROR: Trying to remove [Featname], which the player does not have.";

to FeatGain (Featname - text):
	LineBreak;
	if Featname is not listed in feats of Player:
		say "     [bold type][Featname] has been added to your feats![roman type][line break]";
		add Featname to feats of Player;
		sort feats of Player;
	else if debugactive is 1:
		say "ERROR: Trying to add [Featname], which the player already has.";

to MoraleLoss (N - number):
	LineBreak;
	say "     [bold type]Your morale has decreased by [N]![roman type][line break]";
	decrease morale of Player by N;

to MoraleBoost (N - number):
	LineBreak;
	say "     [bold type]Your morale has increased by [N]![roman type][line break]";
	increase morale of Player by N;
	if morale of Player > 100:
		now morale of Player is 100;

understand "testNPCSexAftermath" as NPCSexAftermathAction.

NPCSexAftermathAction is an action applying to nothing.

carry out NPCSexAftermathAction:
	say "Testing: Carl fucks player:";
	NPCSexAftermath Player receives "AssFuck" from Carl;
	say "Testing: Player fucks Carl:";
	NPCSexAftermath Carl receives "AssFuck" from Player;
	[Options for SexAct are: AssFuck, PussyFuck, AssDildoFuck, PussyDildoFuck, OralCock, OralPussy]


[ Note: Add Handjob, PussyFingering, AssFingering, Rimming to SexActs]

to NPCSexAftermath (TakingChar - a person) receives (SexAct - a text) from (GivingChar - a person):
	if GivingChar is player:
		if debugactive is 1:
			say "DEBUG -> Player is the giving partner[line break]";
		if PlayerFucked of TakingChar is false: [player never had sex with this NPC]
			now PlayerFucked of TakingChar is true; [player sexed up this NPC]
		if SexAct is "AssFuck":
			if PenileVirgin of Player is true:
				now PenileVirgin of Player is false;
				say "     [Bold Type]You have lost your penile virginity fucking [TakingChar]![roman type][line break]";
			if AnalVirgin of TakingChar is true:
				now AnalVirgin of TakingChar is false;
				say "     [Bold Type]You have taken [TakingChar]'s anal virginity![roman type][line break]";
				add printed name of TakingChar to AnalVirginitiesTaken of Player;
		else if SexAct is "PussyFuck":
			if PenileVirgin of Player is true:
				now PenileVirgin of Player is false;
				say "     [Bold Type]You have lost your penile virginity fucking [TakingChar]![roman type][line break]";
			if Virgin of TakingChar is true:
				now Virgin of TakingChar is false;
				say "     [Bold Type]You have taken [TakingChar]'s virginity![roman type][line break]";
				add printed name of TakingChar to VirginitiesTaken of Player;
		else if SexAct is "PussyDildoFuck":
			if Virgin of TakingChar is true:
				now Virgin of TakingChar is false;
				say "     [Bold Type]You have taken [TakingChar]'s virginity![roman type][line break]";
				add printed name of TakingChar to VirginitiesTaken of Player;
		else if SexAct is "AssDildoFuck":
			if AnalVirgin of TakingChar is true:
				now AnalVirgin of TakingChar is false;
				say "     [Bold Type]You have taken [TakingChar]'s anal virginity![roman type][line break]";
				add printed name of TakingChar to AnalVirginitiesTaken of Player;
		else if SexAct is "OralCock":
			if OralVirgin of TakingChar is true:
				now OralVirgin of TakingChar is false;
				say "     [Bold Type]You have taken [TakingChar]'s oral virginity![roman type][line break]";
				add printed name of TakingChar to OralVirginitiesTaken of Player;
		else if SexAct is "OralPussy":
			if OralVirgin of TakingChar is true:
				now OralVirgin of TakingChar is false;
				say "     [Bold Type]You have taken [TakingChar]'s oral virginity![roman type][line break]";
				add printed name of TakingChar to OralVirginitiesTaken of Player;
	else if TakingChar is player:
		if debugactive is 1:
			say "DEBUG -> Player is the receiving partner[line break]";
		if PlayerFucked of GivingChar is false: [player never had sex with this NPC]
			now PlayerFucked of GivingChar is true; [player sexed up this NPC]
		if SexAct is "AssFuck":
			if AnalVirgin of Player is true:
				now AnalVirgin of Player is false;
				say "     [Bold Type]You have lost your anal virginity to [GivingChar]![roman type][line break]";
				now FirstAnalPartner of Player is printed name of GivingChar;
			if Sterile of GivingChar is false: [fertile]
				if MainInfection of GivingChar is not "" and MainInfection of GivingChar is not "None":
					setmonster MainInfection of GivingChar;
					if MainInfection of GivingChar is listed in infections of OviImpregnatorList:
						movichance;
					else:
						mimpregchance;
		else if SexAct is "PussyFuck":
			if Virgin of Player is true:
				now Virgin of Player is false;
				say "     [Bold Type]You have lost your virginity to [GivingChar]![roman type][line break]";
				now FirstVaginalPartner of Player is printed name of GivingChar;
			if Sterile of GivingChar is false: [fertile]
				if MainInfection of GivingChar is not "" and MainInfection of GivingChar is not "None":
					setmonster MainInfection of GivingChar;
					if MainInfection of GivingChar is listed in infections of OviImpregnatorList:
						fovichance;
					else:
						fimpregchance;
		else if SexAct is "AssDildoFuck":
			if AnalVirgin of Player is true:
				now AnalVirgin of Player is false;
				say "     [Bold Type]You have lost your anal virginity to [GivingChar]![roman type][line break]";
				now FirstAnalPartner of Player is printed name of GivingChar;
		else if SexAct is "PussyDildoFuck":
			if Virgin of Player is true:
				now Virgin of Player is false;
				say "     [Bold Type]You have lost your virginity to [GivingChar]![roman type][line break]";
				now FirstVaginalPartner of Player is printed name of GivingChar;
		else if SexAct is "OralCock" or SexAct is "OralPussy":
			if OralVirgin of Player is true:
				now OralVirgin of Player is false;
				say "     [Bold Type]You have lost your oral virginity to [GivingChar]![roman type][line break]";
				now FirstOralPartner of Player is printed name of GivingChar;
	else:
		if debugactive is 1:
			say "DEBUG -> [GivingChar] is having sex with [TakingChar][line break]";
		if SexAct is "AssFuck":
			if PenileVirgin of GivingChar is true:
				now PenileVirgin of GivingChar is false;
				say "     [Bold Type][GivingChar] has lost their penile virginity to [TakingChar]![roman type][line break]";
				now FirstPenilePartner of GivingChar is printed name of TakingChar;
			if AnalVirgin of TakingChar is true:
				now AnalVirgin of TakingChar is false;
				say "     [Bold Type][GivingChar] has taken [TakingChar]'s anal virginity![roman type][line break]";
				now FirstAnalPartner of TakingChar is printed name of GivingChar;
		else if SexAct is "PussyFuck":
			if PenileVirgin of GivingChar is true:
				now PenileVirgin of GivingChar is false;
				say "     [Bold Type][GivingChar] has lost their penile virginity to [TakingChar]![roman type][line break]";
				now FirstPenilePartner of GivingChar is printed name of TakingChar;
			if Virgin of TakingChar is true:
				now Virgin of TakingChar is false;
				say "     [Bold Type][GivingChar] has taken [TakingChar]'s virginity![roman type][line break]";
				now FirstVaginalPartner of TakingChar is printed name of GivingChar;
		else if SexAct is "AssDildoFuck":
			if AnalVirgin of TakingChar is true:
				now AnalVirgin of TakingChar is false;
				say "     [Bold Type][GivingChar] has taken [TakingChar]'s anal virginity![roman type][line break]";
				now FirstAnalPartner of TakingChar is printed name of GivingChar;
		else if SexAct is "PussyDildoFuck":
			if Virgin of TakingChar is true:
				now Virgin of TakingChar is false;
				say "     [Bold Type][GivingChar] has taken [TakingChar]'s virginity![roman type][line break]";
				now FirstVaginalPartner of TakingChar is printed name of GivingChar;
		else if SexAct is "OralCock":
			if PenileVirgin of GivingChar is true:
				now PenileVirgin of GivingChar is false;
				say "     [Bold Type][GivingChar] has lost their penile virginity to [TakingChar]![roman type][line break]";
				now FirstPenilePartner of GivingChar is printed name of TakingChar;
			if OralVirgin of TakingChar is true:
				now OralVirgin of TakingChar is false;
				say "     [Bold Type][GivingChar] has taken [TakingChar]'s oral virginity![roman type][line break]";
				now FirstOralPartner of TakingChar is printed name of GivingChar;
		else if SexAct is "OralPussy":
			if OralVirgin of TakingChar is true:
				now OralVirgin of TakingChar is false;
				say "     [Bold Type][GivingChar] has taken [TakingChar]'s oral virginity![roman type][line break]";
				now FirstOralPartner of TakingChar is printed name of GivingChar;
	now Lastfuck of GivingChar is turns;
	now Lastfuck of TakingChar is turns;

understand "testCreatureSexAftermath" as CreatureSexAftermathAction.

CreatureSexAftermathAction is an action applying to nothing.

carry out CreatureSexAftermathAction:
	say "Testing: Alpha Husky fucks player:";
	CreatureSexAftermath "Player" receives "AssFuck" from "Husky Alpha";
	say "Testing: Player fucks Alpha Husky:";
	CreatureSexAftermath "Husky Alpha" receives "AssFuck" from "Player";
	say "Testing: Chris fucks Alpha Husky:";
	CreatureSexAftermath "Husky Alpha" receives "AssFuck" from "Chris";
	say "Testing: Alpha Husky fucks Chris:";
	CreatureSexAftermath "Chris" receives "AssFuck" from "Husky Alpha";
	[Options for SexAct are: AssFuck, PussyFuck, AssDildoFuck, PussyDildoFuck, OralCock, OralPussy]

to CreatureSexAftermath (TakingCharName - a text) receives (SexAct - a text) from (GivingCharName - a text):
	if GivingCharName is "Player":
		if debugactive is 1:
			say "DEBUG -> Player is the giving partner[line break]";
		if SexAct is "AssFuck":
			if PenileVirgin of Player is true:
				now PenileVirgin of Player is false;
				say "     [Bold Type]You have lost your penile virginity fucking the [TakingCharName in lower case]![roman type][line break]";
		else if SexAct is "PussyFuck":
			if PenileVirgin of Player is true:
				now PenileVirgin of Player is false;
				say "     [Bold Type]You have lost your penile virginity fucking the [TakingCharName in lower case]![roman type][line break]";
	else if TakingCharName is "Player":
		if debugactive is 1:
			say "DEBUG -> Player is the receiving partner[line break]";
		if SexAct is "AssFuck":
			if AnalVirgin of Player is true:
				now AnalVirgin of Player is false;
				say "     [Bold Type]You have lost your anal virginity to the [GivingCharName in lower case]![roman type][line break]";
				now FirstAnalPartner of Player is GivingCharName;
			setmonster GivingCharName;
			if GivingCharName is listed in infections of OviImpregnatorList:
				movichance;
			else:
				mimpregchance;
		else if SexAct is "PussyFuck":
			if Virgin of Player is true:
				now Virgin of Player is false;
				say "     [Bold Type]You have lost your virginity to the [GivingCharName in lower case]![roman type][line break]";
				now FirstVaginalPartner of Player is GivingCharName;
			setmonster GivingCharName;
			if GivingCharName is listed in infections of OviImpregnatorList:
				fovichance;
			else:
				fimpregchance;
		else if SexAct is "AssDildoFuck":
			if AnalVirgin of Player is true:
				now AnalVirgin of Player is false;
				say "     [Bold Type]You have lost your anal virginity to [GivingCharName]![roman type][line break]";
				now FirstAnalPartner of Player is GivingCharName;
		else if SexAct is "PussyDildoFuck":
			if Virgin of Player is true:
				now Virgin of Player is false;
				say "     [Bold Type]You have lost your virginity to [GivingCharName]![roman type][line break]";
				now FirstVaginalPartner of Player is GivingCharName;
		else if SexAct is "OralCock" or SexAct is "OralPussy":
			if OralVirgin of Player is true:
				now OralVirgin of Player is false;
				say "     [Bold Type]You have lost your oral virginity to the [GivingCharName in lower case]![roman type][line break]";
				now FirstOralPartner of Player is GivingCharName;
	else:
		let GivingCharIsNPC be 0;
		let TakingCharIsNPC be 0;
		let GivingChar be a person;
		let TakingChar be a person;
		if debugactive is 1:
			if there is a name of GivingCharName in the Table of GameCharacterIDs:
				now GivingChar is the object corresponding to a name of GivingCharName in the Table of GameCharacterIDs;
				now GivingCharIsNPC is 1;
				say "GivingCharName: [GivingCharName], GivingCharIsNPC: [GivingCharIsNPC]";
			if there is a name of TakingCharName in the Table of GameCharacterIDs:
				now TakingChar is the object corresponding to a name of TakingCharName in the Table of GameCharacterIDs;
				now TakingCharIsNPC is 1;
				say "TakingCharName: [TakingCharName], TakingCharIsNPC: [TakingCharIsNPC]";
			if GivingCharIsNPC is 0 and TakingCharIsNPC is 0:
				say "Error: The CreatureSexAftermath function should include at least one NPC if it is used. Please report this on the FS Discord and quote this full message. Giving Char: '[GivingCharName]' Taking Char: '[TakingCharName]'";


to StatChange (Statname - a text) by (Value - a number):
	if Value is 0:
		say "ERROR: You just got a 0 point stat change. Please report on the FS Discord how you saw this.";
	now Statname is Statname in lower case;
	say "[bold type]Your [statname] has [if Value > 0]in[else]de[end if]creased by [value]![roman type][line break]";
	if Statname is:
		-- "strength":
			increase strength of Player by Value;
			increase capacity of Player by Value * 5;
		-- "dexterity":
			increase dexterity of Player by Value;
		-- "stamina":
			increase stamina of Player by Value;
		-- "charisma":
			increase charisma of Player by Value;
		-- "intelligence":
			increase intelligence of Player by Value;
		-- "perception":
			increase perception of Player by Value;
[
understand "teststatgain" as StatGainAction.

StatGainAction is an action applying to one topic.

carry out StatGainAction:
	say "StatChange 'Strength' by 2[line break]";
	StatChange "Strength" by 2;

understand "teststatloss" as StatLossAction.

StatLossAction is an action applying to one topic.

carry out StatLossAction:
	say "StatChange 'Strength' by -2[line break]";
	StatChange "Strength" by -2;
]
to say NonCombatError:
	say "ERROR! This is a noncombat creature that you should never see in a fight. Please report how you saw this on the FS Discord or Forum.";

understand "rename [text]" as PlayerRenaming.

PlayerRenaming is an action applying to one topic.

carry out PlayerRenaming:
	now name of Player is the topic understood;

HighestPlayerStat is a text that varies.

to FindHighestPlayerStat:
	let CurrentStat be 0;
	if Strength of Player > CurrentStat:
		now CurrentStat is Strength of Player;
		now HighestPlayerStat is "strength";
	if Dexterity of Player > CurrentStat:
		now CurrentStat is Dexterity of Player;
		now HighestPlayerStat is "dexterity";
	if Stamina of Player > CurrentStat:
		now CurrentStat is Stamina of Player;
		now HighestPlayerStat is "stamina";
	if Charisma of Player > CurrentStat:
		now CurrentStat is Charisma of Player;
		now HighestPlayerStat is "charisma";
	if Intelligence of Player > CurrentStat:
		now CurrentStat is Intelligence of Player;
		now HighestPlayerStat is "intelligence";
	if Perception of Player > CurrentStat:
		now CurrentStat is Perception of Player;
		now HighestPlayerStat is "perception";

Section 2 - Stripping

[
understand "teststripcrotch" as StripCrotchAction.

StripCrotchAction is an action applying to one topic.

carry out StripCrotchAction:
	say "[StripCrotch]";

Example Use:
say "     Korvin [StripCrotch], then grins eagerly.";
]

to say StripCrotch:
	let WaistItem be a grab object;
	now WaistItem is journal;
	let CrotchItem be a grab object;
	now CrotchItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "waist":
			now WaistItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "crotch":
			now CrotchItem is z;
	if WaistItem is journal and CrotchItem is journal: [already naked]
		say "strokes over your bare crotch";
	else if WaistItem is journal and CrotchItem is not journal:
		say "pulls down your [CrotchItem] and bares your crotch";
	else if WaistItem is not journal and CrotchItem is journal:
		say "pulls down your [WaistItem] and bares your crotch";
	else if WaistItem is not journal and CrotchItem is not journal:
		say "pulls down your [Waistitem] and [CrotchItem], baring your crotch";


[
understand "zTSelfStripCrotch" as SSCRAction.

SSCRAction is an action applying to nothing.

carry out SSCRAction:
	say "[SelfStripCrotch]";

Example Use:
say "     You [SelfStripCrotch], then wrap your hand around your [cock of Player] shaft.";
]

to say SelfStripCrotch:
	let WaistItem be a grab object;
	now WaistItem is journal;
	let CrotchItem be a grab object;
	now CrotchItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "waist":
			now WaistItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "crotch":
			now CrotchItem is z;
	if WaistItem is journal and CrotchItem is journal: [already naked]
		say "stroke over your bare crotch";
	else if WaistItem is journal and CrotchItem is not journal:
		say "pull down your [CrotchItem] and bare your crotch";
	else if WaistItem is not journal and CrotchItem is journal:
		say "pull down your [WaistItem] and bare your crotch";
	else if WaistItem is not journal and CrotchItem is not journal:
		say "pull down your [Waistitem] and [CrotchItem], baring your crotch";

[
understand "zTSelfDressCrotch" as SDCRAction.

SDCRAction is an action applying to nothing.

carry out SDCRAction:
	say "[SelfDressCrotch]";


Example Use:
say "     You [SelfDressCrotch], then get ready to move out again.";
]

to say SelfDressCrotch:
	let WaistItem be a grab object;
	now WaistItem is journal;
	let CrotchItem be a grab object;
	now CrotchItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "waist":
			now WaistItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "crotch":
			now CrotchItem is z;
	if WaistItem is journal and CrotchItem is journal: [already naked]
		say "casually stroke over your bare crotch";
	else if WaistItem is journal and CrotchItem is not journal:
		say "collect and put your [CrotchItem] back on";
	else if WaistItem is not journal and CrotchItem is journal:
		say "collect and put your [WaistItem] back on";
	else if WaistItem is not journal and CrotchItem is not journal:
		say "collect your [CrotchItem] and [Waistitem] to put them back on";

[
Adds the uppermost layer of bottom clothes, that the player wears, in the text
Example use:
say "     You feel the cold wind blow on your [crotchDesc]";
]
to say crotchDesc:
	let WaistItem be a grab object;
	now WaistItem is journal;
	let CrotchItem be a grab object;
	now CrotchItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "waist":
			now WaistItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "crotch":
			now CrotchItem is z;
	if WaistItem is journal and CrotchItem is journal: [already naked]
		say "bare crotch";
	else if WaistItem is journal and CrotchItem is not journal:
		say "[CrotchItem]";
	else if WaistItem is not journal:
		say "[WaistItem]";

[

understand "zTStripChest" as SCAction.

SCAction is an action applying to nothing.

carry out SCAction:
	say "[StripChest]";

Example Use:
say "     Korvin [StripChest], then grins eagerly.";
]

to say StripChest:
	let ChestItem be a grab object;
	now ChestItem is journal;
	let BodyItem be a grab object;
	now BodyItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "chest":
			now ChestItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "Body":
			now BodyItem is z;
	if ChestItem is journal and BodyItem is journal: [already naked]
		say "strokes over your bare chest";
	else if ChestItem is journal and BodyItem is not journal:
		say "pulls off your [BodyItem] and bares your chest";
	else if ChestItem is not journal and BodyItem is journal:
		say "pulls off your [ChestItem] and bares your chest";
	else if ChestItem is not journal and BodyItem is not journal:
		say "pulls off your [ChestItem] and [BodyItem], baring your chest";

[
understand "zTSelfStripChest" as SSCAction.

SSCAction is an action applying to nothing.

carry out SSCAction:
	say "[SelfStripChest]";

Example Use:
say "     You [SelfStripChest], then grin eagerly.";
]

to say SelfStripChest:
	let ChestItem be a grab object;
	now ChestItem is journal;
	let BodyItem be a grab object;
	now BodyItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "chest":
			now ChestItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "Body":
			now BodyItem is z;
	if ChestItem is journal and BodyItem is journal: [already naked]
		say "casually stroke over your bare chest";
	else if ChestItem is journal and BodyItem is not journal:
		say "pull off your [BodyItem] and bare your chest";
	else if ChestItem is not journal and BodyItem is journal:
		say "pull off your [ChestItem] and bare your chest";
	else if ChestItem is not journal and BodyItem is not journal:
		say "pull off your [ChestItem] and [BodyItem], baring your chest";

[
understand "zTSelfDressChest" as SDCAction.

SDCAction is an action applying to nothing.

carry out SDCAction:
	say "[SelfDressChest]";


Example Use:
say "     You [SelfDressChest], then get ready to move out again.";
]

to say SelfDressChest:
	let ChestItem be a grab object;
	now ChestItem is journal;
	let BodyItem be a grab object;
	now BodyItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "chest":
			now ChestItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "Body":
			now BodyItem is z;
	if ChestItem is journal and BodyItem is journal: [already naked]
		say "casually stroke over your bare chest";
	else if ChestItem is journal and BodyItem is not journal:
		say "collect and put your [BodyItem] back on";
	else if ChestItem is not journal and BodyItem is journal:
		say "collect and put your [ChestItem] back on";
	else if ChestItem is not journal and BodyItem is not journal:
		say "collect your [ChestItem] and [BodyItem] to put them back on";

[
Adds the uppermost layer of top clothes, that the player wears, in the text
Example use:
say "     The water splashes on your [chestDesc]";
]
to say chestDesc:
	let ChestItem be a grab object;
	now ChestItem is journal;
	let BodyItem be a grab object;
	now BodyItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "chest":
			now ChestItem is z;
	repeat with z running through equipped equipment:
		if slot of z is "Body":
			now BodyItem is z;
	if ChestItem is journal and BodyItem is journal: [already naked]
		say "bare chest";
	else if ChestItem is not journal and BodyItem is journal:
		say "[ChestItem]";
	else:
		say "[BodyItem]";

[
Adds footwear name in the text
Example use:
say "     You walk on the dirty floor with your [feetDesc]";
]
to say feetDesc:
	let FeetItem be a grab object;
	now FeetItem is journal;
	repeat with z running through equipped equipment:
		if slot of z is "feet":
			now FeetItem is z;
	if FeetItem is journal: [already naked]
		say "bare feet";
	else:
		say "[FeetItem]";

To MultiInfect (x - text) repeats (repeatCount - number):
	if scenario is "Researcher" and researchbypass is 0:
		vialchance x;
		continue the action;
	repeat with y running from 1 to number of filled rows in Table of Random Critters:
		choose row y in Table of Random Critters;
		if Name entry exactly matches the text x, case insensitively:
			now MonsterID is y;
			let reset be 0;
			if researchbypass is 1 and non-infectious entry is true:
				now reset is 1;
				now non-infectious entry is false;
			let repeatVar be 0;
			while repeatVar < repeatCount:
				infect;
				increase repeatVar by 1;
			if reset is 1:
				now non-infectious entry is true;
			break;

to randomInfect:
	let RandomRow be a random number from 1 to the number of rows in the Table of Random Critters;
	choose row RandomRow from the Table of Random Critters;
	while area entry is "Nowhere": [runs circles until it finds an available creature]
		now RandomRow is a random number from 1 to the number of rows in the Table of Random Critters;
		choose row RandomRow from the Table of Random Critters;
	infect Name entry;

to say nameOrDefault:
	if Player is defaultnamed:
		if Player is male:
			say "[one of]boy[or]dude[or]man[or]guy[at random]";
		else:
			say "[one of]girl[or]babe[or]sweetie[at random]";
	else:
		say "[name of Player]";

Basic Functions ends here.
