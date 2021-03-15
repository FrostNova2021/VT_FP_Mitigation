
#include <stdlib.h>
#include <stdio.h>


typedef int (*test_recall)(void);
typedef int (*test_recall_with_arg1)(int);
typedef struct {
    int object_id;
    test_recall object_init;
    test_recall_with_arg1 object_call;
    test_recall object_releases;
} test_object;


int test() {
    return 1;
}

int add(int data) {
    return data * 2;
}

void test_case1() {
    test_recall test_call = test;

    printf("var call = %d\n",test_call());
}

void test_case2() {
    test_object test_object_instance;
    test_object_instance.object_id = 1;
    test_object_instance.object_init = test;
    test_object_instance.object_call = add;
    test_object_instance.object_releases = test;
    
    printf("struct call = %d\n",test_object_instance.object_call(10));
}

void test_case3() {
    test_object* test_object_point = (test_object*)malloc(sizeof(test_object));
    test_object_point->object_id = 2;
    test_object_point->object_init = test;
    test_object_point->object_call = add;
    test_object_point->object_releases = test;

    printf("struct point call = %d\n",test_object_point->object_call(20));
}

void test_case4() {
    struct {
        int object_id;
        test_recall_with_arg1 object_call;
    } test_object_v2;

    test_object_v2.object_id = 2;
    test_object_v2.object_call = add;

    printf("struct point call = %d\n",test_object_v2.object_call(20));
}

int main() {
    test_case1();
    test_case2();
    test_case3();

    return 0;
}

