# if 1
double Abs(double Nbr)
{
    if (Nbr >= 0)
        return Nbr;
    else
        return -Nbr;
}

double square_root(double Nbr)
{
    double Number = Nbr / 2;
    const double Tolerance = 1.0e-7;
    do
    {
        Number = (Number + Nbr / Number) / 2;
    }
    while (Abs(Number * Number - Nbr) > Tolerance);

    return Number;
}
#endif

#if 0
#include <math.h>
double square_root(double Nbr)
{
    return sqrt(Nbr);
}
#endif
