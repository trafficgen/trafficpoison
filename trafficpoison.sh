#!/bin/bash
# Ανάλογα το είδος ethernet μπορείτε να αλλάξτε το eth1 σε eth0 
# Χρησιμοποιούνται τα εργαλεία nemesis,sendip,mausezahn,yersinia,xdotool,hping,nping,idswakeup,stick,snot,rule2alert,sneeze, packeth,epb, scapy , metasploit, bittwist και pfsend
# Δεν είναι αναγκαία η εγκατάσταση όλων των παραπάνω
# Για κάθε εκτέλεση θα πρέπει να έχετε ενεργοποιημένα root privileges
# Για τερματισμό λειτουργίας του προγράμματος πατήστε Ctrl+c συνεχόμενα
# Ενδεχομένως να χρειαστεί να πατάτε Enter στην περίπτωση όπου εμφανίζεται εκτέλεση DOS επίθεσης από το yersinia για να σταματάτε κάθε φορά την επίθεση

# Πιθανά πρωτόκολλα χρήσης από το nemesis

rand[0]="udp"
rand[1]="tcp"
rand[2]="icmp"
rand[3]="dns"
rand[4]="ip"
rand[5]="igmp"
rand[6]="rip"
rand[7]="ospf"
rand[8]="arp"

# Source hosts δικτύου Α

IP[0]="10.0.0.50"
IP[1]="10.0.0.60"
IP[2]="10.0.0.70"
IP[3]="10.0.0.80"
IP[4]="10.0.0.90"

# Source hosts δικτύου B

IP[5]="12.0.0.10"
IP[6]="12.0.0.20"
IP[7]="12.0.0.30"
IP[8]="12.0.0.40"

# Source hosts δικτύου Γ

IP[9]="18.0.0.1"
IP[10]="18.0.0.2"
IP[11]="18.0.0.3"
IP[12]="18.0.0.4"
IP[13]="18.0.0.5"
IP[14]="18.0.0.6"
IP[15]="18.0.0.7"

# Source hosts δικτύου Δ

IP[16]="24.0.0.1"
IP[17]="24.0.0.2"
IP[18]="24.0.0.3"
IP[19]="24.0.0.4"
IP[20]="24.0.0.5"

# Source hosts δικτύου Ε

IP[21]="30.0.0.6"
IP[22]="30.0.0.7"
IP[23]="30.0.0.8"
IP[24]="30.0.0.9"
IP[25]="30.0.0.10"
IP[26]="30.0.0.11"
IP[27]="30.0.0.12"
IP[28]="30.0.0.13"

# Destination hosts δικτύου A

des[0]="10.0.0.10"
des[1]="10.0.0.20"
des[2]="10.0.0.30"
des[3]="10.0.0.40"
des[4]="10.0.0.50"

# Destination hosts δικτύου B

des[5]="12.0.0.50"
des[6]="12.0.0.60"
des[7]="12.0.0.70"
des[8]="12.0.0.80"

# Destination hosts δικτύου Γ


des[9]="18.0.0.8"
des[10]="18.0.0.9"
des[11]="18.0.0.10"
des[12]="18.0.0.11"
des[13]="18.0.0.12"
des[14]="18.0.0.13"
des[15]="18.0.0.14"
des[16]="18.0.0.15"
des[17]="18.0.0.16"
des[18]="18.0.0.17"
des[19]="18.0.0.18"
des[20]="18.0.0.19"

# Destination hosts δικτύου Δ

des[21]="24.0.0.6"
des[22]="24.0.0.7"
des[23]="24.0.0.8"
des[24]="24.0.0.9"
des[25]="24.0.0.10"

# Destination hosts δικτύου Ε

des[26]="30.0.0.1"
des[27]="30.0.0.2"
des[28]="30.0.0.3"
des[29]="30.0.0.4"
des[30]="30.0.0.5"

# MAC addresses προς χρήση για όλα τα δίκτυα


HEX[0]="22:22:22:22:22:22"
HEX[1]="50:00:05:00:00:50"
HEX[2]="44:44:44:44:44:44"
HEX[3]="55:55:55:55:55:55"
HEX[4]="00:00:00:00:00:00"

HEXZ[0]="66:66:66:66:66:66"
HEXZ[1]="77:77:77:77:77:77"
HEXZ[2]="88:88:88:88:88:88"
HEXZ[3]="11:11:11:11:11:11"
HEXZ[4]="99:99:99:99:99:99"

# Fragmentation options

FCHOICE[0]="-FD"
FCHOICE[1]="-FR"
FCHOICE[2]="-FM"

# TCP flags (SYN, ACK, RST, PSH, FIN, URG, ECN, CWR)

TCP[0]="-fS"
TCP[1]="-fA"
TCP[2]="-fR"
TCP[3]="-fP"
TCP[4]="-fF"
TCP[5]="-fU"
TCP[6]="-fE"
TCP[7]="-fC"

# ICMP injection-mode (echo, address mask, unreachable, time exceeded, redirect, timestamp) για χρήση στο nemesis

ICMP[0]="-qE"
ICMP[1]="-qM"
ICMP[2]="-qU"
ICMP[3]="-qX"
ICMP[4]="-qR"
ICMP[5]="-qT"

IGMP[0]="17"
IGMP[1]="18"
IGMP[2]="22"
IGMP[3]="23"

# TCP flags (SYN, ACK, RST, PSH, FIN, URG, ECN, CWR)

