@echo off
title RPG Game
mode con cols=80 lines=30
setlocal enabledelayedexpansion
cd

:HlavniMenu
	cls
	color 0D
	echo Lord: Vitej v teto dobrodruzne RPG hre ! 
	PING 1.1.1.1 -n 1 -w 400 > NUL
	echo Lord: Cekaji te velika nebezpecenstvi,...
	PING 1.1.1.1 -n 1 -w 400 > NUL
	echo Lord: ...ale taky hrdinske ciny !
	PING 1.1.1.1 -n 1 -w 400 > NUL
	echo Lord: Dost bylo klaboseni, jdeme hrat!
	PING 1.1.1.1 -n 1 -w 400 > NUL
	echo.
	echo ###################
	echo ### Hlavni Menu ###
	echo ###################
	echo  1) New GAME
	echo  2) Load GAME
	echo  3) Pribeh
	echo  4) Exit
	set /p volba= 
	if %volba%==1 (
		goto NewGame
	) else if %volba%==2 (
		goto LoadGame
	) else if %volba%==3 (
		goto Pribeh
	) else if %volba%==4 (
		goto Exit
	) else goto HlavniMenu

:NewGame
	cls                        
	rem nesmějí být mezery za hodnotama, jinak to uloží i whitespace // ??? Proč nejde uložit číslo 4,2 atd.. ???
	set /p jmeno=Tve jmeno: 
	if NOT EXIST %jmeno% (
		md %jmeno%
		echo %jmeno%> %jmeno%\Staty.txt
		echo 11>> %jmeno%\Staty.txt
		echo 10>> %jmeno%\Staty.txt
		echo 20>> %jmeno%\Staty.txt
		echo 100>> %jmeno%\Staty.txt
		echo 100>> %jmeno%\Staty.txt
		echo 10>> %jmeno%\Staty.txt
		echo 10>> %jmeno%\Staty.txt
		echo 10>> %jmeno%\Staty.txt
		echo 11> %jmeno%\Inventar.txt
		echo Pesti>> %jmeno%\Inventar.txt
		echo Kozena>> %jmeno%\Inventar.txt
		echo Tva postava byla zalozena !
		ping -n 3 localhost >nul
		goto HlavniMenu
	) else (
		echo Jmeno uz existuje, zvol si jine !
		PING 1.1.1.1 -n 1 -w 2000 > NUL
		goto HlavniMenu
	)

:LoadGame
	cls
	set /p slozka=Jmeno tve postavy: 
	if EXIST %slozka% (
		set "file=%slozka%\Staty.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Stat_%%j="
			)
		)
		
		set jmeno=!Stat_1!
		set level=!Stat_2!
		if !level! GEQ 10 (set /a level-=10)
		set XP=!Stat_3!
		if !XP! GEQ 10 (set /a XP-=10)
		set XPMax=!Stat_4!
		set HP=!Stat_5!
		set HPMax=!Stat_6!
		set attack=!Stat_7!
		set defence=!Stat_8!
		set gold=!Stat_9!
		
		set "file=%slozka%\Inventar.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Inventar_%%j="
			)
		)
		set elixir=!Inventar_1!
		if !elixir! GEQ 10 (set /a elixir-=10)
		set weapon=!Inventar_2!
		set /p WPdmg= < weapon\!weapon!\dmg.txt
		set armor=!Inventar_3!
		
		set "file=armor\!armor!\!armor!.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Armor_%%j="
			)
		)
		set armorDef=!Armor_2!
		
		goto MenuChar
	) else (
		echo Postava neexistuje.
		PING 1.1.1.1 -n 1 -w 2000 > NUL
		goto HlavniMenu
	)

:Ulozit
	echo ukladani...
	::sichr
	if %HP% LSS 10 (set HP=10)
	if %gold% LSS 10 (set gold=10)
	set /a elixir+=10
	set /a level+=10
	set /a XP+=10
	::/sichr
	PING 1.1.1.1 -n 1 -w 1500 > NUL
		echo %jmeno%> %jmeno%\Staty.txt
		echo %level%>> %jmeno%\Staty.txt
		echo %XP%>> %jmeno%\Staty.txt
		echo %XPMax%>> %jmeno%\Staty.txt
		echo %HP%>> %jmeno%\Staty.txt
		echo %HPMax%>> %jmeno%\Staty.txt
		echo %attack%>> %jmeno%\Staty.txt
		echo %defence%>> %jmeno%\Staty.txt
		echo %gold%>> %jmeno%\Staty.txt
		echo %elixir%> %jmeno%\Inventar.txt
		echo %weapon%>> %jmeno%\Inventar.txt
		echo %armor%>> %jmeno%\Inventar.txt
	echo ULOZENO...
	PING 1.1.1.1 -n 1 -w 1500 > NUL
	set jmeno=
	set level=
	set XP=
	set XPMax=
	set HP=
	set HPMax=
	set elixir=
	set attack=
	set weapon=
	set WPdmg=
	set defence=
	set armor=
	set armorDef=
	set gold=
	goto HlavniMenu

:Pribeh
	cls
	echo.
	echo ######################################################################
	PING 1.1.1.1 -n 1 -w 300 > NUL												
	echo  Zde, v teto urodne zemi, se meli obyvatele velice dobre.
	echo  Lide zde neznali zadne valky, a polim se darilo velice dobre.
	echo.
	PING 1.1.1.1 -n 1 -w 6000 > NUL
	echo  Nastal uplnek. Rudy uplnek.
	echo  Reky se zbarvily do ruda svitem mesice, a zeme zacala pomalu umirat.
	echo  Pole zacala mit stale mensi a mensi urodu, a lide zacali hladovet.
	echo  V lesich se zacala objevovat zuriva zvirata, ktera na vesnicany utocila.
	echo  Zacaly nepokoje, spory a lide umirali.
	echo.
	PING 1.1.1.1 -n 1 -w 15000 > NUL
	echo  Je na tobe, aby jsi zjistil, co se zde deje, a znicil zlo, ktere
	echo  se usadilo nekde hluboko v teto zemi.
	echo ######################################################################
	PING 1.1.1.1 -n 1 -w 8000 > NUL
	goto HlavniMenu
	
:MenuChar
	cls
	color 07
	echo #############################
	echo Jmeno: %jmeno%
	echo Level: %level% (XP: %XP%/%XPMax%)
	echo HP: %HP%/%HPMax% (Elixiru: %elixir%)
	echo Attack: %attack%
	echo Weapon: %weapon% (+%WPdmg% dmg)
	echo Defence: %defence%
	echo Armor: %armor% (+%armorDef% defence)
	echo Gold: %gold%
	echo #############################
	echo.
	echo Nachazis se ve meste.
	echo.
	echo 0) Zkusebna, Testing
	echo 1) Jit na vypravu
	echo 2) Cviciste
	echo 3) Zbrojir
	echo 4) Platner
	echo 5) Lecitel
	echo 6) Hospoda
	echo 7) Ulozit a HlavniMenu
	echo.
	set /p volba=Jake budou tve dalsi skutky: 
	if %volba%==0 (
		goto Zkusebna
	) else if %volba%==1 (
		goto Vyprava
	) else if %volba%==2 (
		goto Cviciste
	) else if %volba%==3 (
		goto Zbrojir
	) else if %volba%==4 (
		goto Platner
	) else if %volba%==5 (
		goto Lecitel
	) else if %volba%==6 (
		goto Hospoda
	) else if %volba%==7 (
		goto Ulozit
	) else goto MenuChar

