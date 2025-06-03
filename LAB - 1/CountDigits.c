#include<stdio.h>

void  main(){
    int digit;
    printf("Enter the Number to coun the digitd of it :  ");
    scanf("%d", &digit);

    int counter = 0;
    while (digit > 0){
        digit /= 10;
        counter += 1;
    }
    
    printf("The digits of the given  number is : %d", counter);
        
    
}