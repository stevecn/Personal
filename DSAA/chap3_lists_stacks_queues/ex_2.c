#include <stdio.h>
#include <stdlib.h>

#include "list.h"

Position FindNth( List L, int nth )
{
        int i;
        Position P;
        P = L;

        for( i = 0; i < nth && P != NULL; i++ )
        {
                P = P->Next;
        }

        return P;
}

void PrintLots( List L, List P )
{
        int i;
        Position Posi;

        for( P = P->Next; P != NULL; P = P->Next )
        {
                Posi = FindNth( L, P->Element );

                if (Posi != NULL)
                {
                        printf("%d ", Posi->Element);
                }
        }

        printf("\n");
}

int main()
{
        List L, P;
        L = malloc( sizeof( struct Node ) );
        P = malloc( sizeof( struct Node ) );

        Insert(6, P, P);
        Insert(4, P, P);
        Insert(3, P, P);
        Insert(1, P, P);

        Insert(8, L, L);
        Insert(7, L, L);
        Insert(6, L, L);
        Insert(5, L, L);
        Insert(4, L, L);
        Insert(3, L, L);
        Insert(2, L, L);
        Insert(1, L, L);

        PrintList( P );
        PrintList( L );

        PrintLots( L, P );

        return 0;
}
