#include<stdio.h>
#include<stdbool.h>
#include<time.h>


bool linearSearch(int arr[], int n,  int key) {
    for(int i = 0; i < n; i++) {
        if(arr[i] == key) {
            return true;
        }
    }

    return false;
}

void main() {
    int key;
    printf("Enter the key to find in the array :");
    key  = scanf("%d", &key);

    // int arr[n];
    
    FILE *fp;
    clock_t start, end;
    double cpu_time_used;
    int arr[100000];
    int n = 100000;

    fp = fopen("./best_for_100000.txt", "r");
    for(int i = 0; i < n; i++){
        fscanf(fp, "%d", &arr[i]);
    }
    fclose(fp);
    start = clock();
    bool result  = linearSearch(arr, n, key);
    end = clock();
    cpu_time_used = ((double) (end - start))/CLOCKS_PER_SEC;
    if(result){
        printf("Find the key successfully !!!");
    }
    printf("TIME TAKEN TO FIND THE KEY IN  THE ARRAY IS : %f seconds\n\n", cpu_time_used);


}