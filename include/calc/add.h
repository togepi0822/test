#ifndef ADD_H
#define ADD_H

#include <type_traits>

namespace calc {

template<class T, std::enable_if_t<std::is_scalar_v<T>, int> = 0>
T add(T a, T b) {
    return a + b;
}

}

#endif //ADD_H
