# rules_autoconf

Ruleset that generates a portable `config.h` for C/C++ projects using Bazel. The generated header mirrors the traditional autoconf `HAVE_*` defines by probing `__has_include` and a handful of platform-specific feature macros, so your code can gate functionality based on headers, functions, and libc features without running a configure script.

## Using in your build

Add the repository through Bzlmod (`bazel_dep(name = "rules_autoconf", version = "...")`) or the equivalent `http_archive`, then depend on the exported library:

```python
cc_library(
    name = "config",
    hdrs = ["config.h"],
    deps = ["@rules_autoconf//:config"],
    defines = select({
        "@platforms//os:windows": [
            "LIBXSLT_STATIC",
            "LIBEXSLT_STATIC",
        ],
        "//conditions:default": [],
    }),
    visibility = ["//:__subpackages__"],
)
```

Your `config.h` can simply re-export the generated header:

```c
#pragma once
#include <rules_autoconf/config.h>
```

Consumers then include `config.h` from your target and use the standard `HAVE_*` macros. For a quick check inside this repo, `bazel build @rules_autoconf//:config` produces `rules_autoconf/config.h` and `bazel test @rules_autoconf//:config_test` validates the header compiles.
