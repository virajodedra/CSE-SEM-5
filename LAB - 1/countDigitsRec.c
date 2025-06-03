#include<stdio.h>


int digitsCounter(int num){
    if(num == 0){
        return 0;
    }
    else{
        return 1 + digitsCounter(num/10);
    }
}

void main(){
    int digit;
    printf("Enter the Number to coun the digitd of it :  ");
    scanf("%d", &digit);

    int count = digitsCounter(digit);
    printf("the number of digits in the given number is : %d", count);


}


