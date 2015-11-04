package main

import (
	"bufio"
	"os"
	"fmt"

	"github.com/alexflint/go-arg"
)

const Version = "0.1.0"

var args struct {
	Path string `arg:"positional"`
	Version bool `arg:"-v,help:display version"`
}

func main() {
	var path string

	sc := bufio.NewScanner(os.Stdin)
	for sc.Scan() {
		path = sc.Text()
	}

	arg.MustParse(&args)
	if path == "" {
		path = args.Path
	}

	fmt.Println(path)

	switch {
	case args.Version:
		showVersion()
	}
}

func showVersion() {
	fmt.Println(Version)
}
