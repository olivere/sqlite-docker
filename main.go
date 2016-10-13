package main

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	db, err := sql.Open("sqlite3", "./foo.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	_, err = db.Exec("CREATE TABLE `userinfo` ( `uid` INTEGER PRIMARY KEY AUTOINCREMENT, `username` VARCHAR(64) )")
	if err != nil {
		log.Fatal(err)
	}

	_, err = db.Exec("INSERT INTO `userinfo` (username) VALUES (?)", time.Now().Format(time.RFC3339))
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Database insert worked")
}
