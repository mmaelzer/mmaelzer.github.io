# Generate html from markdown using the wonderful mdp tool
mdp -i "src/*.md" -o . -t src/layout.html
# Uglify and concat our js files into a single bundle
uglifyjs -c -m -o static/bundle.js src/js/md-code-style.js src/js/prism.js
# Concat css
cat src/css/*.css > static/styles.css