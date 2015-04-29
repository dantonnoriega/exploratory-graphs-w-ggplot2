# Exploratory Data Analysis with `ggplot2` with an Intro to `data.table`
### Prepared by Danton Noriega for SSRI


## `ggplot2`

`ggplot2` is a graphics package created by R demigod [Hadley Wickham](http://had.co.nz/). It creates very pretty graphics that are easy to customize. The syntax is cleaner and more intuitive compared to other graphics options, like `lattice`.

- Pros
	+ pretty!
	+ easy to use
- Cons
	+ Only 2D
	+ Not great for plotting millions of observations (slow but works)

#### Resources

[docs.ggplot2.org](http://docs.ggplot2.org/current/) --- index of `ggplot2` functions, what each can do, and examples
[R Graphics Cookbook](http://www.cookbook-r.com/Graphs/) --- list of general data graphics topics and how to do them with `ggplot2`

## `data.table`

My go-to data package. It is *incredibly* fast, easily handles *billions* of observations, and has, hands-down, the best file reader function (`fread`). I started using R to use the `data.table` package. It was necessary given the data I work with. I've never used the base R data structure `data.frame`. There was no point!

- Pros
	+ super fast!
	+ fast, easy way to merge data
	+ great file reader function, `fread`
- Cons
	+ not the most intuitive, big learning curve
	+ speed is sensitive to syntax

#### Resources

[`data.table` homepage](https://github.com/Rdatatable/data.table/wiki) --- everything you need to know about `data.table`
[Introduction to `data.table`](https://rawgit.com/wiki/Rdatatable/data.table/vignettes/datatable-intro-vignette.html) --- a vignette with a great intro
[Cheat Sheet by DataCamp](http://blog.datacamp.com/data-table-cheat-sheet/) --- a long, great cheat sheet for using `data.table`


## Objectives

We will be using two sample data sets from the `ggplot2` package to learn the basics: [`economics`](http://docs.ggplot2.org/current/economics.html) and [`diamonds`](http://docs.ggplot2.org/current/diamonds.html)

#### Outline

- Learn the basics of using `ggplot2`
	- [`qplot`](http://docs.ggplot2.org/current/qplot.html) --- 'quick plot'
	- [`ggplot`](http://docs.ggplot2.org/current/ggplot.html)
		+ aesthetics
			* `aes`
		+ geoms
			* `geom_line`
			* `geom_hline`
			* `geom_vline`
			* `geom_abline`
			* `geom_smooth`
			* `geom_bar`
			* `geom_histogram`
		+ position
			* `position_identity`
			* `position_dodge`
			* `position_fill`
			* `position_stack`
		+ statistics
			* `stat_bin`
			* `stat_density`
		+ themes
			* `theme`
- Learn the basics of `data.table`
	+ `fread` --- import data
	+ `setkey` --- setting keys
	+ `setname` --- changing column names
	+ row and column indexing
	+ creating new variables with `:=`
	+ fast aggregation
		* `list()`
		* `by`
- Optimally preparing data for `ggplot2` using `data.table` and `reshape2` 
	+ graphing "long" (aka "panel") data versus "wide"
- Automatically exporting graphs
	+ setting up file names with `png` `paste` and `paste0`
	+ exporting with `for` `print` and `dev.off()`
- Multiple plots
	+ packages `grid` and `gridExtra`
	+ `grid.arrange`
- Put it all into a function!
- Advanced
	+ adding a pause between outputs with user-created function `read_key`...
		```R
			readkey <- function() {
		    	cat("[press [enter] to continue]")
		 	   	number <- scan(n=1)
			}	
		```
	
	
	
	