:Zkusebna
	cls
	echo ##### Zkusebna #####
	echo ####################
	set nepritel=PekelnyVlk
	CALL :SetEnemy
	CALL :Boj
	goto MenuChar
	
:Cviciste
	cls
	echo ##### Cviciste #####
	echo ####################
	echo.
	echo Za maly poplatek si zde muzes zdokonalit nekterou dovednost.
	echo Mas %gold% zlata k dispozici.
	set /a cenaVydrz=%HPMax%/3*2
	set /a cenaUtok=%attack%*2
	set /a cenaObrana=%defence%*2
	echo.
	echo 0) Pryc odsud
	echo 1) Vydrz (%cenaVydrz% zlatych)
	echo 2) Utok (%cenaUtok% zlatych)
	echo 3) Obrana (%cenaObrana% zlatych)
	echo.
	set /p cvicit=Co chces cvicit? 
	if %cvicit%==0 (
		goto MenuChar
	) else if %cvicit%==1 (
		echo Rozhodl ses cvicit Vydrz.
		if %gold% GEQ %cenaVydrz% (
			rem PING 1.1.1.1 -n 1 -w 6000 > NUL
			set /a gold-=%cenaVydrz%
			set /a HPMax+=10
			echo Trenink je ukonce
			PING 1.1.1.1 -n 1 -w 1700 > NUL
			goto Cviciste
		) else (
			echo Nemas dost penez
			PING 1.1.1.1 -n 1 -w 1700 > NUL
			goto MenuChar
		)
	) else if %cvicit%==2 (
		echo Rozhodl ses cvicit Utok.
		if %gold% GEQ %cenaUtok% (
			rem PING 1.1.1.1 -n 1 -w 5000 > NUL
			set /a gold-=%cenaUtok%
			set /a attack+=5
			echo Trenink je ukonce
			PING 1.1.1.1 -n 1 -w 1700 > NUL
			goto Cviciste
		) else (
			echo Nemas dost penez
			PING 1.1.1.1 -n 1 -w 1700 > NUL
			goto MenuChar
		)
	) else if %cvicit%==3 (
		echo Rozhodl ses cvicit Obranu.
		if %gold% GEQ %cenaObrana% (
			rem PING 1.1.1.1 -n 1 -w 4000 > NUL
			set /a gold-=%cenaObrana%
			set /a defence+=5
			echo Trenink je ukonce
			ping -n 2 localhost >nul
			goto Cviciste
		) else (
			echo Nemas dost penez.
			ping -n 2 localhost >nul
			goto MenuChar
		)
	) else (
		goto MenuChar
	)

:Zbrojir
	cls
	echo ##### Zbrojir #####
	echo ###################
	echo.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Vitej dobrodruhu!
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Potrebujes nejake poradne zelezo.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo U mne jsi tu spravne.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Mas k dispozici %gold% zlatych.
	echo.
	echo Vyber si:
	echo 0) Zpet do mesta
		set /p zbran= < weapon\DrevenyMec\zbran.txt
		set /p dmg= < weapon\DrevenyMec\dmg.txt
		set /p cena= < weapon\DrevenyMec\cena.txt
	echo 1) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\ZeleznyMec\zbran.txt
		set /p dmg= < weapon\ZeleznyMec\dmg.txt
		set /p cena= < weapon\ZeleznyMec\cena.txt
	echo 2) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\OcelovyMec\zbran.txt
		set /p dmg= < weapon\OcelovyMec\dmg.txt
		set /p cena= < weapon\OcelovyMec\cena.txt
	echo 3) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\RunovyMec\zbran.txt
		set /p dmg= < weapon\RunovyMec\dmg.txt
		set /p cena= < weapon\RunovyMec\cena.txt
	echo 4) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\ValorskaCepel\zbran.txt
		set /p dmg= < weapon\ValorskaCepel\dmg.txt
		set /p cena= < weapon\ValorskaCepel\cena.txt
	echo 5) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\OdinovoOstri\zbran.txt
		set /p dmg= < weapon\OdinovoOstri\dmg.txt
		set /p cena= < weapon\OdinovoOstri\cena.txt
	echo 6) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
	echo.	
	
	set /p koupit=Ktery ti padl do oka 
	if %koupit%==0 (
		goto MenuChar
	) else if %koupit%==1 (
		set /p zbran= < weapon\DrevenyMec\zbran.txt
		set /p dmg= < weapon\DrevenyMec\dmg.txt
		set /p cena= < weapon\DrevenyMec\cena.txt
	) else if %koupit%==2 (
		set /p zbran= < weapon\ZeleznyMec\zbran.txt
		set /p dmg= < weapon\ZeleznyMec\dmg.txt
		set /p cena= < weapon\ZeleznyMec\cena.txt
	) else if %koupit%==3 (
		set /p zbran= < weapon\OcelovyMec\zbran.txt
		set /p dmg= < weapon\OcelovyMec\dmg.txt
		set /p cena= < weapon\OcelovyMec\cena.txt
	) else if %koupit%==4 (
		set /p zbran= < weapon\RunovyMec\zbran.txt
		set /p dmg= < weapon\RunovyMec\dmg.txt
		set /p cena= < weapon\RunovyMec\cena.txt
	) else if %koupit%==5 (
		set /p zbran= < weapon\ValorskaCepel\zbran.txt
		set /p dmg= < weapon\ValorskaCepel\dmg.txt
		set /p cena= < weapon\ValorskaCepel\cena.txt
	) else if %koupit%==6 (
		set /p zbran= < weapon\OdinovoOstri\zbran.txt
		set /p dmg= < weapon\OdinovoOstri\dmg.txt
		set /p cena= < weapon\OdinovoOstri\cena.txt
	) else (
		goto Zbrojir
	)	
	
	if !gold! GEQ !cena! (
		set /a gold-=!cena!
		set Weapon=!zbran!
		set WPdmg=!dmg!
		echo Koupil sis !zbran!. At ti dobre slouzi.
		pause >nul
		goto MenuChar
	) else (
		echo !zbran! stoji !cena! zlatych.
		echo Vrat se, az budes mit vic penez.
		pause >nul
		goto MenuChar
	)	

