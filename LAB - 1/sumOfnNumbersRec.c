#include<stdio.h>

int sumOfN(int n, int counter){
    if(n <= 0){
        return counter;
    }
    else{
        sumOfN(n - 1, counter + n);
    }
}

void main(){
    int num;
    printf("Enter the number :");
    scanf("%d", &num);

    int count = sumOfN(num, 0);
    printf("the sum of N numbers is : %d", count);


}

