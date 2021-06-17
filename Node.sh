#Kube command to get the current IP
##COMAND > NewIP.txt
#OldIP.txt

if diff -q NewIP.txt OldIP.txt
then
echo " There is no IP change in the node level"
else
# download config file.

paste -d / NewIP.txt OldIP.txt > combine.sh

sed -i "s/^/sed -e 's\//" -e "s/$/\/g' default.conf/" combine.sh

sh combine.sh

# Add remaining kubernetes command.

cp -rf NewIP.txt OldIP.txt
fi
