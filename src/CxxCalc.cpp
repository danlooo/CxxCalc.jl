#include <string>
#include <iostream>

class CxxCalculator
{
public:
    CxxCalculator(const char *person = "World") : person_(person) {}
    void say_hello() const
    {
        std::cout << "Hello " << person_ << "!\n";
    }
    static double hello_add(double a, double b)
    {
        return (a + b);
    }

private:
    std::string person_;
};
