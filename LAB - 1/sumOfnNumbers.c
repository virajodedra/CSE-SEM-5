#include<stdio.h>
void main(){
    int num;
    printf("Enter the number :");
    scanf("%d", &num);

    int sumOfTotal = 0;
    for(int i = 0 ; i <= num; i++){
        sumOfTotal += i;
    }

    printf("the sum of N numbers is : %d", sumOfTotal);
}