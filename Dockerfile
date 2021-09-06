FROM debian:buster-slim

RUN apt-get update && \
    apt-get -y install --no-install-recommends curl gnupg software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

RUN apt-get update && apt-get -y  --no-install-recommends install vault && \
    apt-get -y remove curl gnupg software-properties-common && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["vault", "agent", "-config=/etc/vault-agent/agent.hcl"]