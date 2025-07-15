// bubbleSortTimeComplexityTest
#include<stdio.h>
#include<stdbool.h>
#include<time.h>

void generateBestTestCase(int arr[], int i, int j){
    if(i < j){
        int mid = (i + j) / 2;

        int temp = arr[i];
        arr[i] = arr[mid];
        arr[mid] = temp;

        generateBestTestCase(arr, i, mid - 1);
        generateBestTestCase(arr, mid + 1, j);

    }
}

int pivot(int arr[], int i, int n) {
    int p = arr[i];
    int k = i;
    int l = n + 1;  

    while (1) {
        do {
            k++;
        } while (k <= n && arr[k] <= p);  

        do {
            l--;
        } while (l >= i && arr[l] > p);  

        if (k >= l)
            break;

        // Swap arr[k] and arr[l]
        int temp = arr[k];
        arr[k] = arr[l];
        arr[l] = temp;
    }

    // Swap pivot with arr[l]
    int temp = arr[i];
    arr[i] = arr[l];
    arr[l] = temp;

    return l;
}

void quickSort(int arr[], int lb, int up) {
    if (lb < up) {
        int pivotIdx = pivot(arr, lb, up);
        quickSort(arr, lb, pivotIdx - 1);
        quickSort(arr, pivotIdx + 1, up);
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
    generateBestTestCase(arr, 0, n - 1);
    printf("Best Case Scenario :\n");
    start = clock();
    quickSort(arr, 0, n - 1);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n\n", cpu_time_used);

    // Average Case
    file = fopen("./average_for_100000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    generateBestTestCase(arr, 0, n - 1);
    printf("Average Case Scenario :\n");
    start = clock();
    quickSort(arr, 0, n - 1);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n\n", cpu_time_used);

    // Worst Case
    file = fopen("./worst_for_100000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(file, "%d", &arr[i]);
    }
    fclose(file);
    generateBestTestCase(arr, 0, n - 1);
    printf("Worst Case Scenario :\n");
    start = clock();
    quickSort(arr, 0, n - 1);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    printf("TIME TAKEN TO SORT THE ARRAY IS : %f seconds\n", cpu_time_used);
}
