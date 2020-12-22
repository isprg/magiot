./rsrc.exe -ico magiot-bash.ico -o magiot-bash.syso
GOOS=windows GOARCH=amd64 go build -ldflags -H=windowsgui