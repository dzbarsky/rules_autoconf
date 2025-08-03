def define(name):
    return ["""   fprintf(f, "#define %s 1\\n");""" % name]

def non_windows(name):
    return select({
        "@platforms//os:windows": [],
        "//conditions:default": define(name),
    })

def windows_only(name):
    return select({
        "@platforms//os:windows": define(name),
        "//conditions:default": [],
    })

def linux_only(name):
    return select({
        "@platforms//os:linux": define(name),
        "//conditions:default": [],
    })

def osx_only(name):
    return select({
        "@platforms//os:osx": define(name),
        "//conditions:default": [],
    })

def non_osx(name):
    return select({
        "@platforms//os:osx": [],
        "//conditions:default": define(name),
    })
