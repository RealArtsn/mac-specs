RAM=$(expr $(sysctl -n hw.memsize) / $((1024**3)))
CPU=$(sysctl -a | grep brand_string | awk -F ':' '{print $2}')
DISK=$(diskutil list | grep physical | awk -F ' ' '{print $1}')
CAPACITY=$(diskutil info $DISK | grep 'Disk Size' | awk -F ' ' '{print $3$4}')
MAX=$(ioreg -l -w0 | grep '\"MaxCapacity\" =' | awk -F ' ' '{print $5}') 
DESIGN=$(ioreg -l -w0 | grep '\"DesignCapacity\" =' | awk -F ' ' '{print $5}') 
BATT=$((100*$MAX/$DESIGN))

echo 'CPU: '$CPU
echo 'RAM: '$RAM'GB'
echo 'Physical Storage: '$CAPACITY
echo 'Battery Health: '$BATT'%'