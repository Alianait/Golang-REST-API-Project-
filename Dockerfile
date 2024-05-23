FROM golang:1.19.0

WORKDIR /usr/src/app

# Install Air
RUN go install github.com/cosmtrek/air@latest

# Copy go.mod and go.sum first for caching dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application
COPY . .

# Copy Air configuration
COPY .air.toml .

# Set the Air command as the default command
CMD ["air"]
