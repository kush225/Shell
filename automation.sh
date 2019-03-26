#! /bin/bash
ND_HOME=/home/cavisson/netdiagnostics
Controller_name=work
F1(){
        read -p "Enter TierName: " TierName
   	read -p "Enter ServerName: " ServerName
        read -p "Enter InstanceName: " InstanceName
        read -p "Enter NDC_IP: " NDC_IP
        read -p "Enter NDC_Port: " NDC_PORT
        echo -e "tier=$TierName\nserver=$ServerName\ninstance=$InstanceName\nndcHost=$NDC_IP\nndcPort=$NDC_PORT" > $ND_HOME/config/ndsettings_$ndlPort.conf
}
while true
do
	echo "Press 1: To change Controller if Not Work."
	echo "Press 2: To configure NDC site."
	echo "Press 3: To configure Agent site."
	echo -e "Press 4: Quit.\n"
	read -p  "Enter Your Choice: " usr
	clear
		
	if (( $usr==1 )); then
		read $Controller_name
	elif (( $usr==2 )); then
		while true
		do
		echo "Press 1: To change Controller if Controller is Not Work."
                echo "Press 2: To know current NDC Port."
		echo "Press 3: To know NDC Pid."
                echo "Press 4: Enter the available port which you want to use as NDC port."
                echo "Press 5: To Start/Stop/ForceReload/Restart/Status NDC Service."
		echo -e "Press 6: To Quit.\n"
                read -p "Enter your choice: " usr2
		if (( $usr2==1 ))
		then	read -p "Enter the name of Controller you want to use." Controller_name
		elif (( $usr2==2 ))
		then 	NDC_CUR=$(grep '^PORT' $NS_WDIR/ndc/conf/ndc.conf|egrep -o '[0-9]{1,5}')
			echo "NDC_PORT=$NDC_CUR"
		elif (( $usr2==3 )); then
                                if [[ $Controller_name = "work" ]]; then
                                         /etc/init.d/ndc show | tail -1 | cut -d ' ' -f 2
                                else
                                         /etc/init.d/ndc_$Controller_name show | tail -1 | cut -d ' ' -f 2
                                fi
		elif (( $usr2==4 ))
		then 	read NDC_PORT
			NDC_CUR=$(grep '^PORT' $NS_WDIR/ndc/conf/ndc.conf|egrep -o '[0-9]{1,5}')
			sed -i "s/${NDC_CUR}/${NDC_PORT}/" $NS_WDIR/ndc/conf/ndc.conf
		elif (( $usr2==5 ))
		then	echo "Press 1: To check Status."
			echo "Press 2: To show Pid."
			echo "Press 3: To Start NDC"
			echo "Press 4: To Stop NDC"
			echo "Press 5: To ForceStop NDC"
			echo "Press 6: To Restart NDC"
			echo -e "Press 7: To Quit.\n"
			read -p "Enter Your Choice: " usr6
			if (( $usr6==1 )); then
				if [[ $Controller_name = "work" ]]; then		
					/etc/init.d/ndc show
				else
					/etc/init.d/ndc_$Controller_name show
				fi
			elif (( $usr6==2 )); then
                		if [[ $Controller_name = "work" ]]; then
                        	 	/etc/init.d/ndc start
                        	else
                                	/etc/init.d/ndc_$Controller_name start
				fi
			elif (( $usr6==3 )); then
                		if [[ $Controller_name = "work" ]]; then
                        	   	/etc/init.d/ndc stop
                        	else
                                	/etc/init.d/ndc_$Controller_name stop
				fi
			elif (( $usr6==4 )); then
                        	if [[ $Controller_name = "work" ]]; then
                        		/etc/init.d/ndc forcestop
                       	 	else
                                	/etc/init.d/ndc_$Controller_name forcestop
				fi
			elif (( $usr6==5 )); then
                       		if [[ $Controller_name = "work" ]]; then
                        		/etc/init.d/ndc restart
                        	else
					/etc/init.d/ndc_$Controller_name restart
				fi
			elif (( $usr6==6 )); then
				break
			else
				echo "You Entered a Wrong Choice."
				break
			fi
		elif (( $usr2==6 )); then
			break
		else
			echo "You Entered a Wrong Choice."
			break
		fi
		done	
	elif (( $usr==3 ))
                then	echo "Press 1: To add BCI agent in Tomcat."
			echo "Press 2: To Configure already deployed BCI agent in Tomcat."
			echo "Press 3: To change Controller if not work."
			echo "Press 4: To Start/Stop/Status Tomcat."
			echo -e "Press 5: To Quit.\n"
			read -p "Enter your choice: " usr3
			if (( $usr3==1 ))
			then	echo "Press 1: To change ND HOME path. [default:/home/cavisson/netdiagnostics]"
				echo "Press 2: To configure tomcat file"
				echo "Press 3: To configure ndsettings file"
				read -p "Press 4: To Quit: "  usr4
				if (( $usr4==1 )); then
					read ND_HOME
				elif (( $usr4==2 )); then
					read -p "Enter ndlPort: "  ndlPort
				echo
				echo export TOMCAT_OPTS="-Xmx500m -Xmx1500m -XX:PermSize=100m -XX:MaxPermSize=200m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=60 -javaagent:$ND_HOME/lib/ndmain.jar=time,ndAgentJar=$ND_HOME/lib/ndagent-with-dep.jar,ndHome=$ND_HOME,ndlPort=$ndlPort" >> $NS_WDIR/sys/site.env

				elif (( $usr4==3 )); then
					F1
				elif (( $usr4==4 )); then
					break
				else 
					echo "You Entered a Wrong Choice.\n"
					break	
				fi
			elif (( $usr3==2 )); then
				echo "Press 1: To change ND HOME path. [default:/home/cavisson/netdiagnostics]."
				echo "Press 2: To show current ndl port."
				echo "Press 3: To make ndsetting file for current ndl port."
				echo -e "Press 4: To Quit.\n"
				read -p  "Enter your choice: " usr5
				echo
				if (( $usr5==1	)); then
					read ND_HOME
					echo
				elif (( $usr5==2 )); then	
					ndlPort=$(grep "^export TOMCAT_OPTS=" $NS_WDIR/sys/site.env | egrep -o 'ndlPort=[0-9]{1,5}'| egrep -o '[0-9]{1,5}')
					echo -e "ndlPort=$ndlPort\n" 
				elif (( $usr5==3 )); then
					F1
				elif (( $usr5==4 )); then
					break
				else
					echo -e "You Entered a Wrong Choice.\n"
					break
				fi
			elif (( $usr3==3 )); then
				read $Controller_name
				echo
			elif (( $usr3==4 )); then
				echo "Press 1: To show Pid."
				echo "Press 2: To start Tomcat Service."
				echo "Press 3: To stop Tomcat Service."
				echo "Press 4: To restart Tomcat Service."
				echo "Press 5: To forceReload Tomcat Service."
				echo -e "Press 6: To Quit\n"
				read -p "Enter Your Choice: " usr7
				echo
				if (( $usr7==1 )); then
					 ps -ef | grep tomcat | grep $Controller_name |head -2 | cut -d ' ' -f 2
				elif (( $usr7==2 )); then
					if [[ $Controller_name = "work" ]]; then
						/etc/init.d/tomcat start
						echo
					else
						/etc/init.d/tomcat_$Controller_name start
						echo
					fi
				elif (( $usr7==3 ))
                                then
                                        if [[ $Controller_name = "work" ]]; then
                                                /etc/init.d/tomcat stop 
                                        	echo
					else
                                                /etc/init.d/tomcat_$Controller_name stop
                               			echo
					fi
				elif (( $usr7==4 )); then
                                        if [[ $Controller_name = "work" ]]; then
                                                /etc/init.d/tomcat restart
                                        	echo
					else
                                                /etc/init.d/tomcat_$Controller_name restart
                               			echo
					fi
				elif (( $usr7==5 )); then
                                        if [[ $Controller_name = "work" ]]; then
                                                /etc/init.d/tomcat force-reload
                                        	echo
					else
                                                /etc/init.d/tomcat_$Controller_name force-reload
                               			echo
					fi
				elif (( $usr7==6 )); then 
					break
				else
					echo "You Entered a Wrong Choice."
					break
				fi
			elif (( $usr3==5 )); then
				break
			else
				echo -e "You Entered a Wrong Choice.\n"
				break
			fi
	elif (( $usr==4 )); then
		break
	else
		echo -e "You Entered a Wrong Choice.\n"
		break
	fi
done
