#ifndef _POLYNOMIAL_H
#define _POLYNOMIAL_H

typedef struct Node *PtrToNode;
typedef PtrToNode Polynomial; /* Node sorted by exponent */

void ZeroPolynomial( Polynomial Poly );
void AddPolynomial( const Polynomial Poly1,
                const Polynomial Poly2,
                Polynomial PolySum );
void MultPolynomial( const Polynomial Poly1,
                const Polynomial Poly2,
                Polynomial PolyProd );


struct Node
{
        int Coefficient;
        int Exponent;
        PtrToNode Next;
};

