// #include<stdio.h>

// int pivot(int arr[], int i, int n) {
//     int p = arr[i];
//     int k = i;
//     int l = n;

//     do{
//         k += 1;
//     }
//     while(k <= n && arr[k] <= p);

//     do{
//         l -= 1;
//     }
//     while(l >= i &&  arr[l] > p);

//     while (k < l) {
//         int temp = arr[k];
//         arr[k] = arr[l];
//         arr[l] = temp;

//         do{
//             k += 1;
//         }
//         while(k <= n && arr[k] < p);
    
//         do{
//             l -= 1;
//         }
//         while(l >= i && arr[l] > p);

//     }
//     int temp = arr[i];
//     arr[i] = arr[l];
//     arr[l] = temp;
    
//     return l;
// }


// void quickSort(int arr[], int lb, int up) {
//     if(lb <  up) {
//         int pivotIdx = pivot(arr, lb, up);
//         quickSort(arr, lb, pivotIdx - 1);
//         quickSort(arr, pivotIdx + 1, up);
//     }
//     return;

// }

// void main() {
//     int num;
//     printf("Enter the length of the array: ");
//     scanf("%d", &num);

//     int arr[num];

//     for (int i = 0; i < num; i++) {
//         printf("Enter the %dth element: ", i);
//         scanf("%d", &arr[i]);
//     }

//     printf("Before sorting: ");
//     for (int i = 0; i < num; i++) {
//         printf("%d ", arr[i]);
//     }

//     quickSort(arr, 0, num - 1);

//     printf("\nAfter sorting: ");
//     for (int i = 0; i < num; i++) {
//         printf("%d ", arr[i]);
//     }

// }

#include <stdio.h>

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

int main() {
    int num;
    printf("Enter the length of the array: ");
    scanf("%d", &num);

    int arr[num];

    for (int i = 0; i < num; i++) {
        printf("Enter the %dth element: ", i);
        scanf("%d", &arr[i]);
    }

    printf("Before sorting: ");
    for (int i = 0; i < num; i++) {
        printf("%d ", arr[i]);
    }

    quickSort(arr, 0, num - 1);

    printf("\nAfter sorting: ");
    for (int i = 0; i < num; i++) {
        printf("%d ", arr[i]);
    }

    return 0;
}
