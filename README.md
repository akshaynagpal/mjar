# mjar
Search/access [The Medical Journal of Australia's](https://www.mja.com.au) database of journals using web scraping in R.

##Installation
`library(devtools)`

`install_github('akshaynagpal/mjar')`
##Usage
`my_query <- search_MJA("heart rate")`

This will provide the output in the form of a `matrix` containing 3 columns - `titles, links, abstracts` of top 10 articles matching the user input ("heart rate" in above example).

###Selecting from the matrix
Using basic matrix access syntax of R, you can access specific information from the matrix returned in the variable (`my_query` in this case)
* To select all the titles, you can use `my_query[,c('title')]`

* To select all the titles and abstracts from the search resull, you can use `my_query[,c('title','abstract')]`

* To select title and link from the second row, you can use `my_query[2,c('title','abstract')]`

##Copyright
>
>The MIT License (MIT)
>
>Copyright (c) 2015 Akshay Nagpal
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
