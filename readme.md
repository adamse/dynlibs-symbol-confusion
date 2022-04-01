# Dynamic symbol resolution confusion

```
$ ./main
liba_fun: in liba1, expected to be in liba1
libb_fun: in libb, calling liba_fun
liba_fun: in liba1, expected to be in liba2
```

But we really wanted `libb_fun` to call the `liba_fun` defined in `liba2.so`.

So even though we explicitly linked to `liba2.so` when building `libb.so` when
resolving `liba_fun` when loading `libb.so` we will find the definition from
`liba1.so` that we loaded previously.

But if we statically link `liba2` into `libb` we get the desired behaviour:

```
$ ./main_static
liba_fun: in liba1, expected to be in liba1
libb_fun: in libb, calling liba_fun
liba_fun: in liba2, expected to be in liba2
```
