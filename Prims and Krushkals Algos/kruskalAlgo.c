#include<stdio.h>
#include <stdlib.h>
// kruskal's algo to find min. weight of the tree

    int compareColumns(const void *a, const void *b) {
        const int *rowA = (const int *)a;
        const int *rowB = (const int *)b;

        if (rowA[2] < rowB[2]) {
            return -1;
        } else if (rowA[2] > rowB[2]) {
            return 1;
        } else {
            return 0; 
        }
    }

    int findParent(int parent[], int component) {
        if(parent[component] == component) return component;

        return parent[component] = findParent(parent, parent[component]);
    }

    void unionSet(int parent[], int u, int v){
        // int uParent = findParent(parent, u);
        // int vParent = findParent(parent, v);
        
        parent[u] = v;
        
    }

void main() {

    int n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);
    int edges;
    printf(" Entern the number of edges ::");
    scanf("%d",&edges);

    int graph[edges][3];
    int parent[n];
    int minCost = 0;
    // int rank[n];

    // to give the parent themselves at the start and rank == 0
    for(int i = 0; i < n; i++) {
        parent[i] = i;
        // rank[i] = 0;
    }

    for(int i = 0; i < edges; i++) {
        int v1, v2, w1;
        printf("Enter the first vertex of the edge : " +(i + 1) );
        scanf("%d", &v1);
        printf("Enter the second vertex of the edge : " +(i + 1) );
        scanf("%d", &v2);
        printf("Enter the weight of the edge : " +(i + 1) );
        scanf("%d", &w1);

        graph[i][0] = v1;
        graph[i][1] = v2;  
        graph[i][2] = w1;
    }
    
    // here sort by the custom comparator
    qsort(graph, edges, sizeof(graph[0]), compareColumns);
    printf("\nSorted array by column 1:\n");
    
    for (int i = 0; i < edges; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", graph[i][j]);
        }
        printf("\n");
    }
    for (int i = 0; i < edges; i++) {
        printf("%d -- %d == %d\n", graph[i][0], graph[i][1], graph[i][2]);
    }

    // acutal start of algo.
    for(int i = 0; i < edges; i++) {

        int v1 = graph[i][0];
        int v2 = graph[i][1];
        int w1 = graph[i][2];    
        int root1 = findParent(parent, v1);
        int root2 = findParent(parent, v2);

        if( root1 != root2) {
            unionSet(parent, root1, root2);
            minCost += w1;
            printf("%d -- %d == %d\n", v1, v2, w1);
        }

        printf("\nMinimum cost of the spanning tree: %d\n", minCost);
    }
}
