#include <stdio.h>

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
    int num;
    printf("Enter the length of the array: ");
    scanf("%d", &num);

    int arr[num];
    for(int i = 0; i < num; i++) {
        printf("Enter the %dth element: ", i);
        scanf("%d", &arr[i]);
    }

    heapSort(arr, num);

    printf("Sorted array: ");
    for(int i = 0; i < num; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