FLAG[1]="fin"
FLAG[2]="syn"
FLAG[3]="rst"
FLAG[4]="psh"
FLAG[5]="ack"
FLAG[6]="urg"
FLAG[7]="ecn"
FLAG[8]="cwr"

# ICMP injection-mode (PING,REDIR,UNREACH)

ICMPNAME[0]="PING"
ICMPNAME[1]="REDIR"
ICMPNAME[2]="UNREACH"

# Fragmentation options

IPFRAG[0]="df"
IPFRAG[1]="mf"
IPFRAG[2]="rf"

# Σταθερή μεταβλητή για άπειρες επαναλήψεις

z=-5

# Εκκίνηση επανάληψης while 



while [ $z -lt 0 ]; 
do



# Μεταβλητή επαναλήψεων

tool=$[$RANDOM % 25]

# Χαρακτηριστικά πρωτοκόλλου DNS

dnsi=$[$RANDOM]
dnsg=$[$RANDOM]
dnsq=$[$RANDOM]
dnsw=$[$RANDOM]
dnsA=$[$RANDOM]
dnsr=$[$RANDOM]
dnsb=$[$RANDOM]

# Χαρακτηριστικά πρωτοκόλλου RIP

ripa=$[$RANDOM % 65535]
ripc=$[$RANDOM % 7]
riph=$[$RANDOM % 1]
ripk=$[$RANDOM % 1]
ripm=$[$RANDOM % 16]
ripr=$[$RANDOM % 1]
ripR=$[$RANDOM % 2]
ripV=$[$RANDOM % 2]

# Τυχαίες διευθύνσεις MAC

HEX0=$[$RANDOM % 77]
HEX1=$[$RANDOM % 77]
HEX2=$[$RANDOM % 77]
HEX3=$[$RANDOM % 77]
HEX4=$[$RANDOM % 77]
HEX5=$[$RANDOM % 77]
hexrand=$[$RANDOM % 4]

# Θύρες πηγής και προορισμού

SPORT=$[$RANDOM % 65535]
DPORT=$[$RANDOM % 65535]

# Δευτερεύοντα χαρακτηριστικά πακέτων (time to live κ.α)

wdata=$[$RANDOM]
sdata=$[$RANDOM]
adata=$[$RANDOM]
udata=$[$RANDOM]
Idata=$[$RANDOM]
Tdata=$[$RANDOM % 254]
tdata=$[$RANDOM % 254]
Idata=$[$RANDOM]
randx=$[$RANDOM % 7]

# Διευθύνσεις IP πηγής και τελικού προορισμού

IPx=$[$RANDOM % 28]
desx=$[$RANDOM % 30]

# Δείκτες τυχαιότητας

FRAND=$[$RANDOM % 3]
TCPRAND=$[$RANDOM % 8]

# Τυχαιότητα στα πρωτόκολλα ICMP και IGMP

icmpc=$[$RANDOM % 255]
icmpi=$[$RANDOM % 255]
ICMPRAND=$[$RANDOM % 6]
IGMPRAND=$[$RANDOM % 4]
IPRAND=$[$RANDOM % 100]
IGMPCODE=$[$RANDOM % 100]

# Χαρακτηριστικά IPv4 πρωτοκόλλου

ipv4len=$[$RANDOM]
ipv4data=$[$RANDOM]
ipv4offset=$[$RANDOM]

# Χαρακτηριστικά TCP πρωτοκόλλου

tcpseq=$[$RANDOM]
tcpack=$[$RANDOM]
tcpoff=$[$RANDOM]
tcphead=$[$RANDOM]
tcpwindow=$[$RANDOM]
tcpcheck=$[$RANDOM]
tcpurgpoint=$[$RANDOM]

# Χαρακτηριστικά BGP πρωτοκόλλου

bgplen=$[$RANDOM]
bgptype=$[$RANDOM % 4]
bgpversion=$[$RANDOM]
bgpas=$[$RANDOM]
bgptime=$[$RANDOM]
bgpid=$[$RANDOM]
bgpoptlen=$[$RANDOM]

# Χαρακτηριστικά UDP πρωτοκόλλου

udpsource=$[$RANDOM]
udpdest=$[$RANDOM]
udplen=$[$RANDOM]
udpchecks=$[$RANDOM]

# Χαρακτηριστικά NTP πρωτοκόλλου

ntpleap=$[$RANDOM]
ntpstat=$[$RANDOM]
ntptype=$[$RANDOM]
ntppre=$[$RANDOM]
ntperror=$[$RANDOM]
ntpdrift=$[$RANDOM]
ntpid=$[$RANDOM]
ntptime=$[$RANDOM]
ntptimeb=$[$RANDOM]
ntptimec=$[$RANDOM]
ntptimed=$[$RANDOM]

# Είδος και έλεγχος ICMP πρωτοκόλλου

icmptype=$[$RANDOM]
icmpcode=$[$RANDOM]
icmpcheck=$[$RANDOM]

# Χαρακτηριστικά RIP πρωτοκόλλου

ripfamily=$[$RANDOM]
riptag=$[$RANDOM]
ripsub1=$[$RANDOM % 255]
ripsub2=$[$RANDOM % 255]
ripsub3=$[$RANDOM % 255]
ripsub4=$[$RANDOM % 255]
riphop=$[$RANDOM]
ripmetric=$[$RANDOM]

# IP διευθύνσεις για το DNS πρωτόκολλο

