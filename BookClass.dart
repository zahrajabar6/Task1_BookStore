import 'dart:io';

class Book {
  String name;
  String author;
  double rate;
  static List books = <Book>[];

  Book({required this.name, required this.author, this.rate = 0});

  //getter for book details
  String get get_books => '$name\t\t\t$author\t\t\t$rate';

  //display all books
  static void display_all_books() {
    List<Book>? bookslist = Book.books.cast<Book>();
    if (bookslist.isEmpty) {
      print("There are no Books!");
    } else {
      print("Book Name\t\t\tAuthor Name\t\t\tRate");
      bookslist.forEach((book) {
        print("${book.get_books}");
      });
    }
  }

  //Add book
  static void add_book() {
    stdout.write('Enter the count of books want to add: ');
    try {
      int num = int.parse(stdin.readLineSync()!);
      for (int i = 0; i < num; i++) {
        stdout.write('Enter book ${i + 1} name: ');
        String book_name = stdin.readLineSync()!;
        stdout.write('Enter book ${i + 1} author: ');
        String book_author = stdin.readLineSync()!;
        stdout.write('Enter book ${i + 1} rate: ');
        double book_rate = double.parse(stdin.readLineSync()!);
        print('=' * 30);
        Book new_book =
            Book(name: book_name, author: book_author, rate: book_rate);
        books.add(new_book);
      }
    } catch (e) {
      print('You entered unvalid input!');
    }
  }

  //disblay books with rate+4
  static void books_with_rate_4() {
    List<Book>? bookslist = Book.books.cast<Book>();
    String storebooks = '';
    if (bookslist.isEmpty) {
      print("There are no Books!");
    } else {
      bookslist.forEach((book) {
        if (book.rate > 4) {
          storebooks = "${book.get_books}";
        }
      });
      if (storebooks.isEmpty) {
        print('There are no Books with rate +4!');
      } else {
        print("Book Name\t\t\tAuthor Name\t\t\tRate");
        print(storebooks);
      }
    }
  }

  //Update book
  static void update_book() {
    List<Book>? bookslist = Book.books.cast<Book>();

    if (bookslist.isEmpty) {
      print("There are no Books to update!");
    } else {
      stdout.write('Enter the book name: ');
      String book_name = stdin.readLineSync()!;
      bool check = bookslist.any((book) => book.name == book_name);

      if (check == true) {
        bookslist.forEach((book) {
          if (book.name == book_name) {
            stdout.write('Update book name: ');
            book.name = stdin.readLineSync()!;
            stdout.write('Update book author: ');
            book.author = stdin.readLineSync()!;
            stdout.write('Update book rate: ');
            book.rate = double.parse(stdin.readLineSync()!);
          }
        });
      } else {
        print('Book not found');
      }
    }
  }

  //Delete book
  static void delete_book() {
    List<Book>? bookslist = Book.books.cast<Book>();
    if (bookslist.isEmpty) {
      print("There are no Books to delete!");
    } else {
      stdout.write('Enter the book name: ');
      String book_name = stdin.readLineSync()!;
      bool check = bookslist.any((book) => book.name == book_name);

      if (check == true) {
        try {
          bookslist.forEach((book) {
            if (book.name == book_name) {
              bookslist.remove(book);
              print('book has been deleted');
            }
          });
        } catch (e) {}
      } else {
        print('Book not found!');
      }
    }
  }

  //Search
  static void search_book() {
    List<Book>? bookslist = Book.books.cast<Book>();

    if (bookslist.isEmpty) {
      print("There are no Books!");
    } else {
      stdout.write('Enter the book name: ');
      String book_name = stdin.readLineSync()!;
      bool check = bookslist.any((book) =>
          book.name.toUpperCase().contains(book_name.toUpperCase().trim()));

      if (check == true) {
        print("Book Name\t\t\tAuthor Name\t\t\tRate");
        bookslist.forEach((book) {
          if (book.name
              .toUpperCase()
              .contains(book_name.toUpperCase().trim())) {
            print("${book.get_books}");
          }
        });
      } else {
        print('Book not found!');
      }
    }
  }
}
