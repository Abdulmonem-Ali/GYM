// ignore_for_file: unused_local_variable, unused_import, unused_element
import 'package:intl/intl.dart';
import 'dart:io';

// A class for the trainer
class Trainer {
  //Attributes
  String name;
  int age;
  Map myMap = {};
  List trainersName = [];

  //constructor
  Trainer(
      {required this.name,
      required this.age,
      required this.myMap,
      required this.trainersName}) {
    print("wellcome to you in our GYM\n\n");
    List trainerList = [];
    try {
      print("Enter trainer's name:");
      name = stdin.readLineSync()!;

      print("Enter trainer's age:");
      age = int.parse(stdin.readLineSync()!);

      trainersName.add(name);
      trainerList.add(name);
      trainerList.add(age);
    } catch (e) {
      print("something went wrong!!\nplease try again.\n\n");
    }

    //Datetime variable for the date of the subscription
    var subsDate = DateTime.now();
    subsDate = subsDate.add(Duration(days: 30));
    trainerList.add(subsDate);

    int id = trainersName.length;
    myMap[id] = trainerList;
  }
}

void main() {
  String name = "";
  int age = -1;
  List trainersName = [];
  Map myMap = {};

  //Function for the new subscriper extending the constructor.
  void addNewTrainer() {
    Trainer trainer =
        Trainer(name: name, age: age, myMap: myMap, trainersName: trainersName);
  }

  //Function for chek if the subscription valid or not.
  void checkSubscriptionValidation() {
    try {
      print("please enter the subscriper's id:");
      int i = int.parse(stdin.readLineSync()!);
      if (DateTime.now().isBefore(myMap[i][2]) == true) {
        print("Dear ${myMap[i][0]}...");
        print("your subscription is valid until ${myMap[i][2]}");
      } else {
        print("Dear ${myMap[i][0]}...");
        print("your subscription is invalid and you have to renewal it ..");
      }
    } catch (e) {
      print("something went wrong!!\nplease try again.\n\n");
    }
  }

  //Function to renewal the expired subscription.
  void subscriptionRenewal() {
    try {
      print("please enter the subscriper's id:");
      int i = int.parse(stdin.readLineSync()!);
      var invalid = myMap[i][2];
      var valid = invalid.add(Duration(days: 30));
      myMap[i][2] = valid;
      print("Dear ${myMap[i][0]} ...");
      print("your subscription is valid until $valid");
    } catch (e) {
      print("something went wrong!!\nplease try again.\n\n");
    }
  }

  //Function to get the subscription record.
  void getSubscriptionRecord() {
    myMap.forEach((key, value) {
      print("$key: ${value[0]}");
    });
  }

  //Function to get all the information of the subscriper.
  void getSubscriperInfo() {
    try {
      print("please enter the subscriper's id:");
      int i = int.parse(stdin.readLineSync()!);
      print("The trainer name is: ${myMap[i][0]}");
      print("The trainer age is: ${myMap[i][1]}");
      print("The validation of his subscription is until: ${myMap[i][2]}");
    } catch (e) {
      print("something went wrong!!\nplease try again.\n\n");
    }
  }

  //Function to delete the a subscriper from the record(if we need to it).
  void removeSubscriperFromRecord() {
    try {
      print("please enter the subscriper's id:");
      int i = int.parse(stdin.readLineSync()!);
      myMap.remove(i);
      print("Done...");
    } catch (e) {
      print("something went wrong!!\nplease try again.\n\n");
    }
  }

  // A while loop to select the operation(function) which i want it.
  while (true) {
    print("enter the number of the operation that you want to do:\n\n");
    print("1.Enter a new trainer.");
    print("2.Chek if the subscription has expired.");
    print("3.subscription renewal.");
    print("4.print the record of the subscripers in our GYM.");
    print("5.print the details of a subscriper.");
    print("6.delete a subscriper from the record.");

    String answer = stdin.readLineSync()!;
    switch (answer) {
      case "1":
        addNewTrainer();
        break;
      case "2":
        checkSubscriptionValidation();
        break;
      case "3":
        subscriptionRenewal();
        break;
      case "4":
        getSubscriptionRecord();
        break;
      case "5":
        getSubscriperInfo();
        break;
      case "6":
        removeSubscriperFromRecord();
        break;
      default:
        print("you have entered invalid value!!\nplease try again.\n\n");
    }
  }
}
