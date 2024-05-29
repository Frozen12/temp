FROM alpine:3.20.0

# Install required packages
RUN apk --no-cache add curl bash tar wget su-exec

WORKDIR /opt/alist/

# Download and extract alist
RUN wget "https://github.com/alist-org/alist/releases/download/v3.35.0/alist-linux-amd64.tar.gz" -P "/opt/alist/" && \
    tar -zxvf /opt/alist/alist-linux-amd64.tar.gz && \
    chmod +x /CMD [ "./alist", "server", "--no-prefix" ]

EXPOSE 5244

# Copy the entrypoint script into the container
COPY entrypoint.sh /opt/alist/entrypoint.sh
RUN chmod +x /opt/alist/entrypoint.sh

# Use the entrypoint script
CMD [ "/opt/alist/alist", "server", "--no-prefix" ]
