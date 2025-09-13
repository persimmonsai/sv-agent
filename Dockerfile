FROM verilator/verilator

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        verilator \
        git \
        curl \
        build-essential \
        openssh-client \
        bash \
        python3 \
        python3-pip \
		python3-virtualenv


# Install Rust using rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"


WORKDIR /workspace

# Clone and install bender
RUN git clone https://github.com/pulp-platform/bender.git /opt/bender \
	&& cd /opt/bender \
	&& cargo install --path .



