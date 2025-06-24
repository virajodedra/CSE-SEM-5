#include<stdio.h>
#include<stdbool.h>

void bubbleSort(int arr[], int n){
    for(int i = 0; i < n - 1; i++){
        bool swapped = false;
        for(int j = 0; j < n - (i + 1); j++){
            if(arr[j] > arr[j + 1]){
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = true;
            }
        }
        if(!swapped) break;
    }

    printf("The Sorted array is :");
    for(int i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }

}
void main(){
    int num;
    printf("Enter the length of the array :");
    scanf("%d", &num);

    int arr[num];

    for(int i = 0; i < num; i++){
         printf("Enter the %dth element: ", i);
        scanf("%d", &arr[i]);
    }

    bubbleSort(arr, num);

}