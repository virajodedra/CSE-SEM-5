// bubbleSortTimeComplexityTest
#include<stdio.h>
#include<stdbool.h>
#include<time.h>
#include <limits.h>


void merge(int arr[], int left, int mid, int right){
    int n1 = mid - left + 1;
    int n2 = right  - mid; 

    int leftArray[n1 + 1];
    leftArray[n1] = INT_MAX;
    int rightArray[n2 + 1];
    rightArray[n2] = INT_MAX;

    for(int i = 0; i < n1; i++) {
        leftArray[i] = arr[left + i];
    }
    
    for(int j = 0; j < n2; j++) {
        rightArray[j] = arr[ (mid + 1) + j];
    }

    int i = 0;
    int j = 0;
    int k = left;

    while(k <= right){

        if(leftArray[i] <= rightArray[j]) {
            arr[k] = leftArray[i];
            i += 1;
        }

        else {
            arr[k] = rightArray[j];
            j += 1;
        }

        k += 1;
    }
    
    printf("Merged [%d - %d]: ", left, right);
    for (int v = left; v <= right; v++) {
        printf("%d ", arr[v]);
    }
    printf("\n");
}
void mergeSort(int arr[], int left, int right){
    if(left < right){
        int mid = left + (right - left)/2;
        
        mergeSort(arr, left, mid);
        mergeSort(arr, mid + 1, right); 

        merge(arr, left, mid, right);
    }
}

void main(){
    FILE *file;
    clock_t start, end;
    double cpu_time_used;
    int arr[100000];
    int n = 100000;

    // Best Case
    file = fopen("./best_for_100000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    printf("Best Case Scenario :\n");
    start = clock();
    mergeSort(arr, 0, n - 1);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n\n", cpu_time_used);

    // Average Case
    file = fopen("./average_for_100000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    printf("Average Case Scenario :\n");
    start = clock();
    mergeSort(arr, 0, n - 1);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n\n", cpu_time_used);

    // Worst Case
    file = fopen("./worst_for_100000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    printf("Worst Case Scenario :\n");
    start = clock();
    mergeSort(arr, 0, n - 1);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n", cpu_time_used);
}
