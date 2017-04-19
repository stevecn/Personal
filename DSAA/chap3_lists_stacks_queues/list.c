#include <stdio.h>
#include <stdlib.h>

#include "list.h"

/* Return true if L is empty */

int
IsEmpty( List L )
{
        return L->Next == NULL;
}

/* Return true if P is the last position in list L.
 * Parameter L is unused in this implementation */

int
IsLast( Position P, List L )
{
        return P->Next == NULL;
}

/* Return Position of X in L; Null if not found */

Position
Find( ElementType X, List L )
{
        Position P;

        P = L->Next;
        while( P != NULL && P->Element != X )
                P = P->Next;

        return P;
}

/* Delete first occurrence of X from a list.
 * Assume use of a header node */

void Delete( ElementType X, List L )
{
        Position P, TmpCell;

        P = FindPrevious(X, L);

        if ( !IsLast(P, L) )
        {
                TmpCell = P->Next;
                P->Next = TmpCell->Next;
                free( TmpCell );
        }
}

/* If X is not found, then Next field of returned.
 * Position is NULL.
 * Assumes a header */

Position
FindPrevious( ElementType X, List L )
{
        Position P;

        P = L;
        while( P->Next != NULL && P->Next->Element != X )
        {
                P = P->Next;
        }

        return P;
}

/* Insert (after legal position P).
 * Header implementation assumed.
 * Parameter L is unused in this implementation.
 * Return the position of the inserted node */

Position
Insert( ElementType X, List L, Position P )
{
        Position TmpCell;

        TmpCell = malloc( sizeof( struct Node ) );
        if( TmpCell == NULL )
                printf( "Out of space!" );

        TmpCell->Element = X;
        TmpCell->Next = P->Next;
        P->Next = TmpCell;

        return TmpCell;
}

void
DeleteList( List L )
{
        Position P, Tmp;

        P = L->Next;
        L->Next = NULL;

        while( P != NULL )
        {
                Tmp = P->Next;
                free( P );
                P = Tmp;
        }
}

void ConstructList( List L, int Elements[], int Num )
{
        int i;

        for( i = 0; i < Num; i++ )
        {
                Insert(Elements[i], L, L);
        }
}
void
PrintList( List L )
{
        Position P;
        P = L->Next;

        while( P != NULL )
        {
                printf( "%d->", P->Element );
                P = P->Next;
        }

        printf( "\n" );
}

/*int*/
/*main()*/
/*{*/
        /*Position P;*/
        /*List L;*/

        /*L = malloc( sizeof (struct Node) );*/
        /*Insert(3,L, L);*/
        /*Insert(5,L, L);*/
        /*Insert(8, L, L);*/
        /*P = FindPrevious(3, L);*/
        /*PrintList(L);*/
/*}*/
