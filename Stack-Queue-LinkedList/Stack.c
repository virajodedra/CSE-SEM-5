#include <stdio.h>
#include <stdlib.h>

#define MAX 100

int stack[MAX];
int top = -1;

void push(int value) {
    if(top >= MAX - 1){
        printf("Stack Overflow\n");
    }
    else {
        top += 1;
        stack[top] = value;
        printf("Pushed %d onto stack\n", value);
    }
}

void pop(){
    if(top < 0){ //or top <= -1
        printf("Stack Underflow\n");
    }
    else{
        printf("Popped %d from stack\n", stack[top]);
        top -= 1;
    }
} 

void peep(){
    if(top <= -1){
        printf("Stack is empty\n");
    }
    else {
        printf("Top element is: %d\n", stack[top]);
    }
}

void change(int pos, int value) {
    if(pos - 1 < 0 || pos - 1 > top){
        printf(" Invalid Position ");
        return;
    }
    else{
        stack[pos - 1] = value;
        printf("The element change at position %d, is %d", pos, value);
        display();
    }
}


void display() {
    if(top < 0){
        printf("Stack is empty\n");
    }
    else {
        printf("Stack elements are: ");
        for(int i = top; i >= 0; i--) {
            printf("%d ", stack[i]);
        }
        printf("\n");
    }
}

void main(){
    int choice, value, pos;
    
    while(1) {
        printf("\nStack Operations:\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. To change th element at the specific position\n");
        printf("4. To get the top element\n");
        printf("5. Display Stack\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch(choice) {
            case 1:
                printf("Enter value to push: ");
                scanf("%d", &value);
                push(value);
                break;
            case 2:
                pop();
                break;
            case 3:
                printf("Enter the position and value to change in the stack\n");
                printf("Enter the position :  ");
                scanf("%d", &pos);
                printf("Enter the Element :  ");
                scanf("%d", &value);
                change(pos, value);
                break;
            case 4:
                peep();
                break;
            case 5:
                display();
                break;
            case 6:
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }
}