dnsip1=$[$RANDOM % 255]
dnsip2=$[$RANDOM % 255]
dnsip3=$[$RANDOM % 255]
dnsip4=$[$RANDOM % 255]

# Δείκτης τυχαιότητας flag και χαρακτηριστικά TCP πρωτοκόλλου για το mausezhan

FLAGRAND=$[$RANDOM]
MZTCPS=$[$RANDOM % 4294967295]
MZTCPA=$[$RANDOM % 4294967295]
MZTCPWIN=$[$RANDOM % 65535]
MZTCPURG=$[$RANDOM % 65535]
MZTCPSUM=$[$RANDOM % 255]
MZTCPPAYLOAD=$[$RANDOM % 24124968236035435678340691525178281724124909263597265902359026235762309592]

# UDP χαρακτηριστικά (length,summary,payload)

MZUDPLEN=$[$RANDOM % 65535]
MZUDPSUM=$[$RANDOM % 255]
MZUDPPAYLOAD=$[$RANDOM % 96346823512737845895637342561357965956985692352358458899569563463633452355]

# Χαρακτηριστικά ICMP πρωτοκόλλου για το mausezhan

ICMPNAMERAND=$[$RANDOM % 3]
MZICMPCODE=$[$RANDOM % 6]
MZICMPID=$[$RANDOM % 65535]
MZICMPSEQ=$[$RANDOM % 65535]

# Δικτυακές πύλες ICMP

MZICMPGATEWAY1=$[$RANDOM % 255]
MZICMPGATEWAY2=$[$RANDOM % 255]
MZICMPGATEWAY3=$[$RANDOM % 255]
MZICMPGATEWAY4=$[$RANDOM % 255]

# Πληροφορίες IP πακέτου για το mausezhan

MZIPLEN=$[$RANDOM % 65535]
MZIPSUM=$[$RANDOM % 255]
MZIPTOS=$[$RANDOM % 65535]
MZIPTOS=$[$RANDOM]
MZIPDSCP=$[$RANDOM % 63]
MZIPTTL=$[$RANDOM % 255]
MZIPPROTO=$[$RANDOM % 100]
MZIPRAND=$[$RANDOM]
MZIPID=$[$RANDOM % 65535]

# Υπογραφή TCP

tcpsign=$[$RANDOM]

# Χαρακτηριστικά STP πακέτου

stpattack=$[$RANDOM % 7]
stpversion=$[$RANDOM % 3]
stpflags=$[$RANDOM % 50]
stpid=$[$RANDOM % 50]
stpcost=$[$RANDOM % 50]
stpportid=$[$RANDOM % 50]
stpmessage=$[$RANDOM % 50]
stpmax=$[$RANDOM % 50]
stphello=$[$RANDOM % 50]
stpforward=$[$RANDOM % 50]
stpsource=$[$RANDOM % 16]
stpdest=$[$RANDOM % 16]
stptype=$[$RANDOM % 50]

# Χαρακτηριστικά CDP πακέτου

cdpattack=$[$RANDOM % 2]
cdpversion=$[$RANDOM % 3]
cdpttl=$[$RANDOM % 50]
cdpsource=$[$RANDOM % 16]
cdpdest=$[$RANDOM % 16]

# HSRP attack vector

hsrpattack=$[$RANDOM % 2]

# DHCP attack vector

dhcpattack=$[$RANDOM % 3]

# DTP attack vector

dtpattack=$[$RANDOM % 1]

# 802.1 attack vector

qattack=$[$RANDOM % 2]

# VTP attack vector

vtpattack=$[$RANDOM % 4]
ip1=$[$RANDOM % 255]
ip2=$[$RANDOM % 255]

ip3=$[$RANDOM % 255]

ip4=$[$RANDOM % 255]

if [ "$tool" = 0 ] ;
then

if [ "$randx" = 1 ] ; 
then
nemesis "${rand[$randx]}" -v -x $SPORT -y $DPORT $TCPRAND  -w $wdata -s $sdata -a $adata -u $udata -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5
  
elif [ "$randx" = 0 ] ; 
then
nemesis udp -v -x $SPORT -y $DPORT -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

elif [ "$randx" = 2 ] ; 
then
nemesis icmp -v "${ICMP[$ICMPRAND]}" -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

elif [ "$randx" = 7 ] ; 
then
nemesis rip -v -a $ripa -c $ripc -h $riph -i "${des[$desx]}" -k $ripk -m $ripm -r $ripr -R $ripR -V $ripV -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5
  

elif [ "$randx" = 8 ] ; 
then
nemesis ospf -v -x $SPORT -y $DPORT -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

elif [ "$randx" = 9 ] ; 
then
nemesis arp -v -x $SPORT -y $DPORT -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

elif [ "$randx" = 4 ] ; 
then
nemesis ip -v -D "${des[$desx]}" -I $Idata -p $IPRAND  -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -S $ip1"."$ip2"."$ip3"."$ip4 -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

elif [ "$randx" = 5 ] ; 
then
nemesis igmp -v -c $IGMPCODE -i "${des[$desx]}" -p $IGMPRAND -D "${des[$desx]}" "${FCHOICE[$FRAND]}" -I $Idata -S $ip1"."$ip2"."$ip3"."$ip4 -t $tdata -T $Tdata -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

elif [ "$randx" = 3 ] ; 
then
nemesis dns -v -i $dnsi -b $dnsb -g $dnsg -q $dnsq -w $dnsw -A $dnsA -r $dnsr -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}"


