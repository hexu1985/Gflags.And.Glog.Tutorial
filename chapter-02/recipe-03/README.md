### DECLARE：使用其他文件中定义的flags变量

有些时候需要在main之外的文件使用定义的flags变量，这时候可以使用宏定义DECLARE_xxx(变量名)声明一下（就和c++中全局变量的使用是一样的，extern一下一样）

```
DECLARE_bool: boolean
DECLARE_int32: 32-bit integer
DECLARE_int64: 64-bit integer
DECLARE_uint64: unsigned 64-bit integer
DECLARE_double: double
DECLARE_string: C++ string 
```

在gflags的doc中，推荐在对应的.h文件中进行DECLARE_xxx声明，需要使用的文件直接include就行了。
