import 'dart:io';

void main(List<String> arguments) {
  int value;
  int choice;
  bool stop = false;
  String? tempInput;
  LBSIMCounter lbsimCounter; //constructor

  // take input for incrementValue     String?  !=  String

  print('Please enter user name');
  tempInput = stdin.readLineSync();

  if (tempInput != null && tempInput.isNotEmpty) {
    lbsimCounter = LBSIMCounter(
      userName: tempInput,
      count: 100,
    );
  } else {
    return;
  }
  print('Base Value is ${lbsimCounter.count}');
  while (!stop) {
    print('Enter operational value');
    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      print('tempInput is : $tempInput');
      value = int.parse(tempInput);
    } else {
      value = 0;
      print("No Value is entered!!");
    }

    print('''
    Enter your choice
    0. Print current value
    1. Increment
    2. Decrement
    3. Multiply 
    4. Divide
    5. Reminder
    6. Change User Name
    7. Stop the operation
  ''');

    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      choice = int.parse(tempInput);
    } else {
      choice = -1;
    }

    print('starting counter with value: ${lbsimCounter.count}');

    switch (choice) {
      case 0:
        print(lbsimCounter.count);
        break;
      case 1:
        incrementCounter(counter: lbsimCounter, incrementValue: value);
        break;
      case 2:
        decrementCounter(counter: lbsimCounter, decrementValue: value);
        break;
      case 3:
        multiplyCounter(counters: lbsimCounter, mul_value: value);
        break;
      case 4:
        divCounter(counters: lbsimCounter, div_value: value);
        break;
      case 5:
        remCounter(counters: lbsimCounter, div_value: value);
        break;
      case 6:
        changeUserName(counter: lbsimCounter);
        break;
      case 7:
        stop = true;
        break;
      default:
        print('Tumse na ho paega :(');
    }
    print(
        'Current value of count is ${lbsimCounter.count} by ${lbsimCounter.userName}');
  }

  print(
      'Final value of count is ${lbsimCounter.count}  by ${lbsimCounter.userName}');
}

void changeUserName({required LBSIMCounter counter}) {
  String? tempInput = stdin.readLineSync();
  if (tempInput != null && tempInput.isNotEmpty) {
    print('New user is :$tempInput');
    counter.userName = tempInput;
  }
}

void incrementCounter(
    {required LBSIMCounter counter, required int incrementValue}) {
  counter.count = counter.count + incrementValue;
}

void decrementCounter(
    {required LBSIMCounter counter, required int decrementValue}) {
  counter.count = counter.count - decrementValue;
}

void multiplyCounter({required LBSIMCounter counters, required int mul_value}) {
  counters.count = counters.count * mul_value;
}

void divCounter({required LBSIMCounter counters, required int div_value}) {
  counters.count = (counters.count / div_value).round();
}

void remCounter({required LBSIMCounter counters, required int div_value}) {
  counters.count = counters.count % div_value;
}

class LBSIMCounter {
  int count;
  String userName;

  LBSIMCounter({required this.count, required this.userName});
}
