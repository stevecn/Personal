#ifndef _LIST_H
#define _LIST_H

struct Node;
typedef int ElementType;
typedef struct Node *PtrToNode;
typedef PtrToNode List;
typedef PtrToNode Position;

List MakeEmpty( List L );
int IsEmpty( List L );
int IsLast( Position P, List L );
Position Find( ElementType X, List L );
void Delete( ElementType X, List L );
Position FindPrevious( ElementType X, List L );
Position Insert( ElementType X, List L, Position P );
void DeleteList( List L );
Position Header( List L );
Position First( List L );
Position Advance( Position P );
ElementType Retrieve( Position P );
void PrintList( List L );
void ConstructList( List L, int Elements[], int Num );

#endif  /* _LIST_H */


/* Place in the implementation file ? */
struct Node
{
        ElementType Element;
        Position Next;
};
