FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y --no-install-recommends \
	libgl1 libglib2.0-0 \
	python3 python3-venv \
	git \
	wget \
	vim \
	inetutils-ping \
	sudo \
	net-tools \
	iproute2 \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Prepare a non-root user
RUN adduser --system worker
WORKDIR /home/worker/app

COPY --chown=worker . .

RUN chown -R worker /home/worker

# setup venv in /venv to avoid conflict
RUN echo 'venv_dir=/home/worker/app/venv' > webui-user.sh

ENV install_dir=/
USER worker

ENV VIRTUAL_ENV=/home/worker/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

EXPOSE 7860
EXPOSE 7861
EXPOSE 7862

CMD ["python3", "launch.py", "--listen"]