else

nemesis "${rand[$randx]}" -v -S $ip1"."$ip2"."$ip3"."$ip4 -D "${des[$desx]}" -I $Idata -T $Tdata -t $tdata "${FCHOICE[$FRAND]}" -M '%x:' $HEX0 $HEX1 $HEX2 $HEX3 $HEX4 $HEX5

fi
fi

if [ "$tool" = 1 ] ;
then

sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -ip $IPRAND
fi
if [ "$tool" = 2 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p tcp -ts $SPORT -td $DPORT -tn $tcpseq -ta $tcpack -tt $tcpoff -tr $tcphead -tfe r -tfc r -tfu r -tfa r -tfp r -tfr r -tfs r -tff r -tw $tcpwindow -tc $tcpcheck -tu $tcpurgpoint
fi

if [ "$tool" = 3 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p tcp -ts $SPORT -td 179 -tn $tcpseq -ta $tcpack -tt $tcpoff -tr $tcphead -tfe r -tfc r -tfu r -tfa r -tfp r -tfr r -tfs r -tff r -tw $tcpwindow -tc $tcpcheck -tu $tcpurgpoint -p bgp -bm $HEX0":"$HEX1":"$HEX2":"$HEX":"$HEX4":"$HEX5 -bl $bgplen -bt $bgptype -bo $bgpversion":"$bgpas":"$bgptime":"$bgpid":"$bgpoptlen

fi

if [ "$tool" = 4 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p udp -us $udpsource -ud $udpdest -ul $udplen -uc $udpchecks 
fi

if [ "$tool" = 5 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p udp -us $udpsource -ud 53 -ul $udplen -uc $udpchecks -p ntp -nl $ntpleap -ns $ntpstat -nt $ntptype -np $ntppre -ne $ntperror -nd $ntpdrift -nr $ntpid -nf $ntptime -no $ntptimeb -na $ntptimec -nx $ntptimed
fi

if [ "$tool" = 6 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p udp -us $udpsource -ud 123 -ul $udplen -uc $udpchecks -p ntp -nl $ntpleap -ns $ntpstat -nt $ntptype -np $ntppre -ne $ntperror -nd $ntpdrift -nr $ntpid -nf $ntptime -no $ntptimeb -na $ntptimec -nx $ntptimed
fi

if [ "$tool" = 7 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p icmp -ct $icmptype -cd $icmpcode -cc $icmpcheck
fi

if [ "$tool" = 8 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p udp -us $udpsource -ud 520 -ul $udplen -uc $udpchecks -p rip -rv $ripV -rc $ripc -re $ripfamily":"$riptag":""${des[$desx]}"":"$ripsub1":"$ripsub2":"$ripsub3":"$ripsub4":"$ripmetric
fi

if [ "$tool" = 9 ] ;
then
sendip -v "${des[$desx]}" -p ipv4 -is $ip1"."$ip2"."$ip3"."$ip4 -id "${des[$desx]}" -ih 21 -iv 4 -iy 0 -il $ipv4len -ii $ipv4data -ifr $ipv4offset -it $tdata -p udp -us $udpsource -ud 520 -ul $udplen -uc $udpchecks -p ripng -Rv $ripV -Rc $ripc -Rr 0 -Re $ripfamily":"$riptag":""${des[$desx]}"":"$ripsub1":"$ripsub2":"$ripsub3":"$ripsub4":"$ripmetric
fi

if [ "$tool" = 10 ] ;
then
mz eth1 -B mydns-server.com -t dns "q=www.ds.unipi.gr, a=$dnsip1.$dnsip2.$dnsip3.$dnsip4" -A $ip1"."$ip2"."$ip3"."$ip4 -B "${des[$desx]}"

fi
if [ "$tool" = 11 ] ;
then
mz eth1 -A $ip1"."$ip2"."$ip3"."$ip4 -B "${des[$desx]}" -t tcp "sp=$SPORT, dp=$DPORT, flags="${FLAG[$FLAGRAND]}", s=$MZTCPS , a=$MZTCPA , win=$MZTCPWIN , urg=$MZTCPURG , sum=$MZTCPSUM" -P $MZTCPPAYLOAD
fi

if [ "$tool" = 12 ] ;
then
mz eth1 -A $ip1"."$ip2"."$ip3"."$ip4 -B "${des[$desx]}" -t tcp "sp=80, dp=80, flags="${FLAG[$FLAGRAND]}", s=$MZTCPS , a=$MZTCPA , win=$MZTCPWIN , urg=$MZTCPURG , sum=$MZTCPSUM" -P $MZTCPPAYLOAD
fi

if [ "$tool" = 13 ] ;
then
mz eth1 -A $ip1"."$ip2"."$ip3"."$ip4 -B "${des[$desx]}" -t udp "sp=$SPORT, dp=$DPORT, len=$MZUDPLEN , sum=$MZUDPSUM" -P $MZUDPPAYLOAD
fi

if [ "$tool" = 14 ] ;
then
mz eth1 -t icmp ""${ICMPNAME[$ICMPNAMERAND]}",code=$MZICMPCODE, gw=$MZICMPGATEWAY1"."$MZICMPGATEWAY2"."$MZICMPGATEWAY3"."$MZICMPGATEWAY4 , id=$MZICMPID, seq=$MZICMPSEQ" -A $ip1"."$ip2"."$ip3"."$ip4 -B "${des[$desx]}"
fi

if [ "$tool" = 15 ] ;
then
mz eth1 -t ip -c 1 -A $ip1"."$ip2"."$ip3"."$ip4 -B "${des[$desx]}" "len=$MZIPLEN,sum=$MZIPSUM,tos=$MZIPTOS,dscp=$MZIPDSCP,ttl=$MZIPTTL,proto=$MZIPPROTO,"${IPFRAG[$MZIPFRAG]}",id=$MZIPID"
fi

if [ "$tool" = 16 ] ;
then
yersinia stp -attack 0 -version $stpversion -flags $stpflags -id $stpid -cost $stpcost -portid $stpportid -message $stpmessage -max-age $stpmax -hello $stphello -forward $stpforward -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}" -interface eth1 -type $stptype
fi

if [ "$tool" = 17 ] ;
then
yersinia cdp -attack 0 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}" -ttl $cdpttl -version $cdpversion
xdotool key a
fi

if [ "$tool" = 18 ] ;
then
yersinia hsrp -attack 0 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}"
xdotool key c
fi

if [ "$tool" = 19 ] ;
then
yersinia dhcp -attack 0 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}"
xdotool key d
fi

if [ "$tool" = 20 ] ;
then
yersinia dtp -attack 0 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}"
xdotool key e
fi

if [ "$tool" = 21 ] ;
then
 if [ "$randx" = 0 ] ; 
 then
  yersinia vtp -attack 0 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}" 
  xdotool key g
 
 elif [ "$randx" = 1 ] ; 
 then
  yersinia vtp -attack 2 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}" 
  xdotool key f
 
 elif [ "$randx" = 2 ] ; 
 then
  yersinia vtp -attack 3 -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}" 
  xdotool key h
 fi
