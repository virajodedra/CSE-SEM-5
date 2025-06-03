#include<stdio.h>

void main(){
    int len;
    printf("Enter the length of the fibbonacci series :");
    scanf("%d", &len);

    int first = 0, second = 1;

    for(int i = 0; i < len; i++){
        printf(" %d ", first);
        
        int temp = first;
        first += second;
        second = temp;
    }

}