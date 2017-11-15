all: hw07_automating-pipelines.md

clean:
	rm -f gapminder.tsv gap_reorder.RDS euro_pop_2002.png GDP_oceania.png GDP_lifeExp.png pop_lifeExp_2007.png pop_fit_total.RDS europe_fit.png

gapminder.tsv:
		curl -o gapminder.tsv https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv

gap_reorder.RDS GDP_oceania.png pop_lifeExp_2007.png GDP_lifeExp.png euro_pop_2002.png: gap_exploratory.R gapminder.tsv 
		Rscript $<
		
pop_fit_total.RDS: gap_statistical.R euro_pop_2002.png GDP_oceania.png GDP_lifeExp.png pop_lifeExp_2007.png gap_reorder.RDS gapminder.tsv
		Rscript $<
		
europe_fit.png: gap_figures.R gap_statistical.R euro_pop_2002.png GDP_oceania.png GDP_lifeExp.png pop_lifeExp_2007.png gap_reorder.RDS gapminder.tsv
		Rscript -e 'rmarkdown::render("words.en.rmd")'
	
hw07_automating-pipelines.md: hw07_automating-pipelines.Rmd gap_figures.R gap_statistical.R euro_pop_2002.png GDP_oceania.png GDP_lifeExp.png pop_lifeExp_2007.png gap_reorder.RDS gapminder.tsv
		Rscript -e 'rmarkdown::render("$<")'
		rm -f hw07_automating-pipelines.html
		


		

		
