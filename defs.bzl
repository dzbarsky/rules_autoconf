def _def(name, v):
    return ["""   fprintf(f, "#define %s %s\\n");""" % (name, v)]

def non_windows(name):
    return select({
        "@platforms//os:windows": _def(name, "0"),
        "//conditions:default": _def(name, "1"),
    })

def windows_only(name):
    return select({
        "@platforms//os:windows": _def(name, "1"),
        "//conditions:default": _def(name, "0"),
    })

def non_osx(name):
    return select({
        "@platforms//os:osx": _def(name, "0"),
        "//conditions:default": _def(name, "1"),
    })

def define(name):
    return _def(name, "1")