fi

if [ "$tool" = 22 ] ;
then
yersinia dot1q -attack $qattack -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}" 
xdotool key u
fi

if [ "$tool" = 23 ] ;
then
yersinia dot1x -attack $qattack -source "${HEX[$hexrand]}" -dest "${HEXZ[$hexrand]}"
xdotool key o
fi


# Attributes που φέρει ο HPING generator

loops=$[$RANDOM % 3]
hpingsport=$[$RANDOM % 65535]
hpingdport=$[$RANDOM % 65535]
type=$[$RANDOM % 2]
hpingw=$[$RANDOM]
hpingo=$[$RANDOM]
hpingm=$[$RANDOM]
hpingl=$[$RANDOM]
hpinge=$[$RANDOM]
hpingt=$[$RANDOM]
hpingn=$[$RANDOM]
hpingh=$[$RANDOM]
hpingg=$[$RANDOM]
hpingmip=$[$RANDOM]
hpingeoip=$[$RANDOM]
hpingc=$[$RANDOM % 41]
hpingk=$[$RANDOM]
hpingver=$[$RANDOM]
hpinglen=$[$RANDOM]
hpingid=$[$RANDOM]
hpingproto=$[$RANDOM % 100]
hpingcheck=$[$RANDOM]

# Νέος αριθμός επαναλήψεων

p=$[$RANDOM % 20]

# Διευθύνσεις IP πηγής και προορισμού

IPx2=$[$RANDOM % 16]
desx2=$[$RANDOM % 20]

# Attributes που φέρει ο NPING generator

npingflag=$[$RANDOM % 8]
npingack=$[$RANDOM]
npingwin=$[$RANDOM]
npingseq=$[$RANDOM]
npingsport=$[$RANDOM % 65535]
npingdport=$[$RANDOM % 65535]
npingttl=$[$RANDOM]
npingid=$[$RANDOM]
npingdatalen=$[$RANDOM]
npingdatastring=$[$RANDOM]
npingdata=$[$RANDOM]
npingdelay=$[$RANDOM]
npingrate=$[$RANDOM]
npingtos=$[$RANDOM]

# Τυχαίες MAC διευθύνσεις πηγής και προορισμού

HEX6=$[$RANDOM % 77]
HEX7=$[$RANDOM % 77]
HEX8=$[$RANDOM % 77]
HEX9=$[$RANDOM % 77]
HEX10=$[$RANDOM % 77]
HEX11=$[$RANDOM % 77]
HEX12=$[$RANDOM % 77]
HEX13=$[$RANDOM % 77]
HEX14=$[$RANDOM % 77]
HEX15=$[$RANDOM % 77]
HEX16=$[$RANDOM % 77]
HEX17=$[$RANDOM % 77]

# Χαρακτηριστικά ICMP πακέτου για το NPING

npingicmptype=$[$RANDOM % 20]
npingicmpseq=$[$RANDOM]
npingicmprecv=$[$RANDOM]
npingicmptrans=$[$RANDOM]
npingicmportime=$[$RANDOM]
npingicmpparam=$[$RANDOM]
npingicmpadvert=$[$RANDOM]
npingicmpprefix=$[$RANDOM % 64]
npingip1=$[$RANDOM % 255]
npingip2=$[$RANDOM % 255]
npingip3=$[$RANDOM % 255]
npingip4=$[$RANDOM % 255]
ip5=$[$RANDOM % 255]
ip6=$[$RANDOM % 255]

ip7=$[$RANDOM % 255]

ip8=$[$RANDOM % 255]

if [ "$p" = 1 ] ; then
hping2  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 80 -d 80 -c $loops -k -w $hpingw -O $hpingo -b -M $hpingm -L $hpingl -F -S -R -P -A -U -X -Y -S -u -e $hpinge
fi

