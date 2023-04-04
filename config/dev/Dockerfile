FROM elixir:1.14-alpine

ARG MIX_ENV="dev"
ENV MIX_ENV="${MIX_ENV}"

# Build args
ARG PHOENIX_VERSION=1.6.15

# Install alpine packages
RUN apk add build-base bash git inotify-tools nodejs-current npm yarn postgresql-client

# Checkout private repos
RUN apk add --update openssh

# Install Phoenix packages
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new #{PHOENIX_VERSION}

# App Directory
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Install devtools
RUN touch .zshrc
RUN apk add zsh zsh-autosuggestions zsh-syntax-highlighting vim bind-tools curl && \
    rm -rf /var/cache/apk/*
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
RUN echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# convenience aliases
# bp: branch prune; nxt: next story
RUN echo "bp() { git branch | grep \${1:-steve}/ | xargs git branch -D; }" >> ~/.zshrc
RUN echo "nxt() { git fetch --prune; git checkout develop && git pull; git checkout -b \$1; }" >> ~/.zshrc

SHELL ["/bin/zsh", "-c"]

EXPOSE 4000

CMD ["sh", "-c", "/${APP_HOME}/config/${MIX_ENV}/entrypoint.sh"]
