FROM nginx:1.18
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get update -y && apt-get install -y git curl nodejs && curl -sL https://github.com/gohugoio/hugo/releases/download/v0.72.0/hugo_extended_0.72.0_Linux-64bit.tar.gz | tar -xz hugo && mv hugo /usr/bin && npm i -g postcss-cli postcss autoprefixer
RUN git clone https://github.com/MicrosoftDocs/mslearn-aks-deploy-container-app /contoso-website
WORKDIR /contoso-website/src
RUN git submodule update --init themes/introduction
RUN hugo && mv public/* /usr/share/nginx/html
EXPOSE 80
