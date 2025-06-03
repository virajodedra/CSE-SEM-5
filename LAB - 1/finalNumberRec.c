#include<stdio.h>


int powerCalculate(int num, int power){
    if(power <= 1){
        return num;
    }
    return num * powerCalculate(num,  power - 1);
}


void main(){
    int num, power;
    printf("Enter the number :");
    scanf("%d", &num);
    printf("Enter the power :");
    scanf("%d", &power);


    
    int finalNumber = powerCalculate(num, power);
    printf("THE ANSWER IS : %d", finalNumber);
}

