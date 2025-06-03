#include<stdio.h>
int factorialOfNum(int n){
    if(n == 0 || n == 1){
        return n;
    }
    else{
        return n * factorialOfNum(n - 1);
    }
}

void main(){

int num;
printf("Enter the number :");
scanf("%d", &num);

int fact = factorialOfNum(num);
printf("The factorial of the given number is : %d", fact);

}

