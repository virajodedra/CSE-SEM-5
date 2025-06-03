#include<stdio.h>

void main(){
    int num, power;
    printf("Enter the number :");
    scanf("%d", &num);
    printf("Enter the power :");
    scanf("%d", &power);


    int finalNumber = 1;
    for(int i = 1; i <= power; i++){
        finalNumber *= num;
    }


    printf("THE ANSWER IS : %d", finalNumber);
}