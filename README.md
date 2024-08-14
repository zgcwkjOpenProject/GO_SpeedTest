# 测速站

搭建属于自己的测速网站，在局域网或广域网中，测试网络传输速度。

## 接口

- 地址：http://127.0.0.1:21881/st?l=10
- 参数 l：数据大小，单位MB

## Golang

Env
```
export CGO_ENABLED=0
export GOOS=linux 
export GOARCH=mipsle

export CGO_ENABLED=0
export GOOS=windows
export GOARCH=amd64

export CGO_ENABLED=0
export GOOS=darwin
export GOARCH=amd64
```

Build
```
go run main.go

go build

go build -ldflags="-w -s" -trimpath
```
