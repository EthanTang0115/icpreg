1. open PA3EXECUTION
2. PA3EXECUTION includes two parts: pre-process and find closest points
3. in pre-process, the program computes position of pointer tip wrt frame B, and the variable is named as d_k
4. in find closest point, the function FindClosestPoint is used
5. in FindClosestPoint there are three sub functions, Prog_Segment_1, Prog_Segment_2,ProgSegment_3.
6. Basically their function is to find closest point when the projection of the 3d point onto triangle plane is not inside the triangle edges.
7. Please read Alexis's TA session notes to understand FindClosestPoint and three sub functions
8. ICP_reg is not used in PA#3, because acoording to instruction PA#3 focus on finding closest points.