:Platner
	cls
	echo ##### Platner #####
	echo ###################
	echo.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Vitej u Platnere!
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Co to mas na sobe? To je hadr na nadobi?
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Porid si an sebe neco lepsiho. V tomhle te zabije i komar.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Mas k dispozici %gold% zlatych.
	echo.
	echo Vyber si:
	echo 0) Zpet do mesta

	set "file=armor\Zelezna\Zelezna.txt"
	<"!file!" (
		for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
			set /p "Zelezna_%%j="
		)
	)
	echo 1) %Zelezna_1% (Cena: %Zelezna_3% Zlatych, Obrana: %Zelezna_2%)
	
	set "file=armor\Krouzkova\Krouzkova.txt"
	<"!file!" (
		for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
			set /p "Krouzkova_%%j="
		)
	)
	echo 2) %Krouzkova_1% (Cena: %Krouzkova_3% Zlatych, Obrana: %Krouzkova_2%)
	
	set "file=armor\Platova\Platova.txt"
	<"!file!" (
		for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
			set /p "Platova_%%j="
		)
	)
	echo 3) %Platova_1% (Cena: %Platova_3% Zlatych, Obrana: %Platova_2%)
	
	set "file=armor\Mithrilova\Mithrilova.txt"
	<"!file!" (
		for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
			set /p "Mithrilova_%%j="
		)
	)
	echo 4) %Mithrilova_1% (Cena: %Mithrilova_3% Zlatych, Obrana: %Mithrilova_2%)
	
	echo.	
	
	set /p koupit=Ktery ti padl do oka 
	if %koupit%==0 (
		goto MenuChar
	) else if %koupit%==1 (
		set "file=armor\Zelezna\Zelezna.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Zelezna_%%j="
			)
		)
		set armor=!Zelezna_1!
		set Adefence=!Zelezna_2!
		set cena=!Zelezna_3!
	) else if %koupit%==2 (
		set "file=armor\Krouzkova\Krouzkova.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Krouzkova_%%j="
			)
		)
		set armor=!Krouzkova_1!
		set Adefence=!Krouzkova_2!
		set cena=!Krouzkova_3!
	) else if %koupit%==3 (
		set "file=armor\Platova\Platova.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Platova_%%j="
			)
		)
		set armor=!Platova_1!
		set Adefence=!Platova_2!
		set cena=!Platova_3!
	) else if %koupit%==4 (
		set "file=armor\Mithrilova\Mithrilova.txt"
		<"!file!" (
			for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
				set /p "Mithrilova_%%j="
			)
		)
		set armor=!Mithrilova_1!
		set Adefence=!Mithrilova_2!
		set cena=!Mithrilova_3!
	) else (
		goto Zbrojir
	)	
	
	if !gold! GEQ !cena! (
		set /a gold-=!cena!
		set armor=!armor!
		set armorDef=!Adefence!
		echo Koupil sis !armor! zbroj. At ti dobre slouzi.
		pause >nul
		goto MenuChar
	) else (
		echo !armor! stoji !cena! zlatych.
		echo Vrat se, az budes mit vic penez.
		pause >nul
		goto MenuChar
	)	
	
:Lecitel
	cls
	echo ##### Lecitel #####
	echo ###################
	echo.
	echo Vitej u lecitele
	set /a cenaLecby=%HPMax%/10	
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Pokud jsi zraneny, ja te za poplatek vylecim.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo Nebo si zde muzes koupit lecivy elixir na cesty.
	rem PING 1.1.1.1 -n 1 -w 500 > NUL
	echo.
	echo 0) Zpet do mesta
	echo 1) Vylecit se (!cenaLecby! zlatych)
	echo 2) Koupit elixir zivota (70 zlatych, leci 100 HP)
	echo.
	set /p lecit=Co to bude? 
	if %lecit%==0 (
		goto MenuChar
	) else if %lecit%==1 (
		if %HP% LSS %HPMax% (
			if %gold% GEQ !cenaLecby! (
				echo Byl jsi vylecen.
				set /a gold-=!cenaLecby!
				set HP=%HPMax%
				PING 1.1.1.1 -n 1 -w 1500 > NUL
				goto MenuChar
			) else (
				echo Bohuzel nemas dostatek zlatych. Vrat se pozdeji.
				PING 1.1.1.1 -n 1 -w 1500 > NUL
				goto MenuChar
			)
		) else (
			echo Vzdyt jsi uplne zdravy !	
			PING 1.1.1.1 -n 1 -w 1500 > NUL
			goto MenuChar
		)
	) else if %lecit%==2 (
		if %gold% GEQ 70 (
			echo Koupil sis cerveny elixir
			set /a elixir+=1
			set /a gold-=70
			ping -n 2 localhost >nul
			goto Lecitel
		) else (
			echo Bohuzel nemas dostatek zlatych. Vrat se pozdeji.
			ping -n 2 localhost >nul
			goto MenuChar
		)		
	) else (
		goto Lecitel
	)
	
:Hospoda
	cls
	echo ##### Hospoda #####
	echo ###################
	echo.
	echo V hospode si, krom piti, muzes vydelat i zlate.
	echo Treba se nekdy vypracujes az na muj post.
	echo No, a ted do prace!
	echo.
	set /p prace=Chces pracovat?  1/0 
	if %prace%==1 (
		if %level%==1 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 2000 > NUL
			echo ...Vytiras hajzliky...
			PING 1.1.1.1 -n 1 -w 2000 > NUL
			echo ...Umyvas blitky...
			PING 1.1.1.1 -n 1 -w 2000 > NUL
			echo ...Vyhazujes ozralce...
			PING 1.1.1.1 -n 1 -w 2000 > NUL
			echo Prace je ukonce !
			PING 1.1.1.1 -n 1 -w 2000 > NUL
			set /a gold+=40
			echo Za dnesni vecer sis vydelal 40 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==2 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 2300 > NUL
			echo ...Vytiras zem...
			PING 1.1.1.1 -n 1 -w 2300 > NUL
			echo ...Umyvas zvratky...
			PING 1.1.1.1 -n 1 -w 2300 > NUL
			echo ...Vyhazujes opilce...
			set /a gold+=70
			echo Za dnesni vecer sis vydelal 70 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==3 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 2600 > NUL
			echo ...Myjes nadobi...
			PING 1.1.1.1 -n 1 -w 2600 > NUL
			echo ...Uklizis nadobi...
			PING 1.1.1.1 -n 1 -w 2600 > NUL
			echo ...Utiras stoly...
			set /a gold+=120
			echo Za dnesni vecer sis vydelal 120 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==4 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 2900 > NUL
			echo ...Zametas hospodu...
			PING 1.1.1.1 -n 1 -w 2900 > NUL
			echo ...Utiras prach...
			PING 1.1.1.1 -n 1 -w 2900 > NUL
			echo ...Vyhanis krysy...
			PING 1.1.1.1 -n 1 -w 2900 > NUL
			echo ...A jeste jedna potvora tu byla...
			set /a gold+=200
			echo Za dnesni vecer sis vydelal 200 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==5 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 3200 > NUL
			echo ...Doplnujes zasoby piti...
			PING 1.1.1.1 -n 1 -w 3200 > NUL
			echo ...Nosis becky ze sklepa...
			PING 1.1.1.1 -n 1 -w 3200 > NUL
			echo ...Chladis vino...
			PING 1.1.1.1 -n 1 -w 3200 > NUL
			echo ...Ohrivas medovinu...
			set /a gold+=300
			echo Za dnesni vecer sis vydelal 300 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==6 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 3500 > NUL
			echo ...Obsluhujes hosty...
			PING 1.1.1.1 -n 1 -w 3500 > NUL
			echo ...Cepujes pivo...
			PING 1.1.1.1 -n 1 -w 3500 > NUL
			echo ...Michas napoje...
			PING 1.1.1.1 -n 1 -w 3500 > NUL
			echo ...Nalivas kotle...
			set /a gold+=430
			echo Jako cisnik sis vydelal 430 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==7 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 3800 > NUL
			echo ...Kasirujes ostatni...
			PING 1.1.1.1 -n 1 -w 3800 > NUL
			echo ...Delas carky pres miru...
			PING 1.1.1.1 -n 1 -w 3800 > NUL
			echo ...Vyhazujes ozralce...
			set /a gold+=560
			echo Za dnesni vecer sis vydelal 560 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==8 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 4100 > NUL
			echo ...NEVM...
			PING 1.1.1.1 -n 1 -w 4100 > NUL
			echo ...NEVM...
			PING 1.1.1.1 -n 1 -w 4100 > NUL
			echo ...NEVM...
			set /a gold+=730
			echo Za dnesni vecer sis vydelal 730 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else if %level%==9 (
			echo Nuze zacneme...
			PING 1.1.1.1 -n 1 -w 4400 > NUL
			echo ...NEVM...
			PING 1.1.1.1 -n 1 -w 4400 > NUL
			echo ...NEVM...
			PING 1.1.1.1 -n 1 -w 4400 > NUL
			echo ...NEVM...
			set /a gold+=910
			echo Za dnesni vecer sis vydelal 910 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		) else (
			echo Objednavas zbozi.
			PING 1.1.1.1 -n 1 -w 4700 > NUL
			echo Delas rozpis sluzeb.
			PING 1.1.1.1 -n 1 -w 4700 > NUL
			echo Kontrolujes kvalitu piti.
			PING 1.1.1.1 -n 1 -w 4700 > NUL
			echo Bavis se s hosty.			
			set /a gold+=1000
			echo Jako majitel hospody sis vydelal 1000 zlatych
			PING 1.1.1.1 -n 1 -w 3000 > NUL
			goto MenuChar
		)
	) else (
		goto MenuChar
	)
