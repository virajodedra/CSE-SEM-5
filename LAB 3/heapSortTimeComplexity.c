// heapSortTimeComplexity.c

#include <stdio.h>
#include<time.h>

void heapify(int arr[], int n, int idx) {
    int largest = idx;
    int left = 2 * idx + 1;
    int right = 2 * idx + 2;

    if(left < n && arr[largest] < arr[left]) {
        largest = left;
    }
    if(right < n && arr[largest] < arr[right]) {
        largest = right;
    }
    if(largest != idx) {
        int temp = arr[idx];
        arr[idx] = arr[largest];
        arr[largest] = temp;

        heapify(arr, n, largest);
    }
}

int heapSort(int arr[], int n) {
    for(int i = (n / 2 - 1); i >= 0; i--) {
        heapify(arr, n, i);
    }

    for(int i = n - 1; i >= 0; i--) {
        int temp = arr[i];
        arr[i] = arr[0];
        arr[0] = temp;

        heapify(arr, i, 0);
    }
    return 1;
}



int main() {
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
    heapSort(arr, n);
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
    heapSort(arr, n);
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
    heapSort(arr, n);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n", cpu_time_used);
}
