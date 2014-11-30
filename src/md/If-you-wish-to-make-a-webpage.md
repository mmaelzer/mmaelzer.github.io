If you wish to make a webpage...
==========

>  If you wish to make a webpage, you must first boil the ocean.  
>  -Carl Sagan

I was in a quandry. I wanted to write some bloviating posts with stylized code snippets (sorry [medium](https://medium.com)). I didn't want to pay any money (sorry [svbtle](https://svbtle.com/)). I didn't want a solution that tries to do everything even though all I want to do is turn simple markdown files into html (sorry [jekyll](http://jekyllrb.com/)). So I did what millions of people before me have done, I reinvented the wheel.  
  
Behold [mdp](https://github.com/mmaelzer/mdp), a command line tool that takes markdown files and a template file and does exactly what I want, it generates stupid html files. As an added bonus, this gave me an opportunity to play around in [Go](https://golang.org/). 
  
Now I run a simple [build script](https://github.com/mmaelzer/mmaelzer.github.io/blob/master/build.sh) to generate the whole shebang.

### build.sh
```bash
# Generate html from markdown using the wonderful mdp tool
mdp -i "src/md/*.md" -o . -t src/layout.html
# Uglify and concat our js files into a single bundle
uglifyjs -c -m -o static/bundle.js $(find src/js/ -name "*.js")
# Concat our css files into a single file
cat src/css/*.css > static/styles.css
```