Two bugs:

1. Export gets stuck ;
2. Reported export size is never the same ;

```
# 1st run:
$ make 6.2.0
...
 => exporting to client directory                                                                                                                                                        9.2s
 => => copying files 1.60GB                                                                                                                                                              9.2s

# 2nd run:
$ make 6.2.0
...
 => exporting to client directory                                                                                                                                                       39.1s
 => => copying files 1.35GB                                                                                                                                                             39.1s

# 3rd run:
$ make 6.2.0
...
 => exporting to client directory                                                                                                                                                      275.1s
 => => copying files 1.32GB                                                                                                                                                            275.1s
```

During the 3rd run, at 30s of interval, I run following command two times and get the same result:

```
$ find 6.2.0/src/ -type f | wc -l
56589
```

And the issue seem to be gone if I remove this copy from last stage:

```Dockerfile
COPY --from=sources-ubuntu6.2.0 \
    /build/linux-6.2.0/ \
    /src/
```