::################################################################################################################################
::################# Vypravy ######################################################################################################
::################################################################################################################################
:SetEnemy
	if exist enemy (
		set "file=enemy\%nepritel%\Nepritel.txt"
		<"!file!" (
		for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a n=%%i && for /l %%j in (1 1 %%i) do (
			set /p "EnemyStat_%%j="
			)
		)
		set jmenoEN=!EnemyStat_1!
		set HPEN=!EnemyStat_2!
		set XPEN=!EnemyStat_3!
		set attackEN=!EnemyStat_4!
		set defenceEN=!EnemyStat_5!
		set goldEN=!EnemyStat_6!
	)
	goto :EOF
	
:Boj
	cls
	echo ##########################
	echo 	!jmeno!
	echo 	!HP!/!HPMax! HP
	echo VS.
	echo 	!Nepritel!
	echo 	!HPEN! HP
	echo ##########################
	echo.
	echo Tve moznosti: 
	echo 1)Utok zbrani
	echo 2)Vypit elixir (!Elixir! elixiru)
	echo.
	set /p akce=Co udelas: 
	echo.
	if %akce%==1 (
		set /a HPEN-=!attack!+!WPdmg!-!defenceEN!/2
	) else (
		if !Elixir! GEQ 1 (
			CALL :Elixir
		) else (
			echo Nemas uz zadne elixiry!
			echo Vrhl ses do utoku!
			set /a HPEN-=!attack!+!WPdmg!-!defenceEN!/2
		)
	)
	
	if !HPEN! LEQ 0 (
		cls
		echo ################################################
		echo 	Porazil jsi nepritele %nepritel%
		echo 	Zustalo ti !HP! HP.
		echo 	Ziskavas %goldEN% zlatych.
		echo 	Ziskavas %XPEN% zkusenosti.
		echo ################################################
		set /a gold+=%goldEN%
		set /a XP+=%XPEN%
		if !XP! GEQ !XPMax! (
			CALL :Level
		)
		pause >nul
		set jmenoEN=
		set XPEN=
		set HPEN=
		set attackEN=
		set defenceEN=
		set goldEN=
		goto :EOF
	) else (
		set /a HP-=!attackEN!-!defence!+!armorDef!/2
		if !HP! GTR 0 (goto Boj) else (goto Smrt)
	)

:Level
	echo --------------------------------
	echo --- Dosahl jsi noveho levelu ---
	echo --------------------------------
	echo Citis, jak tebou proudi nova sila.
	set /a zbytek=!XP!-!XPMax!
	set XP=!zbytek!
	set /a XPMax=!XPMax!*2
	set /a level+=1
	set /a attack+=5
	set /a defence+=5
	goto :EOF
	
:Elixir
	if !HP! LSS !HPMax! (
		if !elixir! GEQ 1 (
			set /p heal=Chces pouzit elixir? 1/0 
			if !heal!==1 (			
				set /a HP+=100
				if !HP! GTR !HPMax! set HP=!HPMax!
				set /a elixir-=1
				set heal=
				echo Vypil jsi elixir zivota !
				echo.
				goto :EOF		
			) else goto :EOF
		) else goto :EOF
	) else goto :EOF

:Hlaska
	set /a hlaska=%RANDOM% * 100 / 32768 + 1
	if hlaska LSS 50 (
		if hlaska LSS 25 (
			echo Vesnican: "Slysel jsem, ze jsou hluboko v jeskynich ukryte poklady." -25
			set hlaska=
		) else (
			echo Vesnican: "Deti mi roztrhala nejaka bestie v lese a nemam penize ani na jidlo."-50
			set hlaska=
		)
	) else if hlaska GEQ 50 (
		if hlaska GEQ 75 (
			echo Vesnican: "Slysel jsem, ze jsou hluboko v jeskynich ukryte poklady."+75
			set hlaska=
		) else (
			echo Vesnican: "Slysel jsem, ze jsou hluboko v jeskynich ukryte poklady."+50
			set hlaska=
		)
	)
	goto :EOF
	
:Past1
	set hod=%random%
	set past=%random%
	if %hod% GTR %past% (
		goto :EOF
	) else (
		echo.
		echo Primo pod nohama se pod tebou otevrela podlaha.
		echo Ty jsi spadl do jamy a zranil ses.
		set /a HP-=!HP!/4
		echo Tve HP: !HP!
		echo.
	)
	goto :EOF
	
:Past2
	set hod=%random%
	set past=%random%
	if %hod% GTR %past% (
		goto :EOF
	) else (
		echo.
		echo Stoupl jsi na spousteci kachlicku, a... 
		echo ..jedovate sipky te otravily.
		set /a HP-=!HP!/3
		echo Tve HP: !HP!
		echo.
	)
	goto :EOF	
	
:Past3
	set hod=%random%
	set past=%random%
	if %hod% GTR %past% (
		goto :EOF
	) else (
		echo.
		echo Ze skviry ve zdi vyletelo ostri, ktere te vazne zasahlo.
		echo Jsi zranen a dost krvacis.
		set /a HP-=!HP!/2
		echo Tve HP: !HP!
		echo.
	)
	goto :EOF	
	
