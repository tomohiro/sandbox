package main

import (
	"fmt"
	"os"
	"time"

	"github.com/Tomohiro/go-gyazo/gyazo"
)

func main() {
	token := os.Getenv("GYAZO_ACCESS_TOKEN")
	if token == "" {
		fmt.Fprintf(os.Stderr, "Please set the access token to `GYAZO_ACCCESS_TOKEN`\n")
		os.Exit(1)
	}
	gyazo, _ := gyazo.NewClient(token)
	file, _ := os.Open("/Users/tomohiro/Desktop/hubot.png")
	res, err := gyazo.Upload(file)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to upload: %s\n", err)
		os.Exit(1)
	}
	fmt.Println(time.Now().Format("20060102150405"))
	fmt.Println(res.PermalinkURL)
	fmt.Printf("%+v", res)
}
