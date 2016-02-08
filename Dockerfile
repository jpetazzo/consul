FROM voxxit/consul
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD []
ENV CONSUL_AGENT_ADVERTISE=eth0
ENV CONSUL_AGENT_CLIENT=0.0.0.0
ENV CONSUL_AGENT_DATA_DIR=/data
ENV CONSUL_AGENT_UI_DIR=/ui
