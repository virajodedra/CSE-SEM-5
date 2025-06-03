#include<stdio.h>



void fibbo(int len, int first, int second){
    if(len == 0){
        return ;
    }

    printf(" %d", first);
    fibbo(len - 1, first + second, first);
}


void main(){
    int len;
    printf("Enter the length of the fibbonacci series :");
    scanf("%d", &len);

    fibbo(len, 0, 1);
    
}

