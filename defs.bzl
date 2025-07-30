def non_windows(name):
    return select({
        "@platforms//os:windows": [],
        "//conditions:default": [name],
    })

def windows_only(name):
    return select({
        "@platforms//os:windows": [name],
        "//conditions:default": [],
    })

def non_osx(name):
    return select({
        "@platforms//os:osx": [],
        "//conditions:default": [name],
    })