if [ "$p" = 2 ] ;
then
hping2 "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -c $loops -k -w $hpingw -O $hpingo -M $hpingm -L $hpingl -A -U -X -Y -S -u -e $hpinge
fi

if [ "$p" = 3 ] ;
then
hping2  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 53 -d 53 -c $loops -k -w $hpingw -O $hpingo -b -M $hpingm -L $hpingl -F -S -X -Y -S -u -e $hpinge
fi

if [ "$p" = 4 ] ; then
hping2 -$type "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 73 -d 73 -c $loops -k -w $hpingw -O $hpingo -b -M $hpingm -L $hpingl -S -R -A -X -Y -S -u -e $hpinge 
fi

if [ "$p" = 5 ] ; then
hping2  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 53 -d 53 -c $loops -k -w $hpingw -O $hpingo -b -M $hpingm -L $hpingl -S -A -U -S -u -e $hpinge
fi

if [ "$p" = 6 ] ; then
hping2  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 7 -d 7 -c $loops -k -w $hpingw -O $hpingo -M $hpingm -L $hpingl -P -A -U -X -Y -S -u -e $hpinge
fi

if [ "$p" = 7 ] ; then
hping2 -1 -c $loops  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8  -K $hpingk --icmp-ipver $hpingver --icmp-iphlen $hpinglen --icmp-iplen $hpinglen --icmp-ipid $hpingid --icmp-ipproto $hpingproto --icmp-cksum $hpingcheck 
fi

if [ "$p" = 8 ] ; then
hping2  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 23 -d 23 -c $loops -k -w $hpingw -O $hpingo -b -M $hpingm -L $hpingl -R -P -X -Y -S -u -e $hpinge
fi

if [ "$p" = 9 ] ; then
hping2 -$type "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8 -s 28 -d 28 -c $loops -k -w $hpingw -O $hpingo -b -M $hpingm -L $hpingl -F -A -U -X -Y -S -u -e $hpinge 
fi

if [ "$p" = 10 ] ; then
hping2 "${des[$desx2]}" -0 -a $ip5"."$ip6"."$ip7"."$ip8 -c $loops -t $hpingt -N $hpingn -H $hpingh -r -f -x -g $hpingg -m $hpingmip -o $hpingeoip -G
fi

if [ "$p" = 11 ] ; then
hping2 -1 -c $loops  "${des[$desx2]}" -a $ip5"."$ip6"."$ip7"."$ip8  -K $hpingk
fi

if [ "$p" = 12 ] ; then
hping2 -1 -c $loops  "${des[$desx2]}"  -a $ip5"."$ip6"."$ip7"."$ip8  -K $hpingk --icmp-ipver $hpingver --icmp-iphlen $hpinglen --icmp-iplen $hpinglen --icmp-ipid $hpingid --icmp-ipproto $hpingproto --icmp-cksum $hpingcheck --icmp-ts --icmp-addr -C $hpingc
fi

if [ "$p" = 13 ] ; then
hping2 -2 "${des[$desx2]}"  -a $ip5"."$ip6"."$ip7"."$ip8 -s 179 -d 179 -c $loops -k -w $hpingw -O $hpingo -M $hpingm -L $hpingl -A -U -X -Y -S -u -e $hpinge

fi

if [ "$p" = 14 ] ; then
hping2 -2 "${des[$desx2]}"  -a $ip5"."$ip6"."$ip7"."$ip8 -s 179 -d 179 -c $loops -k -w $hpingw -O $hpingo -M $hpingm -L $hpingl -A -U -X -Y -S -u -e $hpinge

fi

if [ "$p" = 15 ] ; then
nping --tcp -p $npingdport -g $npingsport -c 1 --flags "${FLAG[$npingflag]}" --seq $npingseq --win $npingwin --badsum --ack $npingack --ttl 2 --id 23 --df --dest-ip "${des[$desx2]}" --source-ip $ip5"."$ip6"."$ip7"."$ip8 --dest-mac $HEX6":"$HEX7":"$HEX8":"$HEX9":"$HEX10":"$HEX11 --source-mac $HEX11":"$HEX12":"$HEX13":"$HEX14":"$HEX15":"$HEX16 --data-length $npingdatalen --data-string $npingdatastring --data $npingdata --tos $npingtos
fi

if [ "$p" = 16 ] ; then
nping --tcp -p $npingdport -g $npingsport -c 1 --flags "${FLAG[$npingflag]}" --seq $npingseq --win $npingwin --ack $npingack --ttl $npingttl --id $npingid --mf --dest-ip "${des[$desx2]}" --source-ip $ip5"."$ip6"."$ip7"."$ip8 --dest-mac $HEX6":"$HEX7":"$HEX8":"$HEX9":"$HEX10":"$HEX11 --source-mac $HEX11":"$HEX12":"$HEX13":"$HEX14":"$HEX15":"$HEX16 --data-length $npingdatalen --data-string $npingdatastring --data $npingdata --delay $npingdelay"ms" --rate $npingrate --tos $npingtos
fi

if [ "$p" = 17 ] ; then
nping --tcp-connect -p $npingdport -g $npingsport -c 1 --flags "${FLAG[$npingflag]}" --seq $npingseq --win $npingwin --ack $npingack --ttl $npingttl --id $npingid --mf --dest-ip "${des[$desx2]}" --source-ip $ip5"."$ip6"."$ip7"."$ip8 --dest-mac $HEX6":"$HEX7":"$HEX8":"$HEX9":"$HEX10":"$HEX11 --source-mac $HEX11":"$HEX12":"$HEX13":"$HEX14":"$HEX15":"$HEX16 --data-length $npingdatalen --data-string $npingdatastring --data $npingdata --delay $npingdelay"ms" --tos $npingtos
fi

