const gulp = require('gulp');

const tailwindConfig = "tailwind.config.js";
const mainCSS = "./Resources/MyTheme/theme.css";

gulp.task("css", function() {
    const atimport = require("postcss-import");
    const postcss = require("gulp-postcss");
    const tailwindcss = require("tailwindcss");
    const rename = require('gulp-rename');
    const cleanCSS = require('gulp-clean-css');

    return gulp
        .src(mainCSS)
        .pipe(postcss([atimport(), tailwindcss(tailwindConfig)]))
        .pipe(cleanCSS())
        .pipe(rename('styles.css'))
        .pipe(gulp.dest("./Resources/MyTheme/"));
});