# Parent Function: tpa:book/each_page
# @macro: $(id_n): lines to append after the list: including the quotation marks itself contains, needs 7 "\"
#         $(pages): storage book.pages
$data modify storage tpa:tpa book.pages append value {raw:[$(id_0),"\\n",$(id_1),"\\n",$(id_2),"\\n",$(id_3),"\\n",$(id_4),"\\n",$(id_5),"\\n",$(id_6),"\\n", $(id_7),"\\n",$(id_8),"\\n",$(id_9),"\\n",$(id_10),"\\n",$(id_11),"\\n",$(id_12),"\\n", $(id_13)]}