if [ "$p" = 18 ] ; then
nping --udp -p $npingdport -g $npingsport -c 1 --ttl $npingttl --id $npingid --df --badsum --dest-ip "${des[$desx2]}" --source-ip $ip5"."$ip6"."$ip7"."$ip8 --dest-mac $HEX6":"$HEX7":"$HEX8":"$HEX9":"$HEX10":"$HEX11 --source-mac $HEX11":"$HEX12":"$HEX13":"$HEX14":"$HEX15":"$HEX16 --data-length $npingdatalen --data-string $npingdatastring --data $npingdata --delay $npingdelay"ms" --tos $npingtos
fi

if [ "$p" = 19 ] ; then
nping --udp -p $npingdport -g $npingsport -c 1 --ttl $npingttl --id $npingid --dest-ip "${des[$desx2]}" --source-ip $ip5"."$ip6"."$ip7"."$ip8 --dest-mac $HEX6":"$HEX7":"$HEX8":"$HEX9":"$HEX10":"$HEX11 --source-mac $HEX11":"$HEX12":"$HEX13":"$HEX14":"$HEX15":"$HEX16 --data-length $npingdatalen --data-string $npingdatastring --data $npingdata --delay $npingdelay"ms" --rate $npingrate --tos $npingtos
fi

if [ "$p" = 20 ] ; then
nping --icmp -c 1 --ttl $npingttl --id $npingid --icmp-type $npingicmptype --delay $npingdelay"ms" -dest-ip "${des[$desx2]}" --icmp-id 34 -source-ip $ip5"."$ip6"."$ip7"."$ip8 --icmp-seq $npingicmpseq --icmp-redirect-addr $npingip1"."$npingip2"."$npingip3"."$npingip4 --icmp-param-pointer $npingicmpparam --icmp-advert-lifetime $npingicmpadvert --icmp-advert-entry $npingip1"."$npingip2"."$npingip3"."$npingip4","$npingicmpprefix --icmp-orig-time $npingicmportime --icmp-recv-time $npingicmprecv --icmp-trans-time $npingicmptrans
fi

# Επιλογές που αφορούν το NIDS signature testing

wakeupnum=$[$RANDOM]
wakeupttl=$[$RANDOM]
sneezecounter=$[$RANDOM]
sneezeport=$[$RANDOM % 65535]
snotdelay=$[$RANDOM]
snotnum=$[$RANDOM]
sticksc=$[$RANDOM % 255]
sticksc2=$[$RANDOM % 255]
sticksc3=$[$RANDOM % 255]
sticksr=$[$RANDOM % 255]
sticksr2=$[$RANDOM % 255]
sticksr3=$[$RANDOM % 255]
sticksr4=$[$RANDOM % 255]
stickdr=$[$RANDOM % 255]
stickdr2=$[$RANDOM % 255]
stickdr3=$[$RANDOM % 255]
stickdr4=$[$RANDOM % 255]
stickdc=$[$RANDOM % 255]
stickdc2=$[$RANDOM % 255]
stickdc3=$[$RANDOM % 255]

# Εκκίνηση IDSwakeup για παραγωγή επιθέσεων 

if [ "$p" = 21 ] ; then
./IDSwakeup $ip5"."$ip6"."$ip7"."$ip8 "${des[$desx]}" $wakeupnum $wakeupttl
fi

# Χρήση Sneeze και εισαγωγή ruleset σε αυτό

if [ "$p" = 22 ] ; then
./sneeze.pl -d "${des[$desx]}" -c $sneezecounter -f /usr/local/snort/community-rules/community.rules -i eth1 -s $ip5"."$ip6"."$ip7"."$ip8 -x -p $sneezeport 
fi

# Χρήση Snot και εισαγωγή ruleset σε αυτό

if [ "$p" = 23 ] ; then
./snot -r /usr/local/snort/community-rules/community.rules -s $ip5"."$ip6"."$ip7"."$ip8 -d "${des[$desx]}" -n $snotnum -l $snotdelay -p $sneezeport 
fi

# Command-line παράμετροι για το Stick

if [ "$p" = 24 ] ; then
./stick sH $ip5"."$ip6"."$ip7"."$ip8 sC $sticksc"."$sticksc2"."$sticksc3".0" sR $sticksr"."$sticksr2"."$sticksr3"."$sticksr4 dH "${des[$desx]}" dC $stickdc"."$stickdc2"."$stickdc3".0" dR $stickdr"."$stickdr2"."$stickdr3"."$stickdr4
fi

epbfile=$[$RANDOM]
epbsize=$[$RANDOM]
epbinterval=$[$RANDOM]
epbdelay=$[$RANDOM]
epbamount=$[$RANDOM]
epbverion=$(( ( RANDOM % 2 )  + 1 ))
epbether=$[$RANDOM % 100]

# Ethernet packet bombardier

if [ "$p" = 25 ] ; then
epb -v -H -S $epbfile -n eth1 -t "${des[$desx]}" -s $epbsize -j -i -u $epbinterval -F $epbversion -a $epbamount -d $epbdelay -C "${HEX[$hexrand]}" -T "${HEXZ[$hexrand]}" -E $epbether
fi

