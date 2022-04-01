# Dynamic symbol resolution confusion

```
$ ./main
liba_fun: in liba1, expected to be in liba1
libb_fun: in libb, calling liba_fun
liba_fun: in liba1, expected to be in liba2
```

But we really wanted `libb_fun` to call the `liba_fun` defined in `liba2.so`.
