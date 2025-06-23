#ifndef SUM_H
#define SUM_H

#include <type_traits>

namespace calc {

template<class... Args>
std::common_type_t<Args...> sum(Args&&... args) {
    return (args + ...);
}

}
#endif //SUM_H
