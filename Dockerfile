FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Minsk \
    POKEBOT_SKIP_REQUIREMENTS=1 \
    BOT_PROFILE=moses \
    BOT_MODE=Starters

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libmgba-dev \         
        libportaudio2 \
        python3-tk \
        tzdata && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
        mgba==0.10.2 \        
        confz==2.0.1 \
        numpy~=2.1.0 \
        setuptools \
        ruamel.yaml~=0.18.2 \
        pypresence~=4.3.0 \
        obsws-python~=1.6.0 \
        discord-webhook~=1.2.1 \
        rich~=13.5.2 \
        cffi~=1.17.1 \
        Pillow~=10.4.0 \
        sounddevice~=0.4.6 \
        pyperclip3~=0.4.1 \
        plyer~=2.1.0 \
        notify-py~=0.3.42 \
        apispec~=6.3.0 \
        ttkthemes~=3.2.2 \
        darkdetect~=0.8.0 \
        show-in-file-manager~=1.1.4 \
        aiohttp~=3.10.9 \
        aiortc~=1.10.0

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
WORKDIR /app
COPY pokebot-gen3/ .

ENTRYPOINT ["entrypoint.sh"]
