import 'dart:io';
import 'BookClass.dart';

void main() {
  bool? again; //variable to ask the user for another choice

  do {
//main menu
    stdout.write('''\n
Main menu
1- Display all books
2- Display books with rate +4.
3- Add book
4- Update book
5- Delete book
6- Search
Write your choice: ''');

    String? choice =
        (stdin.readLineSync()!).trim(); //variable to store the user choice

    //switch case to select a choice
    switch (choice) {
      case '1':
        {
          Book.display_all_books();
        }
        break;
      case '2':
        {
          Book.books_with_rate_4();
        }
        break;
      case '3':
        {
          Book.add_book();
        }
        break;
      case '4':
        {
          Book.update_book();
        }
        break;
      case '5':
        {
          Book.delete_book();
        }
        break;
      case '6':
        {
          Book.search_book();
        }
        break;
      //if the user enter unvalid choice(like a letter or num out of the choices rang(1-6))
      default:
        {
          print('You entered unvalid choice!!');
        }
    }

    // ask the user for another choice
    print('\nDo you want to enter another choice?(y/n)');
    if (stdin.readLineSync()!.toLowerCase() == 'y') {
      again = true;
    } else {
      again = false;
    }
  } while (again);
}
