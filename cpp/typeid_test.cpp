/******************************************************************************

outputs:

n1(�): h
n2(65280): i
n3(65535): i
i(0): i
d(0): d
f(0): f

*******************************************************************************/

#include <iostream>
#include <typeinfo>
#include <cstdint>

using namespace std;

template<class T>
void print_type(const char* name, T v)
{
    cout << name << "(" << v << "): " << typeid(v).name() << endl;
}

int main()
{
    uint8_t n1 = 0xFF;
    auto n2 = n1 << 8;
    auto n3 = (n1 << 8) | n1;
    int i = 0;
    double d = 0;
    float f = 0;

    print_type("n1", n1);
    print_type("n2", n2);
    print_type("n3", n3);
    print_type("i", i);
    print_type("d", d);
    print_type("f", f);

    return 0;
}
