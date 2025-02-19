---
title: FLUSHDB
linkTitle: FLUSHDB
description: FLUSHDB
menu:
  v2.6:
    parent: api-yedis
    weight: 2065
type: docs
---

## Synopsis

**`FLUSHDB`**

This command deletes all keys from a database.

This functionality can be disabled by setting the yb-tserver `--yedis_enable_flush` flag to `false`.

## Return value

Returns status string.

## Examples

```sh
$ SET yuga1 "America"
```

```
"OK"
```

```sh
$ SET yuga2 "Africa"
```

```
"OK"
```

```sh
$ GET yuga1
```

```
"America"
```

```sh
$ GET yuga2
```

```
"Africa"
```

```sh
$ FLUSHDB
```

```
"OK"
```

```sh
$ GET yuga1
```

```
(null)
```

```sh
$ GET yuga2
```

```
(null)
```

## See also

[`del`](../del/), [`flushall`](../flushall/),[`deletedb`](../deletedb/)
