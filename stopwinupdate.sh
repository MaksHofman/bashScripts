#!/bin/bash
#Trzeba dac permisjie zeby dzialalo poprawnie
powershell -Command "Start-Process 'sc.exe' -ArgumentList 'config wuauserv start= disabled' -Verb runAs"
powershell -Command "Start-Process 'sc.exe' -ArgumentList 'stop wuauserv' -Verb runAs"

echo "Windows Update service has been disabled."
