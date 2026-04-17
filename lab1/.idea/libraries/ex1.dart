import 'dart:io';

void main(){
  print('Input name: ');
  String? name = stdin.readLineSync();
  if(name == null){
    print('Name cannot null');
    return;
  } else if(name.length <= 5 || name.length >= 20){
    print('Invalid name');
    return;
  }

  print('Input age: ');
  int age = int.parse(stdin.readLineSync()!);
  if(age <=10 || age >=100){
    print('Invalid age');
    return;
  }

  print('Input address: ');
  String? addr = stdin.readLineSync();
  if(addr == null){
    print('Address cannot null');
    return;
  } else if(addr.length <= 10 || addr.length >= 100){
    print("Invalid address");
    return;
  }

  String msg = 'Hello ${name!.toUpperCase()}, you are $age years old and you are living at ${addr!.toUpperCase()}';
  print(msg);
}