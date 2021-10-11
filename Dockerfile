FROM alpine:latest

ARG TERRAFORM_VERSION="1.0.7"
ARG ANSIBLE_VERSION="2.9.26"
ARG PACKER_VERSION="1.7.5"
ARG AWSCLI_VERSION="1.20.49"

LABEL maintainer="urg <patrick@urg.name>"
LABEL terraform.version=${TERRAFORM_VERSION}
LABEL ansible.version=${ANSIBLE_VERSION}
LABEL aws-cli.version=${AWSCLI_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ENV AWSCLI_VERSION=${AWSCLI_VERSION}
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
ENV PACKER_VERSION=${PACKER_VERSION}
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION}

RUN apk add --no-cache \
        python3 \
        py3-pip \
        ansible \
        curl \
        unzip \
    && pip3 install --upgrade pip \
    && pip3 install --upgrade awscli==${AWSCLI_VERSION} \
    && pip3 install --upgrade ansible==${ANSIBLE_VERSION} \
    && pip3 install crudini \
    && rm -rf /var/cache/apk/* \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && curl -LO https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && rm *.zip

CMD    ["/bin/bash"]