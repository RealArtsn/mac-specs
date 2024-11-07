echo
echo '== Mac Specs Script by Joel (v0.1.1) =='
RAM=$(expr $(sysctl -n hw.memsize) / $((1024**3)))
CPU=$(sysctl -a | grep brand_string | awk -F ':' '{print $2}')
DISK=$(diskutil list | grep internal | awk -F ' ' '{print $1}')
CAPACITY=$(diskutil info $DISK | grep 'Disk Size' | awk -F ' ' '{print $3$4}')
MAX=$(ioreg -l -w0 | grep '\"MaxCapacity\" =' | awk -F ' ' '{print $5}')
DESIGN=$(ioreg -l -w0 | grep '\"DesignCapacity\" =' | awk -F ' ' '{print $5}')
BATT=$((100*$MAX/$DESIGN))
CYCLES=$(ioreg -l -w0 | grep '"CycleCount" =' | awk -F ' ' '{print $5}')
echo 'CPU: '$CPU
echo 'RAM: '$RAM'GB'
# Display GPU info if system_profiler available
if (ls /usr/sbin/system_profiler &> /dev/null)
then
    echo 'Graphics:'
    /usr/sbin/system_profiler SPDisplaysDataType | grep Chipset
else
    echo 'Graphics information unavailable.'
fi
echo 'Physical Storage: '$CAPACITY
echo 'Battery Health: '$BATT'%'
echo 'Battery Cycles: '$CYCLES
echo '=='