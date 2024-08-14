@echo off
setlocal

echo build start

rem speedtest_windows_386
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=386
go build -ldflags="-w -s" -trimpath -o speedtest_windows_386.exe

rem speedtest_windows_amd64
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=amd64
go build -ldflags="-w -s" -trimpath -o speedtest_windows_amd64.exe

rem speedtest_windows_arm64
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=arm64
go build -ldflags="-w -s" -trimpath -o speedtest_windows_arm64.exe

rem speedtest_darwin_amd64
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=amd64
go build -ldflags="-w -s" -trimpath -o speedtest_darwin_amd64

rem speedtest_darwin_arm64
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=arm64
go build -ldflags="-w -s" -trimpath -o speedtest_darwin_arm64

rem speedtest_linux_386
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags="-w -s" -trimpath -o speedtest_linux_386

rem speedtest_linux_amd64
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -ldflags="-w -s" -trimpath -o speedtest_linux_amd64

rem speedtest_linux_arm
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=arm
go build -ldflags="-w -s" -trimpath -o speedtest_linux_arm

rem speedtest_linux_arm64
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=arm64
go build -ldflags="-w -s" -trimpath -o speedtest_linux_arm64

rem speedtest_linux_mips
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=mips
go build -ldflags="-w -s" -trimpath -o speedtest_linux_mips

rem speedtest_linux_mipsle
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=mipsle
go build -ldflags="-w -s" -trimpath -o speedtest_linux_mipsle

rem speedtest_linux_mips64
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=mips64
go build -ldflags="-w -s" -trimpath -o speedtest_linux_mips64

rem speedtest_linux_mips64le
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=mips64le
go build -ldflags="-w -s" -trimpath -o speedtest_linux_mips64le

echo build success
pause
