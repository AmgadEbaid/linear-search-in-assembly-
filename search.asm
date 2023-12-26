.model small 

.data
    array DB 1, 2, 3, 4, 5, 6
    search_value DB 5
    array_len DW 6 
    found_msg DB 'Value found','$'
    not_found_msg DB 'Value not found','$'
.code
main proc far
.startup
    MOV CX, array_len 
    LEA SI, array 
    MOV AL, search_value 
search_loop:
    CMP AL, [SI] 
    JE found
    INC SI 
    LOOP search_loop

not_found:
   
    LEA DX, not_found_msg
    MOV AH, 09H
    INT 21H
    JMP exit

found:

    LEA DX, found_msg
    MOV AH, 09H
    INT 21H
exit:
.exit 
main endp

end main
