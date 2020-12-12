// XML payload returned is encoded by default. Need to decode the special characters before processing 
fun decodeXmlResponse(res) = res replace "&amp;" with "&" replace "&lt;" with "<" replace "&gt;" with ">"
