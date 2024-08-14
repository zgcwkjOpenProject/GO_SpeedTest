package main

import (
	"fmt"
	"net/http"
	"strconv"
)

func speedTestHandler(w http.ResponseWriter, r *http.Request) {
	// 获取查询参数 l
	lengthStr := r.URL.Query().Get("l")
	if lengthStr == "" {
		// 默认10Mb
		lengthStr = "10"
	}
	// 转换为 int64
	lengthMB, err := strconv.ParseInt(lengthStr, 10, 64)
	if err != nil || lengthMB <= 0 {
		http.Error(w, "Invalid 'l' parameter", http.StatusBadRequest)
		return
	}
	// 将长度从MB转换为字节
	lengthBytes := lengthMB * 1024 * 1024
	// 设置响应头
	w.Header().Set("Content-Type", "application/octet-stream")
	w.Header().Set("Content-Length", fmt.Sprintf("%d", lengthBytes))
	// 10MB 的缓冲区
	data := make([]byte, 10*1024*1024)
	// 计算需要写入的次数
	iterations := lengthBytes / int64(len(data))
	remainder := lengthBytes % int64(len(data))
	// 写入完整的1MB块
	for i := int64(0); i < iterations; i++ {
		if _, err := w.Write(data); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	}
	// 写入剩余的数据
	if remainder > 0 {
		if _, err := w.Write(data[:remainder]); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	}
}

func main() {
	http.HandleFunc("/st", speedTestHandler)
	fmt.Println("Starting server on :21881")
	if err := http.ListenAndServe(":21881", nil); err != nil {
		fmt.Println("Error starting server:", err)
	}
}