packethfile=$[$RANDOM]
packethdelay=$[$RANDOM]
packethnumber=$[$RANDOM]
packeths1=$[$RANDOM]
packeths2=$[$RANDOM]
packeths3=$[$RANDOM]
packethperiod=$[$RANDOM]

if [ "$p" = 26 ] ; then
./packETHcli -i eth1 -m 1 -f $packethfile".pcap"   
fi

if [ "$p" = 27 ] ; then
./packETHcli -i eth1 -m 2 -d $packethdelay -n $packethnumber -s "$packeths1 $packeths2 $packeths3" -p $packethperiod -f $$packethfile".pcap"   
fi

if [ "$p" = 28 ] ; then
./packETHcli -i eth1 -m 3 -f $packethfile".pcap" 
fi

# scapysend.py
#
# #! /usr/bin/env python
# from scapy.all import *
# send(IP(dst="1.2.3.4")/ICMP())
# sendp(Ether()/IP(dst="100.0.0.5",ttl=(1,4)),
# iface="eth1")

if [ "$p" = 29 ] ; then
chmod +x scapysend.py
./scapysend.py   
fi

# scapysendrec.py
#
# #! /usr/bin/env python
# from scapy.all import *
# ans,unans=sr(IP(dst="120.0.0.4",ttl=5)/ICMP())
# ans.nsummary()
# unans.nsummary()
# p=sr1(IP(dst="100.0.0.2")/ICMP()/"XXXXXX")
# p.show()

if [ "$p" = 30 ] ; then
chmod +x scapysendrec.py
./scapysendrec.py   
fi

# scapysr.py
#
# #! /usr/bin/env python
# import sys
# from scapy.all import sr1,IP,ICMP
# 
# p=sr1(IP(dst=sys.argv[1])/ICMP())
# if p:
# p.show()


if [ "$p" = 31 ] ; then
chmod +x scapysr.py
./scapysr.py "${des[$desx]}"   
fi

# arping2tex.py
#
# #! /usr/bin/env python
# from scapy.all import srp,Ether,ARP,conf
# 
# if len(sys.argv) != 2:
#   print "Usage: arping2tex <net>\n eg: arping2text 100.0.0.1/24"
#   sys.exit(1)
#
# conf.verb=0
# ans,unans=srp(Ether(dst="ff:ff:ff:ff:ff:ff")/ARP(pdst=sys.argv[1]), 
# timeout=2)
# 
# print r"\begin{tabular}{|l|l|}"
# print r"\hline"
# print r"MAC & IP\\"
# print r"\hline"
# for snd,rcv in ans:
#   print rcv.sprintf(r"%Ether.src% & %ARP.psrc%\\")
# print r"\hline"
# print r"\end{tabular}"

if [ "$p" = 32 ] ; then
chmod +x arping2tex.py
./arping2tex.py 
fi

# rule2alert για παραγωγή κακόβουλης κυκλοφορίας

rule2alertsid=$[$RANDOM]
rule2alertnum=$[$RANDOM]

if [ "$p" = 33 ] ; then
python r2a.py -f /usr/local/snort/community-rules/community.rules -c /usr/local/snort/etc/snort.conf -m $ip5"."$ip6"."$ip7"."$ip8 -e "${des[$desx]}" -w /home/fanis/Desktop/awesome.pcap -s $rule2alertsid -n $rule2alertnum -t
fi

if [ "$p" = 34 ] ; then
python r2a.py -f /usr/local/snort/rules/dos.rules -m $ip5"."$ip6"."$ip7"."$ip8 -e "${des[$desx]}" -w /home/fanis/Desktop/awesome.pcap -s $rule2alertsid -n $rule2alertnum
fi

if [ "$p" = 35 ] ; then
python r2a.py -f /usr/local/snort/rules/blacklist.rules -c /usr/local/snort/etc/snort.conf -m $ip5"."$ip6"."$ip7"."$ip8 -e "${des[$desx]}" -w /home/fanis/Desktop/awesome.pcap -s $rule2alertsid -n $rule2alertnum -t
fi

if [ "$p" = 36 ] ; then
python r2a.py -f /usr/local/snort/rules/dns.rules -c /usr/local/snort/etc/snort.conf -m $ip5"."$ip6"."$ip7"."$ip8 -e "${des[$desx]}" -w /home/fanis/Desktop/awesome.pcap -s $rule2alertsid -n $rule2alertnum -t
fi

bitwists=$[$RANDOM]
bitwistl=$[$RANDOM]
bitwistc=$[$RANDOM]
bitwistm=$[$RANDOM]
bitwistr=$[$RANDOM]
bitwistp=$[$RANDOM]

if [ "$p" = 37 ] ; then
bittwist -i eth1 /home/fanis/Desktop/031120130168.pcap -v -s $bitwists -l $bitwistl -c $bitwistc -m $bitwistm -r $bitwistr -p $bitwistp -h
fi

pfsendg=$[$RANDOM]
pfsendl=$[$RANDOM]
pfsendn=$[$RANDOM]
pfsendr=$[$RANDOM]
pfsendb=$[$RANDOM]
pfsendw=$[$RANDOM]

if [ "$p" = 38 ] ; then
pfsend -i eth1 -a -f 0101011101.pcap -g $pfsendg -l $pfsendl -n $pfsendn -r $pfsendr -b $pfsendb -w $pfsendw -h
fi

done



