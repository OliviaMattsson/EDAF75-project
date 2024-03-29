# EDAF75, project report

This is the report for

 + Olivia Mattsson, `stil_id`
 + Joanna Liljedahl Hildebrand, `stil_id`
 + Emma Franzon, `stil_id`

We solved this project on our own, except for:

 + The Peer-review meeting
 + ... describe any other help you've gotten ...


## ER-design

The model is in the file [`Databas projekt.png`](Databas projekt.png):

<center>
    <img src="Databas projekt.png" width="100%">
</center>


## Relations

The ER-model above gives the following relations (neither
[Markdown](https://docs.gitlab.com/ee/user/markdown.html)
nor [HTML5](https://en.wikipedia.org/wiki/HTML5) handles
underlining withtout resorting to
[CSS](https://en.wikipedia.org/wiki/Cascading_Style_Sheets),
so we use bold face for primary keys, italicized face for
foreign keys, and bold italicized face for attributes which
are both primary keys and foreign keys):

+ authors(**author_name**, nationality)
+ books(**isbn**, book_title, published_year, publisher)
+ authored_books(**_author_name_**, **_isbn_**)
+ copies(**copy_barcode**, _isbn_, _library_name_, shelf)
+ ...

(this should be replaced with your own relations, of course,
but use the same way of marking primary keys and foreign
keys).


## Scripts to set up database

The scripts used to set up and populate the database are in:

 + [`create-schema.sql`](create-schema.sql) (defines the tables), and
 + [`initial-data.sql`](initial-data.sql) (inserts data).

So, to create and initialize the database, we run:

```shell
sqlite3 krusty-db.sqlite < create-schema.sql
sqlite3 krusty-db.sqlite < initial-data.sql
```

(or whatever you call your database file).

## How to compile and run the program

This section should give a few simple commands to type to
compile and run the program from the command line, such as:

```shell
./gradlew run
```

or

```shell
javac -d bin/ -cp src src/krusty/Main.java
java -cp bin:sqlite-jdbc.jar krusty.Main
```

or, if you put your commands into a `Makefile`:

```shell
make compile
make run
```
