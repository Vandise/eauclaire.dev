domain="$4"                                 # domain to update
type="A"                                    # Record type A, CNAME, MX, etc.
name="@"                                    # name of record to update
ttl="600"                                   # Time to Live min value 600
port="1"                                    # Required port, Min value 1
weight="1"                                  # Required weight, Min value 1
key="$1"                                    # key for godaddy developer API
secret="$2"                                 # secret for godaddy developer API
ip="$3"

headers="Authorization: sso-key $key:$secret"

curl -X PUT "https://api.godaddy.com/v1/domains/$domain/records/$type/$name" \
-H "accept: application/json" \
-H "Content-Type: application/json" \
-H "$headers" \
-d "[ { \"data\": \"$ip\", \"port\": $port, \"priority\": 0, \"protocol\": \"string\", \"service\": \"string\", \"ttl\": $ttl, \"weight\": $weight } ]"