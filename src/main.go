package main

import (
	"context"
	"flag"
	"fmt"
	"google.golang.org/api/drive/v3"
	"io"
	"os"
)

func main() {
	flag.Parse()
	id := flag.Args()[0]
	name := flag.Args()[1]
	create, err := os.Create(name)
	fmt.Print("Download ", id)
	ctx := context.Background()
	srv, err := drive.NewService(ctx)
	if err != nil {
		panic(err)
	}
	response, err := srv.Files.Get(id).Context(ctx).SupportsAllDrives(true).Download()
	if err != nil {
		panic(err)
	}
	defer response.Body.Close()
	if _, err := io.Copy(create, response.Body); err != nil {
		fmt.Errorf("write file: %w", err)
		panic(err)
	}
	fmt.Println("download complete with ", response)
}
