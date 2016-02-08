#!/bin/sh

# If CONSUL_AGENT_ADVERTISE is set to an interface name,
# resolve the IP address of that interface.
if [ -d "/sys/class/net/$CONSUL_AGENT_ADVERTISE" ]; then
  CONSUL_AGENT_ADVERTISE=$(ip a ls dev $CONSUL_AGENT_ADVERTISE | 
                           sed -n 's,.*inet \(.*\)/.*,\1,p')
fi

EXTRA_ARGS=""
for FLAG in $(env | grep -i ^consul_$1_ | tr "A-Z_" "a-z-" | cut -d- -f3-); do
  EXTRA_ARGS="$EXTRA_ARGS -$FLAG"
done

echo "Command-line arguments: $@"
echo "Environment arguments: $EXTRA_ARGS"
echo "Starting consul."
exec consul "$@" $EXTRA_ARGS
