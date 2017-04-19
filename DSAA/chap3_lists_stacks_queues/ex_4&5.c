#include <stdio.h>
#include <stdlib.h>

#include "list.h"

void Intersection( List L1, List L2, List InterList )
{
        Position P, TmpCell;

        TmpCell = InterList;

        for( L1 = L1->Next; L1 != NULL; L1 = L1->Next )
        {
                P = Find( L1->Element, L2 );
                if( P )
                {
                        TmpCell = Insert( P->Element, InterList, TmpCell);
                }
        }
}

/* This solution is dirty, needed to be modify */
void Union( List L1, List L2, List UniList )
{
        Position P, TmpCell;
        Position P1, P2;

        TmpCell = UniList;
        P1 = L1->Next;
        P2 = L2->Next;

        while( P1 && P2 )
        {
                if ( P1->Element == P2->Element )
                {
                        TmpCell = Insert( P1->Element, UniList, TmpCell );
                        P1 = P1->Next;
                        P2 = P2->Next;
                }

                while( P2 && P1->Element > P2->Element )
                {
                        TmpCell = Insert( P2->Element, UniList, TmpCell );
                        P2 = P2->Next;
                }

                while( P1 && P1->Element < P2->Element )
                {
                        TmpCell = Insert( P1->Element, UniList, TmpCell );
                        P1 = P1->Next;
                }
        }

        while( P1 )
        {
                TmpCell = Insert( P1->Element, UniList, TmpCell );
                P1 = P1->Next;
        }

         while( P2 )
         {
                 TmpCell = Insert( P2->Element, UniList, TmpCell );
                 P2 = P2->Next;
         }
}

void
UnionSectionVersion( List L1, List L2, List UniList )
{
         Position P, TmpCell;

         TmpCell = UniList;

         L1 = L1->Next;
         L2 = L2->Next;

         while( L1 || L2 )
         {
                if( !L1 )
                {
                        TmpCell = Insert( L2->Element, UniList, TmpCell );
                        L2 = L2->Next;
                        continue;
                }
                if( !L2 )
                {
                        TmpCell = Insert( L1->Element, UniList, TmpCell );
                        L1 = L1->Next;
                        continue;
                }
                if( L1->Element == L2->Element )
                {
                        TmpCell = Insert( L1->Element, UniList, TmpCell );
                        L1 = L1->Next;
                        L2 = L2->Next;
                        continue;
                }
                if( L1->Element < L2->Element )
                {
                        TmpCell = Insert( L1->Element, UniList, TmpCell );
                        L1 = L1->Next;
                        continue;
                }
                if( L1->Element > L2->Element)
                {
                        TmpCell = Insert( L2->Element, UniList, TmpCell );
                        L2 = L2->Next;
                        continue;
                }
         }

}

int main()
{
        int Arr1[10] = {7, 6, 5, 4, 3, 2, 1};
        int Arr2[10] = {10, 8, 6, 4, 2};
        List L1, L2, InterList, UniList;

        L1 = malloc( sizeof( struct Node ) );
        L2 = malloc( sizeof( struct Node ) );
        InterList = malloc( sizeof( struct Node ) );
        UniList = malloc( sizeof( struct Node ) );

        ConstructList( L1, Arr1, 7 );
        ConstructList( L2, Arr2, 5 );

        Intersection( L1, L2, InterList );
        UnionSectionVersion( L1, L2, UniList );
        PrintList( L1 );
        PrintList( L2 );
        PrintList( InterList );
        PrintList( UniList );

        return 0;
}
