#include <stdio.h>
#include <stdbool.h>

#define V 8

struct Queue {
    int items[100];  
    int front;
    int rear;
};

struct Queue q;

void initQueue() {
    q.front = -1;
    q.rear = -1;
}

bool isEmpty() {
    return q.front == -1;
}

void enqueue(int value) {
    if (q.rear == V - 1) {
        printf("Queue is full!\n");
        return;
    }

    if (isEmpty()) {
        q.front = 0;
    }

    q.rear++;
    q.items[q.rear] = value;
    // printf("Enqueued: %d\n", value);
}

int dequeue() {
    if (isEmpty()) {
        printf("Queue is empty!\n");
        return -1;
    }

    int removed = q.items[q.front];

    if (q.front == q.rear) {
        q.front = -1;
        q.rear = -1;
    } else {
        q.front++;
    }

    // printf("Dequeued: %d\n", removed);
    return removed;
}

int peek() {
    if (isEmpty()) {
        printf("Queue is empty!\n");
        return -1;
    }

    return q.items[q.front];
}

void printQueue() {
    if (isEmpty()) {
        printf("Queue is empty!\n");
        return;
    }

    printf("Queue: ");
    for (int i = q.front; i <= q.rear; i++) {
        printf("%d ", q.items[i]);
    }
    printf("\n");
}

void bfs(int graph[V][V]){
    int visited[V] = {0};
    initQueue();
    enqueue(0);
    visited[0] = 1;

    while(!isEmpty()) {
        int u = dequeue();
        printf("%d ", u + 1);

        for(int i = 0; i < V; i++){
            if(visited[i] == 0 && graph[u][i] != 0) {
                enqueue(i);
                visited[i] = 1;
            }
        }
    }
    printf("\n");
    
}


int main() {

    int graph[V][V] = {
        {0, 1, 1, 1, 1, 0, 0, 0},
        {1, 0, 0, 0, 0, 1, 0, 0},
        {1 ,0, 0, 0, 0, 1, 0, 0},
        {1, 0, 0, 0, 0, 0, 1, 0},
        {1, 0, 0, 0, 0, 0, 1, 0},
        {0, 1, 1, 0, 0, 0, 0, 0},
        {0, 0, 0, 1, 1, 0, 1, 1},
        {0, 0, 0, 0, 0, 0, 1, 1}
    };

    struct Queue q;
    bfs(graph);

    return 4;
}



// enqueue(0);
//     visited[0] = 1;

//     while (!isEmpty()) {
//         int node = dequeue();
//         printf("%d ", node + 1);

//         for (int i = 0; i < V; i++) {
//             if (graph[node][i] == 1 && !visited[i]) {
//                 enqueue(i);
//                 visited[i] = 1;
//             }
//         }
        
//     }
    