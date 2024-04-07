#!/bin/bash
#Developed by EvJun.
echo
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "|                                                     |"
echo "|      Good Day, $LOGNAME!                                  |"
echo "|      Today is $(date '+%A, %d %B, %Y.')        |"
echo "|      $(date '+The time is %H:%M:%S')                           |"
echo "|      Your machine is - $(hostname)                        |"
echo "|                                                     |"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo
echo "Select a number to run a task:"
echo 
PS3="Your choice : "
OPTIONS=("OS info" "List home directory files" 
        "Show running root processes" "Print disk usage" "Exit")


select CHOICE in "${OPTIONS[@]}";do
    case $CHOICE in
        "OS info")
            echo
            echo "$(cat /etc/os-release)"
            ;;

        "List home directory files")
            echo
            echo "$(ls -p ~/ | grep -v /)"
            ;;

        "Show running root processes")
            echo
            read -p "Do you want to list processes normally [n] or verbose [v]? : " PROCESS_LIST
            if [ $PROCESS_LIST = "v" ]; then
                echo
                PS_COL_VERBOSE="pid,ppid,%cpu,%mem,cmd,start,time,stat,tty,vsz"
                echo "$(ps -U root -u root -o "$PS_COL_VERBOSE")"
            else
                echo
                PS_COL_STD="pid,ppid,%cpu,%mem,cmd,time"
                echo "$(ps -U root -u root -o "$PS_COL_STD")"
            fi
            ;;

        "Print disk usage")
            echo
            echo "$(df -aH)"
            ;;
            
        "Exit")
            echo
            echo "Goodbye $LOGNAME!"
            break
            ;;
        *)
            echo
            echo "Invalid choice"
            ;;
    esac
done
echo
echo "+++++++++++++++++++++++++++++++++"
echo
