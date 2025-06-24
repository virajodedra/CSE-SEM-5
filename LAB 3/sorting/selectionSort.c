#include<stdio.h>
void selectionSort(int arr[], int n){
    int minIdx = 0;

    for(int i = 0; i < n - 1; i++) {
        minIdx = i;
        for(int j = i + 1; j < n; j++){
            if(arr[minIdx] > arr[j]) {
                minIdx = j;
            }
        }

        int temp = arr[minIdx];
        arr[minIdx] = arr[i];
        arr[i] = temp;
    }
}


int main() {
    int num;
    printf("Enter the length of the array :");
    scanf("%d", &num);

    int arr[num];

    for(int i = 0; i < num; i++){
        printf("Enter the %dth element: ", i);
        scanf("%d", &arr[i]);
    }

    selectionSort(arr, num);

    printf("Sorted array: ");
    for(int i = 0; i < num; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}