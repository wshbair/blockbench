#!/bin/bash
ip_addr=$1
ETH_DATA=/home/luxbch/data/
    
geth --datadir=$ETH_DATA --rpc --rpcaddr 0.0.0.0 --rpcport "8000" --rpccorsdomain "*" --gasprice 0 --networkid 9119 --unlock 0 --password <(echo -n "") js <(echo 'console.log(admin.nodeInfo.enode);') 2>/dev/null |grep enode | perl -pe "s/\[\:\:\]/$ip_addr/g" | perl -pe "s/^/\"/; s/\s*$/\"/;"

#export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
