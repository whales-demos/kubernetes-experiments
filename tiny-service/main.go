package main

import (
	"log"
	"math/rand"
	"net/http"
	"os"
)

var adjectives = []string{"Funny", "Silly", "Crazy", "Goofy", "Wacky", "Loony", "Zany"}
var nouns = []string{"Chicken", "Goose", "Giraffe", "Koala", "Lemur", "Quokka", "Axolotl"}

func generateFunnyName() string {
	adjective := adjectives[rand.Intn(len(adjectives))]
	noun := nouns[rand.Intn(len(nouns))]
	return adjective + " " + noun
}

func main() {
	var httpPort = os.Getenv("HTTP_PORT")
	if httpPort == "" {
		httpPort = "8080"
	}

	var message = os.Getenv("MESSAGE")
	var name = generateFunnyName()

	mux := http.NewServeMux()

	mux.HandleFunc("/", func(response http.ResponseWriter, request *http.Request) {
		response.Header().Add("Content-Type", "text/html;charset=utf-8")
		response.Write([]byte("<h1>Tiny Service Demo " + name + "</h1><h2>" + message + "</h2>"))
	})

	var errListening error
	log.Println("🌍 http server is listening on: " + httpPort)
	errListening = http.ListenAndServe(":"+httpPort, mux)

	log.Fatal(errListening)
}
