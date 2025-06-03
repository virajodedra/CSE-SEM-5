#include<stdio.h>
void main(){

int num;
printf("Enter the number :");
scanf("%d", &num);

int facto = 1;

for(int i = 0; i <= num; i++){
    facto *= i;
}

printf("The factorial of the given number is : %d", facto);

}

