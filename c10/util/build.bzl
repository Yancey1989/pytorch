def define_rules(rules):
    rules.package(default_visibility = ["//:__subpackages__"])

    rules.filegroup(
        name = "headers",
        srcs = rules.glob(
            ["*.h"],
            exclude=[
                "C++17.h",
                "TypeTraits.h",
            ]),
        visibility = ["//:__pkg__"],
    )

    rules.filegroup(
        name = "sources",
        srcs = rules.glob(
            ["*.cpp"],
            exclude=[
                "C++17.cpp",
                "TypeTraits.cpp",
            ],
        ),
        visibility = ["//:__pkg__"],
    )

    rules.cc_library(
        name = "C++17",
        hdrs = ["C++17.h"],
        srcs = ["C++17.cpp"],
        deps = ["//c10/macros:Macros"],
    )

    rules.cc_library(
        name = "TypeTraits",
        hdrs = ["TypeTraits.h"],
        srcs = ["TypeTraits.cpp"],
        deps = [":C++17"],
    )
