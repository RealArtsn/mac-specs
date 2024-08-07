RAM=$(expr $(sysctl -n hw.memsize) / $((1024**3)))
CPU=$(sysctl -a | grep brand_string | awk -F ':' '{print $2}')
HDD1=$(diskutil info disk0 | grep 'Disk Size' | awk -F ' ' '{print $2$3}')
HDD2=$(diskutil info disk1 | grep 'Disk Size' | awk -F ' ' '{print $2$3}')
MAX=$(ioreg -l -w0 | grep '\"MaxCapacity\" =' | awk -F ' ' '{print $5}') 
DESIGN=$(ioreg -l -w0 | grep '\"DesignCapacity\" =' | awk -F ' ' '{print $5}') 
BATT=$((100*$MAX/$DESIGN))

echo 'CPU: '$CPU
echo 'RAM: '$RAM'GB'
echo 'Storage 1: '$HDD1
echo 'Storage 2: '$HDD2
echo 'Battery Health: '$BATT'%'