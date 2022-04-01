#include <stdio.h>

#include "libb.h"
#include "liba.h"

void libb_fun() {
    printf("libb_fun: in libb, calling liba_fun\n");
    liba_fun("liba2");
}
