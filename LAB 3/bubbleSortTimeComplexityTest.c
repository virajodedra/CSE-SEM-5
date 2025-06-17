// bubbleSortTimeComplexityTest
#include<stdio.h>
#include<stdbool.h>
#include<time.h>

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
    bubbleSort(arr, n);
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
    bubbleSort(arr, n);
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
    bubbleSort(arr, n);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n", cpu_time_used);
}
