#define V 5
#include <stdio.h>
#include <limits.h>
void main(){

    int m;
    printf("Enter the number of nodes: ");
    scanf("%d", &m);
    int graph[m][m];
    printf("\nEnter the adjacency matrix:\n");
    for (int i = 0; i < m; i++){
        for (int j = 0; j < m; j++){
            printf("Enter the weight of edge (%d, %d): ", i, j);
            scanf("%d", &graph[i][j]);
        }
    }

                                                        // test case :
                                                        // int graph[5][5] = { {0,1,0,4,0,0,0},
                                                        //     {1,0,2,6,4,0,0},
                                                        //     {0,2,0,0,5,6,0},
                                                        //     {4,6,0,0,3,0,4},
                                                        //     {0,4,5,3,0,8,7},
                                                        //     {0,0,6,0,8,0,3},
                                                        //     {0,0,0,4,7,3,0} };
                            // Edge 1: (0, 1) cost = 1
                            // Edge 2: (1, 2) cost = 2
                            // Edge 3: (0, 3) cost = 4
                            // Edge 4: (3, 4) cost = 3
                            // Edge 5: (3, 6) cost = 4
                            // Edge 6: (6, 5) cost = 3

                            // Minimum Spanning Tree cost: 17
    int visited[m];
    for (int i = 0; i < m; i++){
        visited[i] = 0;
    }
    visited[0] = 1;
    int edges = 0;
    int min_cost = 0;

    while(edges < m - 1){
        int x = 0, y = 0;
        int min = INT_MAX;

        for(int i = 0; i < m; i++){
            if(visited[i] == 1){
                for(int j = 0; j < m; j++){
                    if(visited[j] == 0 && graph[i][j] != 0 && graph[i][j] < min){
                        min = graph[i][j];
                        x = i;
                        y = j;
                    }
                }
            }      
        }
        visited[y] = 1;
        min_cost += min;
        printf("Edge %d: (%d, %d) cost = %d\n", edges + 1, x, y, min);
        edges += 1;
    }

    printf("\nMinimum Spanning Tree cost: %d\n", min_cost);




    // visited[0] = 1;
    // int edges = 0;
    // int min_cost = 0;

    // while (edges < V - 1){
    //     int min = INT_MAX;
    //     int x = 0, y = 0;

    //     for (int i = 0; i < V; i++){
    //         if (visited[i] == 1){
    //             for (int j = 0; j < V; j++){
    //                 if (visited[j] == 0 && graph[i][j] != 0 && graph[i][j] < min)
    //                 {
    //                     min = graph[i][j];
    //                     x = i;
    //                     y = j;
    //                 }
    //             }
    //         }
    //     }
    //     visited[y] = 1;
    //     min_cost += min;
    //     printf("Edge %d: (%d, %d) cost = %d\n", edges + 1, x + 1, y + 1, min);
    //     edges++;
    //     printf("\n");
    // }
}