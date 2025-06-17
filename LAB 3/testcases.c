#include<stdio.h>
#include<stdlib.h>

void main() {
    FILE * file;
    file = fopen("best_for_100.txt", "w");

    for(int i = 0; i < 100; i++){
        fprintf(file, "%d ", i);
    }

    fclose(file);

    file = fopen("worst_for_100.txt", "w");
    for(int i = 100 ; i > 0; i--){
        fprintf(file, "%d ", i);
    }

    fclose(file);

    file = fopen("average_for_100.txt", "w");
    for(int i = 0; i < 100; i++){
        fprintf(file, "%d ", rand() % 100);
        fclose(file);

    }
}