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
void wt(const char* name, T v)
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
    
    wt("n1", n1);
    wt("n2", n2);
    wt("n3", n3);
    wt("i", i);
    wt("d", d);
    wt("f", f);
    
    return 0;
}
