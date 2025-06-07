#include<stdio.h>
#include<stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Node* head = NULL;

void insertAtBeginning(int value) {
    struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->next = head;
    head = newNode;
}

void insertAtEnd(int value) {
    struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->next = NULL;

    if(head == NULL) {
        head = newNode;
        return;
    }

    struct Node* temp = head;
    while(temp->next != NULL)
        temp = temp->next;

    temp->next = newNode;
}

void insertAtPosition(int pos, int value) {
    if(pos == 1) {
        insertAtBeginning(value);
        return;
    }

    struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
    newNode->data = value;

    struct Node* temp = head;
    for(int i = 1; i < pos - 1 && temp != NULL; i++)
        temp = temp->next;

    if(temp == NULL) {
        printf("Invalid position\n");
        return;
    }

    newNode->next = temp->next;
    temp->next = newNode;
}

// Delete at beginning
void deleteAtBeginning() {
    if(head == NULL) {
        printf("List is empty\n");
        return;
    }

    struct Node* temp = head;
    head = head->next;
    free(temp);
}

// Delete at end
void deleteAtEnd() {
    if(head == NULL) {
        printf("List is empty\n");
        return;
    }

    if(head->next == NULL) {
        free(head);
        head = NULL;
        return;
    }

    struct Node* temp = head;
    while(temp->next->next != NULL)
        temp = temp->next;

    free(temp->next);
    temp->next = NULL;
}

// Delete at specific position
void deleteAtPosition(int pos) {
    if(head == NULL) {
        printf("List is empty\n");
        return;
    }

    if(pos == 1) {
        deleteAtBeginning();
        return;
    }

    struct Node* temp = head;
    for(int i = 1; i < pos - 1 && temp != NULL; i++)
        temp = temp->next;

    if(temp == NULL || temp->next == NULL) {
        printf("Invalid position\n");
        return;
    }

    struct Node* toDelete = temp->next;
    temp->next = temp->next->next;
    free(toDelete);
}

// Display the list
void display() {
    struct Node* temp = head;
    while(temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Main function
int main() {
    insertAtEnd(10);
    insertAtBeginning(5);
    insertAtEnd(20);
    insertAtPosition(2, 15);
    display();  // 5 -> 15 -> 10 -> 20 -> NULL

    deleteAtBeginning();
    deleteAtEnd();
    deleteAtPosition(2);
    display();  // 15 -> NULL

    return 0;
}







// #include<stdio.h>
// #include<stdlib.h>

// struct Node{
//     int data;
//     struct Node* next;
// };
// struct Node* head = NULL;

// void insertAtFirst(int value) {
//     struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
//     newNode->data = value;
//     newNode->next = head;
//     head = newNode;
// }

// void insertAtLast(int value){
//     struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
//     newNode->data = value;

//     struct Node* temp = head;
//     while(temp != NULL && temp->next != NULL) {
//         temp = temp->next;
//     }
//     if(temp == NULL){
//         head = newNode;
//         newNode->next = NULL;
//     }
//     else{
//         head-> next = newNode;
//         newNode->next = NULL;
//     }
// }
// void display() {
//     struct Node* temp = head;
//     if(temp == NULL) {
//         printf("List is empty\n");
//         return;
//     }
//     while(temp != NULL) {
//         printf("%d -> ", temp->data);
//         temp = temp->next;
//     }
//     printf("NULL\n");
// }

