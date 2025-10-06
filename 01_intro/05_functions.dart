void main() {
print (greetEveryone());
print (greetEveryonef());
print ('Suma: ${ addTwoNumbers (10,20) }');
print ('Suma: ${ addTwoNumbersf (10,20) }');
print ('Suma: ${ addTwoNumbersOptional (10,20) }');
}

String greetEveryone(){
  
  return 'Hola bienvenido';
}

String greetEveryonef()=>'Hola bienvenido';

int addTwoNumbers (int a, int b){
  return a+b;
}

int addTwoNumbersOptional (int a, 
                          // [int? b]
                           [int b=0]
                          ){
  //b= b ?? 0;
  //b ??= 0;
  
  return a+b;
}

int addTwoNumbersf (int a,int b)=> a+b;
