#include <stdio.h>
#include <stdlib.h>

#include "list.h"

void SwapSinglyAdjacentNode( Position FrontP, Position BackP , List L)
{
        Position TmpCell;

        TmpCell = FindPrevious( FrontP->Element, L );
        TmpCell->Next = BackP;

        TmpCell = FrontP;
        FrontP->Next = BackP->Next;
        BackP->Next = TmpCell;
}

void SwapDoublyAdjacnetNode( Position P1, Position P2 )
{

}

int main()
{
        List L;
        Position Front, Back;

        L = malloc( sizeof( struct Node ) );

        Insert(1, L, L);
        Insert(2, L, L);
        Insert(3, L, L);
        Insert(4, L, L);

        PrintList( L );

        Front = Find(3, L);
        Back = Find(2, L);

        SwapSinglyAdjacentNode(Front, Back, L);

        PrintList( L );

        return 0;
}
