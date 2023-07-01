pub fn compare_string(str1: []const u8, str2: []const u8) bool {
    var flag: i32 = 0;
    if (str1.len != str2.len) {
        return false;
    }
    var i: usize = 0;
    while (i < str1.len) {
        if (str1[i] != str2[i]) {
            flag = 1;
        }
        i += 1;
    }
    if (flag == 0) {
        return true;
    } else {
        return false;
    }
}
