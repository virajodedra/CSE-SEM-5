// selectionSortTimeComplexity.c

// bubbleSortTimeComplexityTest
#include<stdio.h>
#include<time.h>

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

void main(){
    FILE *file;
    clock_t start, end;
    double cpu_time_used;
    int arr[1000];
    int n = 1000;

    // Best Case
    file = fopen("./best_for_1000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    printf("Best Case Scenario :\n");
    start = clock();
    selectionSort(arr, n);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n\n", cpu_time_used);

    // Average Case
    file = fopen("./average_for_1000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    printf("Average Case Scenario :\n");
    start = clock();
    selectionSort(arr, n);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n\n", cpu_time_used);

    // Worst Case
    file = fopen("./worst_for_1000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    printf("Worst Case Scenario :\n");
    start = clock();
    selectionSort(arr, n);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n", cpu_time_used);
}
