variants = {
    "Int": "",
    "Float": "",
    "Boolean": "",
    "String": "",
    "Char": "",
    "Void": "",
    "Array": "(arr)",
    "Custom": "(name)",
    "Unknown": "",
    "Pointer": "(inner)",
    "Nullable": "(inner)",
    "NoneVariant": ""
}

print("fn type_info_equals(a: ^TypeInfo, b: ^TypeInfo) -> Boolean {")
print("    when a^ {")
for v1, p1 in variants.items():
    p1_a = p1.replace(")", "_a)").replace("(", "(_") if p1 else ""
    if p1 == "(arr)": p1_a = "(arr_a)"
    if p1 == "(name)": p1_a = "(name_a)"
    if p1 == "(inner)": p1_a = "(inner_a)"
    
    print(f"        {v1}{p1_a} -> {{")
    print(f"            when b^ {{")
    for v2, p2 in variants.items():
        if v1 == v2:
            if v1 == "Array":
                print(f"                Array(arr_b) -> {{")
                print(f"                    let size_a = arr_a^.size")
                print(f"                    let size_b = arr_b^.size")
                print(f"                    when size_a {{")
                print(f"                        None -> {{")
                print(f"                            when size_b {{")
                print(f"                                None -> {{ }}")
                print(f"                                s -> {{ return false }}")
                print(f"                            }}")
                print(f"                        }}")
                print(f"                        sa -> {{")
                print(f"                            when size_b {{")
                print(f"                                None -> {{ return false }}")
                print(f"                                sb -> {{ if sa != sb {{ return false }} }}")
                print(f"                            }}")
                print(f"                        }}")
                print(f"                    }}")
                print(f"                    return type_info_equals(arr_a^.inner, arr_b^.inner)")
                print(f"                }}")
            elif v1 == "Custom":
                print(f"                Custom(name_b) -> {{ return name_a == name_b }}")
            elif v1 == "Pointer":
                print(f"                Pointer(inner_b) -> {{ return type_info_equals(inner_a, inner_b) }}")
            elif v1 == "Nullable":
                print(f"                Nullable(inner_b) -> {{ return type_info_equals(inner_a, inner_b) }}")
            else:
                print(f"                {v2} -> {{ return true }}")
        else:
            p2_b = p2.replace(")", "_b)").replace("(", "(_") if p2 else ""
            if p2 == "(arr)": p2_b = "(arr_b)"
            if p2 == "(name)": p2_b = "(name_b)"
            if p2 == "(inner)": p2_b = "(inner_b)"
            print(f"                {v2}{p2_b} -> {{ return false }}")
    print(f"            }}")
    print(f"        }}")
print("    }")
print("    return false")
print("}")

print("")
print("fn type_info_is_array(info: ^TypeInfo) -> Boolean {")
print("    when info^ {")
for v in variants:
    if v == "Array":
        print("        Array(arr) -> { return true }")
    else:
        p = variants[v]
        p_c = p.replace(")", "_c)").replace("(", "(_") if p else ""
        if p == "(arr)": p_c = "(arr_c)"
        if p == "(name)": p_c = "(name_c)"
        if p == "(inner)": p_c = "(inner_c)"
        print(f"        {v}{p_c} -> {{ return false }}")
print("    }")
print("    return false")
print("}")

print("")
print("fn type_info_get_array_inner(info: ^TypeInfo) -> ?^TypeInfo {")
print("    when info^ {")
for v in variants:
    if v == "Array":
        print("        Array(arr) -> { return arr^.inner }")
    else:
        p = variants[v]
        p_c = p.replace(")", "_c)").replace("(", "(_") if p else ""
        if p == "(arr)": p_c = "(arr_c)"
        if p == "(name)": p_c = "(name_c)"
        if p == "(inner)": p_c = "(inner_c)"
        print(f"        {v}{p_c} -> {{ }}")
print("    }")
print("    mut ret: ?^TypeInfo = None")
print("    return ret")
print("}")
