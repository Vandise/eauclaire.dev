read ns1
read ns2
read ns3
read ns4

godaddy_key="$1"
godaddy_secret="$2"

exit 0

ns1="$ns1" | cut -c 3-
echo "\n\n $ns1 \n\n"

# remove commas
ns1="${ns1::${#ns1}-1}"
ns1=$ns1 | cut -c 3-
ns2="${ns2::${#ns2}-1}"
ns3="${ns3::${#ns3}-1}"

data="[{\"type\":\"NS\",\"name\":\"@\",\"data\":\"$ns2\",\"ttl\":3600},{\"type\":\"NS\",\"name\":\"@\",\"data\":\"$ns3\",\"ttl\":3600},{\"type\":\"NS\",\"name\":\"@\",\"data\":\"$ns4\",\"ttl\":3600}]"

curl -X PUT -H "Content-type: application/json" -H "Authorization: sso-key $godaddy_key:$godaddy_secret" -d ${data} "https://api.godaddy.com/v1/domains/eauclaire.dev/records/NS"