:Past4
	set hod=%random%
	set past=%random%
	if %hod% GTR %past% (
		goto :EOF
	) else (
		echo.
		echo Kamena zeme se sesypala primo pod tvyma nohama a ty jsi spadl do lavy.
		echo Ta te spalila zaziva.
		pause >nul
		goto Smrt
	)	
	
:Smrt
	cls
	color 04                            
	echo        .ohNMMMMNdo-
	echo      :hMMMMMMMMMMMMd:    smNMMMMNmhs+- 
	echo    .hMMNy+:-..-/ohMMMh.  oMMMMMMMMMMMMNy:
	echo   +MMd:           `+NMN: :MMMhhdNMMMMMMMMm+`
	echo  oMMs  `//-    -//` `hMM:`MMM.    `-/+ydNMMN+
	echo -MMd  -NMMMo  +MMMN- `NMN`hMM+           -+yNh.
	echo yMMs  :MMMMs  sMMMM:  dMM++MMh               :s-
	echo yMMm`  -oo: .. :oo-  -MMMo.MMM`                `
	echo :MMMN+`     dh     .oNMMM. mMM: 
	echo  /NMMMMdy`      `ymMMMMN:  yMMs  
	echo   `oNMMMMmoo++oodMMMMMm/.` /MMm  
	echo     dMMMMMMMMMMMMMMMMMMMMMNMMMN/ 
	echo    .MMMMMM        MMMMMMMMMNMMN/ 
	echo     NMMM ZEMREL JSI MMMMMMM/oMMh
	echo     sMMMMM        MMM:Ny/M+ -MMN
	echo     .MMMMMMMMMMMMMMMs `  .   NMM:
	echo      oMMMMMMMMMMMMMm`        yMMo
	echo       dMMMMMMMMMMMM:         /MMd
	echo       .MMMMMMMMMMM+          `MMM`
	echo       -mMMMMMMMMMM-           dMM/
	echo.
	ping -n 2 localhost >nul
	echo Ztratil jsi nejake zlato.
	set /a gold=%gold%-(%gold%/4)
	set HP=1
	echo Budes muset zesilit ! !
	echo Po kliknuti se vratis do Mesta.
	pause >nul
	goto MenuChar

::#################################################################################################################################	
::#################################################################################################################################
::#################################################################################################################################
:Vyprava
	cls
	echo Vydal jsi se na dobrodruznou vypravu!
	rem ping -n 3 localhost >nul
	echo Cesta je nebezpecna. Bud pripraven!
	rem ping -n 3 localhost >nul
	goto Rozcesti1

:Rozcesti1
	cls
	color 07
	echo ######## Rozcesti ########
	echo ##########################
	echo.
	echo Prisel jsi na rozcesti.
	echo Za sebou jeste vidis sede hradby mesta a velkou vstupni branu.
	rem ping -n 2 localhost >nul
	echo Cesta pred tebou se vetvi na 2 strany.
	echo.
	echo 0) Zpet do mesta
	echo 1) Jit do Lesa
	echo 2) Jit do Temneho lesa
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==1 (
		goto Les11
	) else if %rozhodnuti%==2 (
		goto TemnyLes
	) else if %rozhodnuti%==0 (
		goto MenuChar
	) else goto Rozcesti1

:Les11
	cls
	color 0A
	echo ######## LES11 ########
	echo #####################
	echo.
	echo Jdes porad rovne po lesni ceste.
	set nahoda=%random%
	if %nahoda% GTR 10000 (
		set nepritel=Vlk
		CALL :SetEnemy
	) else (
		set nepritel=Bandita
		CALL :SetEnemy
	)
	echo Uslysel jsi nejake zvuky, a vtom na tebe vyskocil %nepritel%
	echo.
	echo 1) Bojovat
	echo 2) Utect
	echo.
	set /p reakce=Co udelas: 
	if %reakce%==1 (
		CALL :Boj
	) else (
		goto Rozcesti1
	)
	echo Porazil jsi nepritele. Muzes pokracovat dale.
	pause >nul
	goto Les21
		
:Les21	
	cls
	color 0A
	echo ####### LES21 #######
	echo #####################
	echo.
	echo Razis si cestu hloubeji do lesa...
	pause >nul
	echo Bud ve strehu, lesem se prohani spousta krvelacnych potvor ! 	
	pause >nul
	echo Vyslapana cesta se opet rozdeluje na 2 strany: 
	echo.
	echo 0) Zpet	
	echo 1) Jit rovne
	echo 2) Jit na Rozcesti
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Les11
	) else if %rozhodnuti%==1 (
		goto Les31
	) else if %rozhodnuti%==2 (
		goto Rozcesti2
	) else (
		goto Les21
	)
	
:Les31	
	cls
	color 0A
	echo ####### LES31 #######
	echo #####################
	echo.
	echo Hloboke vyti nevesti nic dobreho. Bud pripraven!
	echo.
	echo Zautocila na tebe smecka vlku.
	set nahoda=%random%
	if %nahoda% GTR 30000 (
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
	) else if %nahoda% GTR 25000 (
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
	) else if %nahoda% GTR 10000 (
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj		
	) else (
		set nepritel=Vlk
		CALL :SetEnemy
		CALL :Boj			
	)
	echo Hloubeji a hloubeji do lesa, vyber si cestu:	
	echo 0) Zpet	
	echo 1) Jit k Rece
	echo 2) Jit vlevo
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Les21
	) else if %rozhodnuti%==1 (
		goto Reka
	) else if %rozhodnuti%==2 (
		goto Les30
	) else (
		goto Les31
	)

:Les30	
	cls
	color 0A
	echo ####### Les30 #######
	echo #####################
	echo.
	echo Zacina se ti zdat, ze les snad nikdy neskonci.
	echo.
	echo 0) Zpet	
	echo 1) Jit rovne ke Zricenine
	echo 2) Jit dal na Rozcesti
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Les31
	) else if %rozhodnuti%==1 (
		goto Zricenina
	) else if %rozhodnuti%==2 (
		goto Rozcesti2
	) else (
		goto Les30
	)

:Rozcesti2
	cls
	color 07
	echo ######## Rozcesti2 ########
	echo ##########################
	echo.
	echo Prisel jsi na rozcesti.
	rem ping -n 2 localhost >nul
	echo Cesta se vetvi na 2 strany.
	echo.
	echo 0) Zpet	
	echo 1) Jit na vychod
	echo 2) Jit na sever
	echo.
	set /p rozhodnuti=Co udelas: 	
	if %rozhodnuti%==0 (
		goto Les21
	) else if %rozhodnuti%==1 (
		goto Les30
	) else if %rozhodnuti%==2 (
		goto Les201
	) else (
		goto Rozcesti2
	)
:Les201
	cls
	color 0A
	echo ######## Les201 ########
	echo ##########################
	echo.
	echo Vsude kolem jen stromy a tma.
	ping -n 2 localhost >nul
	echo.
	echo 0) Zpet	
	echo 1) Jit na sever
	echo.
	set /p rozhodnuti=Co udelas: 	
	if %rozhodnuti%==0 (
		goto Rozcesti2
	) else if %rozhodnuti%==1 (
		goto StaryDul
	) else (
		goto Les201
	)

:StaryDul
	cls
	color 0A
	echo ######## StaryDul ########
	echo #####################
	echo.
	echo Dosel jsi k velike skalni stene, do ktere vedl tunel a koleje.
	echo Tesne pred vchodem byl vozik, ktery se uz pomalu rozpadal.
	echo Vypada to, ze se tu kdysi tezilo.	
	echo.
	echo 0) Zpet	
	echo 1) Jit na sever
	echo.
	set /p rozhodnuti=Co udelas dal?: 	
	if %rozhodnuti%==0 (
		goto Les201
	) else if %rozhodnuti%==1 (
		goto Starydul
	) else (
		goto StaryDul
	)
	
:Reka	
	cls
	color 0B
	echo ####### Reka #######
	echo #####################
	echo.
	echo Cestu ti prehradila siroka a divoka reka.
	echo Na jejim brehu se houpe stara lodicka.
	echo U lodi stoji postava v plasti.
	echo Prevoznik: "Dobrodruhu, mohu te prevest na druhy breh, pokud jsi dost silny."
	echo.
	echo 0) Jit zpet	
	echo 1) Chci prevest
	echo 2) Preplavat
	echo.
	set /p prevest=Co udelas:
	if !prevest!==0 (
		goto Les31
	) else if !prevest!==1 (
		echo.
		echo Prevoznik: "Nejprve ale musis dokazat, ze jsi na to dost silny."
		echo Prevoznik: "Musis me porazit!"
		echo.
		set /p porazit=Chces ho porazit? 1/0
		if !porazit!==1 (
			echo Starec ze sebe shodil plast.
			echo Jeho stare telo se rozplynulo a zjevil se misto nej cerny demon.
			pause >nul
			set nepritel=Prevoznik
			CALL :SetEnemy
			CALL :Boj
			echo Zasadil jsi nepriteli posledni uder, a demon se zmenil zpet na vrasciteho prevoznika.
			echo Prevoznik: "Dokazal jsi, ze jsi dost silny. Prevezu te na druhou stranu."
			pause >nul
			goto NeznamaZeme
		) else (
			echo Prevoznik: "Vrat se, az budes dost silny!"
			pause >nul
			goto Reka
		)
	) else if !prevest!==2 (
		echo Pote co jsi skocil do vody, jsi uplaval asi 2 metry.
		echo Pak te ale neco chytlo za nohu a stahlo ke dnu.
		echo Uz jsi se nevynoril.
		pause >nul
		goto Smrt
	) else (
		goto Reka
	)

:Zricenina
	cls
	color 0E
	echo ####### Zricenina #######
	echo #########################
	echo.
	echo Dosel jsi k Trpaslicim ruinam.
	echo Vsude kolem byla mlha a chlad.
	echo Vrhly se na tebe znicehonic 2 prizraky.
	pause >nul	
	set nepritel=Prizrak
	CALL :SetEnemy
	CALL :Boj	
	
	set nepritel=Prizrak
	CALL :SetEnemy
	CALL :Boj	

	echo Premohl jsi oba prizraky a pokracujes dal.
	echo Dosel jsi doprostred kruhu, ktery tvoril stred ruin.
	echo Prohlizel sis znaky, ktere zdobily kruh, kdyz vtom te popadla ledova ruka...
	set nepritel=Strazce
	echo Kruty %nepritel% se nad tebou sklanel s rudyma ocima plnyma vzteku.
	pause >nul
	set nepritel=Strazce
	CALL :SetEnemy
	CALL :Boj
	
	echo Po nelitostnem souboji %nepritel% padl.
	echo Otevrely se tajne dvere, ktere nejspis vedou do dungeonu.
	echo.
	echo 0) Vratit se na rozcesti	
	echo 1) Vstoupit do Dungeonu
	echo.
	set /p reakce=Co udelas: 
	if %reakce%==0 (
		goto Rozcesti2
	) else if %reakce%==1 (
		goto Dungeon
	) else (
		goto Rozcesti2
	)

::#################################################################################################################################	
:Dungeon
	rem cesta
	cls
	color 08
	echo ####### Dungeon #######
	echo #######################
	echo.
	echo Kameny zasypaly cestu zpet.
	echo Musis pokracovat dal.
	echo Pach hniloby se linul sotva jsi vstoupil.
	echo Cim niz jsi sestupoval, tim byl vetsi chlad a tma.		
	echo Kamena chodba vede porad do vetsi tmy.	
	pause >nul
	goto Dungeon21
	
:Dungeon21	
	rem cesta
	cls
	color 08
	echo ####### Dungeon21 #######
	echo #######################
	echo.
	echo 0) Zpet	
	echo 1) Jit severni chodbou
	echo 2) Jit vychodni chodbou
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon
	) else if %rozhodnuti%==1 (
		goto Dungeon31
	) else if %rozhodnuti%==2 (
		goto Dungeon22
	) else (
		goto Dungeon21
	)
	
		
:Dungeon31
	cls
	echo ####### Dungeon31 #######
	echo #######################
	echo.
	echo Dosel jsi na rozcesti, vede na 2 strany.
	echo Zleva je citit chladny vitr, 
	echo a ze severu je citit strasny smrad.
	echo 0) Zpet	
	echo 1) Jit severni chodbou
	echo 2) Jit zapadni chodbou
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon21
	) else if %rozhodnuti%==1 (
		goto Dungeon41
	) else if %rozhodnuti%==2 (
		goto Dungeon30
	) else (
		goto Dungeon31
	)

:Dungeon30
	cls
	echo ####### Dungeon30 #######
	echo #######################
	echo.
	echo Dodba zde konci, ale v rohu sis vsimnul kostry cloveka
	echo jeste drzici rezavy mec, a mesec zlata, ktery okusuje krysa.
	CALL :Past2
	echo Natahl ses po mesci, ale krysa s rudyma ocima te kousnula do prstu.
	set nepritel=Krysa
	CALL :SetEnemy
	CALL :Boj
	set gold+=130
	echo V mesci bylo 130 zlatych.
	echo.
	echo 0) Zpet
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon31
	) else (
		goto Dungeon30
	)

:Dungeon41
	cls
	echo ####### Dungeon41 #######
	echo #######################
	echo.
	echo Jdes temnou vlhkou chodbou.
	echo Vsude pisti krysy a na zatylek ti kape voda.
	CALL :Past1
	echo Chodba po chvili odbocuje doleva.
	echo 0) Zpet	
	echo 1) Jit zapadni chodbou
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon31
	) else if %rozhodnuti%==1 (
		goto Dungeon40
	) else (
		goto Dungeon41
	)

:Dungeon40
	cls
	echo ####### Dungeon40 #######
	echo #######################
	echo.
	echo 0) Zpet	
	echo 1) Jit vychodni chodbou
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon41
	) else if %rozhodnuti%==1 (
		goto Dungeon50
	) else (
		goto Dungeon40
	)
	
:Dungeon50
	cls
	echo ####### Dungeon50 #######
	echo #######################
	echo.	
	echo Dosel jsi male kruhove mistnosti. Cesta jiz dale nevedla.
	echo Uprostred stal cerny sloup, na kterem byly vytesany rude zarici symboly.
	if %level% LSS 8 (
		echo Kdyz jsi se sloupu dotkl, ruku ti odhodila nejaka sila.
		echo Jsi prilis slaby, nez abys zvladl zkrotit tuto silu.
	) else (
		echo Kdyz jsi se dotkl sloupu, runy zazarily, sloup se rozzhavil, 
		echo a zhmotnil se pred tebou ohnivy vlk, ktery misto hrivy mel plameny,
		echo oci mu rude zhnuly, a z tlamy mu kapala kyselina.
		pause >nul
		set nepritel=PekelnyVlk
		CALL :SetEnemy
		CALL :Boj
		echo Vlka jsi znicil, jeho telo se rozplynulo, a sloup praskl.
		echo Rozsypal se na prach. Uprostred hromadky zaril cerveny drahokam.
	)
	echo.
	echo 0) Zpet
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon40
	) else (
		goto Dungeon50
	)

:Dungeon22	
	rem cesta
	cls
	color 08
	echo ####### Dungeon22 #######
	echo #######################
	echo.
	echo 0) Zpet	
	echo 1) Jit severni chodbou
	echo 2) Jit vychodni chodbou
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon21
	) else if %rozhodnuti%==1 (
		goto Dungeon32
	) else if %rozhodnuti%==2 (
		goto Dungeon23
	) else (
		goto Dungeon22
	)

:Dungeon32
	cls
	echo ####### Dungeon32 #######
	echo #######################
	echo.
	echo V te tme jsi malem narazil do zdi, cesta dal nevede.
	echo 0) Zpet
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon22
	) else (
		goto Dungeon32
	)
	
:Dungeon23
	rem cesta	
	cls
	color 08
	echo ####### Dungeon23 #######
	echo #######################
	echo.
	CALL :Past2
	echo.
	echo 0) Zpet
	echo 1) Jit vlevo
	echo 2) Jit vpravo
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon22
	) else if %rozhodnuti%==1 (
		goto Dungeon33
	) else if %rozhodnuti%==2 (
		goto Dungeon13
	) else (
		goto Dungeon23
	)
	
:Dungeon13
	cls
	echo ####### Dungeon13 #######
	echo #######################
	echo.
	echo Jsi ve slepe ulicce.
	echo.
	echo 0) Zpet
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon23
	) else (
		goto Dungeon13
	)

:Dungeon33
	rem cesta	
	cls
	color 08
	echo ####### Dungeon33 #######
	echo #######################
	echo.
	echo 0) Zpet	
	echo 1) Jit dal
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Dungeon23
	) else if %rozhodnuti%==1 (
		goto DungeonHala
	) else (
		goto Dungeon33
	)
	
:DungeonHala	
	cls
	color 08
	echo ####### DungeonHala #######
	echo #######################
	echo.	
	echo Vesel jsi do velke mistnosti.
	echo Za tebou se cesta zavalila obrovskym kamenem.
	echo Po stranach byly vyhasle louce a jedine svetlo sem svitilo skrz nejaky svetlik.
	echo V kazdem rohu mistnosti byla rakev.
	echo Na zemi byly hromady kosti, zkazena voda a plisen.
	echo Uprostred toho vseho byl Pomnik, pred kterym byla velka drevena truhla, ktera pretikala zlatem.
	echo Na opacnem konci mistnosti cesta pokracovala dal.
	echo.
	pause >nul
	echo Tak jsi se vydal ke druhemu konci mistnosti,...
	echo kdyz v tom se rakve zacaly otevirat.
	echo Z kazde vyletl jeden TemnyPrizrak
	pause >nul
	set nepritel=TemnyPrizrak
	CALL :SetEnemy
	CALL :Boj	
	set nepritel=TemnyPrizrak
	CALL :SetEnemy
	CALL :Boj
	set nepritel=TemnyPrizrak
	CALL :SetEnemy
	CALL :Boj
	set nepritel=TemnyPrizrak
	CALL :SetEnemy
	CALL :Boj
	echo Porazil jsi vsechny nepratele.
	echo Kruh, v jehoz stredu byl Pomnik, zacal zarit.
	echo Viko prasklo, a vyletl Arcimag.
	echo Z jeho skreku tuhla krev v zilach.
	pause >nul
	set nepritel=Arcimag
	CALL :SetEnemy
	CALL :Boj
	echo Zvitezil jsi !
	echo Truhlice je tvoje.
	set /a gold+=1300
	echo V truhlici bylo 1300 zlatych.
	echo Na konci mistnosti byly kamene schody, z jejichz konce prosvitalo svetlo.
	echo Konecne ses dostal ven.
	echo Vylezl jsi z jeskyne nekde v lese.
	pause >nul
	goto Les21
	
::#################################################################################################################################	
:TemnyLes
	cls
	color 02
	echo ####### Temny Les #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	echo.
	set /p TLP=Chces pokracovat dal?  1/0
	if !TLP!==1 (
		set /a TLCesta1=%RANDOM% * 100 / 32768 + 1
		if !TLCesta1! GEQ 33 (
			if !TLCesta1! GEQ 66 (
				goto TemnyLes31
			) else (
				goto TemnyLes21
			)
		) else (
			goto TemnyLes11
		)
	) else (
		goto Rozcesti1
	)

:TemnyLes11
	cls
	color 02
	echo ####### Temny Les 11 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	echo.
	set /p temnyles=Chces pokracovat dal?  1/0 = Dal/Zpet
	if %temnyles%==1 (
		goto TemnyLes12
	) else (
		goto TemnyLes31
	)


:TemnyLes21
	cls
	color 02
	echo ####### Temny Les 21 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	echo.
	set /p temnyles=Chces pokracovat dal?  Dal/Zpet 1/0
	if %temnyles%==1 (
		set /a TLCesta1=%RANDOM% * 100 / 32768 + 1
		if %TLCesta1% GEQ 50 (
			goto TemnyLes22
		) else (
			goto TemnyLes31
		)
	) else (
		goto TemnyLes31
	)

:TemnyLes31
	cls
	color 02
	echo ####### Temny Les 31 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	set nepritel=Vlkodlak
	CALL :SetEnemy
	CALL :Boj
	echo.
	set /p temnyles=Chces pokracovat dal?  1/0
	if %temnyles%==1 (
		set /a TLCesta1=%RANDOM% * 100 / 32768 + 1
		if %TLCesta1% GEQ 50 (
			goto TemnyLes32
		) else (
			goto TemnyLes11
		)
	) else (
		goto TemnyLes31
	)

:TemnyLes12
	cls
	color 02
	echo ####### Temny Les 12 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	echo.
	set /p temnyles=Chces pokracovat dal?  1/0
	if %temnyles%==1 (
		goto TemnyLes22
	) else (
		goto TemnyLes11
	)
	
:TemnyLes22
	cls
	color 02
	echo ####### Temny Les 22 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	set nepritel=Vlkodlak
	CALL :SetEnemy
	CALL :Boj
	echo.
	set /p temnyles=Chces pokracovat dal?  1/0
	if %temnyles%==1 (
		set /a TLCesta1=%RANDOM% * 100 / 32768 + 1
		if %TLCesta1% GEQ 66 (
			goto TemnyLes32
		) else (
			goto SrdceLesa
		)
	) else (
		goto TemnyLes21
	)

:TemnyLes32
	cls
	color 02
	echo ####### Temny Les 32 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	ping -n 2 localhost >nul
	set /p temnyles=Chces pokracovat dal?  1/0
	if %temnyles%==1 (
		set /a TLCesta1=%RANDOM% * 100 / 32768 + 1
		if %TLCesta1% GEQ 15 (
			goto TemnyLes33
		) else (
			goto TemnyLes
		)
	) else (
		goto TemnyLes31
	)

:TemnyLes33
	cls
	color 02
	echo ####### Temny Les 33 #######
	echo #########################
	echo.
	echo Vesel jsi do Temneho lesa.
	ping -n 2 localhost >nul
	echo Vsude kolem sebe slysis vyti vlku a je tu o poznani vetsi tma a chlad.	
	echo Slysel jsi, ze se odtud nikdo nevratil zivy.
	set nepritel=DuseStromu
	CALL :SetEnemy
	CALL :Boj
	echo.
	set /p temnyles=Chces pokracovat dal?  1/0
	if %temnyles%==1 (
		goto TemnyLes12
	) else (
		goto TemnyLes32
	)	

:SrdceLesa
	cls
	color 02
	echo ####### Srdce Lesa #######
	echo ##########################
	echo.
	echo Nachazis se na mytine, uprostred ktere je sloup z cerneho mramoru.
	ping -n 2 localhost >nul
	echo Cesta jiz dal nevede.	
	ping -n 2 localhost >nul
	echo Sel jsi blize ke sloupu.
	ping -n 2 localhost >nul
	if %level% LSS 8 (
		echo Kdyz jsi se sloupu dotkl, ruku ti odhodila nejaka sila.
		echo Jsi prilis slaby, nez abys zvladl zkrotit silu lesa.
	) else (
		echo Kdyz jsi se dotkl sloupu, runy zazarily, sloup se rozzhavil, 
		echo a les zacal zlovestne sumet. Zacaly se ozyvat desive zvuky.
		echo Skripot ti doslova trhal usi na kusy.
		echo Strom, u ktereho pomnik stal, se zrazu zacal chvet, kura se rozevrela,
		echo a vykoukly straslive zlate oci a obrovska tlama.
		pause >nul
		set nepritel=KralStromu
		CALL :SetEnemy
		CALL :Boj
		echo Kdyz jsi zasadil posledni ranu, strom praskl vedvi a sloup se rozzaril a vybuchnul.
		echo Uprostred hromady zaril zlaty drahokam.
	)
	set /p temnylesNavrat=Chces zpet do mesta?  1/0
	if %temnylesNavrat%==1 (
		goto MenuChar
	) else (
		goto SrdceLesa
	)

::#################################################################################################################################	
:NeznamaZeme
	cls
	color 04
	echo ############################
	echo ####### Neznama Zeme #######
	echo ############################
	echo.	
	ping -n 2 localhost >nul
	echo Zde, v Nezname Zemi, te cekaji novi nepratele,...
	ping -n 2 localhost >nul
	echo nove zbrane,...
	ping -n 2 localhost >nul
	echo a nova dobrodruzstvi.
	ping -n 2 localhost >nul
	echo.
	echo 0) Nechat se prevest zpet.	
	echo 1) Legendarni Zbrojir
	echo.
	set /p rozhodnuti=Co udelas: 
	if %rozhodnuti%==0 (
		goto Reka
	) else if %rozhodnuti%==1 (
		goto LegendarniZbrojir
	) else (
		goto NeznamaZeme
	)

:LegendarniZbrojir
	cls
	echo ##### Legendarni Zbrojir #####
	echo ##############################
	echo.	
	echo Vitej dobrodruhu !
	echo Zbrane, o kterych vypraveji legendy, si muzes poridit zde.
	echo Mas k dispozici %gold% zlatych.
	echo.
	echo Vyber si:
	echo 0) Zpet do mesta
		set /p zbran= < weapon\Kusanagi\zbran.txt
		set /p dmg= < weapon\Kusanagi\dmg.txt
		set /p cena= < weapon\Kusanagi\cena.txt
	echo 1) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\Bifrost\zbran.txt
		set /p dmg= < weapon\Bifrost\dmg.txt
		set /p cena= < weapon\Bifrost\cena.txt
	echo 2) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\Twilight\zbran.txt
		set /p dmg= < weapon\Twilight\dmg.txt
		set /p cena= < weapon\Twilight\cena.txt
	echo 3) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\Sunrise\zbran.txt
		set /p dmg= < weapon\Sunrise\dmg.txt
		set /p cena= < weapon\Sunrise\cena.txt
	echo 4) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\Excalibur\zbran.txt
		set /p dmg= < weapon\Excalibur\dmg.txt
		set /p cena= < weapon\Excalibur\cena.txt
	echo 5) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
		set /p zbran= < weapon\FrostMourne\zbran.txt
		set /p dmg= < weapon\FrostMourne\dmg.txt
		set /p cena= < weapon\FrostMourne\cena.txt
	echo 6) %zbran% (Cena: %cena% Zlatych, DMG: %dmg%)
	echo.	
	
	set /p koupit=Ktery ti padl do oka 
	if %koupit%==0 (
		goto NeznamaZeme
	) else if %koupit%==1 (
		set /p zbran= < weapon\Kusanagi\zbran.txt
		set /p dmg= < weapon\Kusanagi\dmg.txt
		set /p cena= < weapon\Kusanagi\cena.txt
	) else if %koupit%==2 (
		set /p zbran= < weapon\Bifrost\zbran.txt
		set /p dmg= < weapon\Bifrost\dmg.txt
		set /p cena= < weapon\Bifrost\cena.txt
	) else if %koupit%==3 (
		set /p zbran= < weapon\Twilight\zbran.txt
		set /p dmg= < weapon\Twilight\dmg.txt
		set /p cena= < weapon\Twilight\cena.txt
	) else if %koupit%==4 (
		set /p zbran= < weapon\Sunrise\zbran.txt
		set /p dmg= < weapon\Sunrise\dmg.txt
		set /p cena= < weapon\Sunrise\cena.txt
	) else if %koupit%==5 (
		set /p zbran= < weapon\Excalibur\zbran.txt
		set /p dmg= < weapon\Excalibur\dmg.txt
		set /p cena= < weapon\Excalibur\cena.txt
	) else if %koupit%==6 (
		set /p zbran= < weapon\FrostMourne\zbran.txt
		set /p dmg= < weapon\FrostMourne\dmg.txt
		set /p cena= < weapon\FrostMourne\cena.txt
	) else (
		goto LegendarniZbrojir
	)	
	
	if !gold! GEQ !cena! (
		set /a gold-=!cena!
		set Weapon=!zbran!
		set WPdmg=!dmg!
		echo Koupil sis !zbran!. At ti dobre slouzi.
		pause >nul
		goto NeznamaZeme
	) else (
		echo !zbran! stoji !cena! zlatych.
		echo Vrat se, az budes mit vic penez.
		pause >nul
		goto NeznamaZeme
	)	
	
:Exit
	endlocal
	exit \b
